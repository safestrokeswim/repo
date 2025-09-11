(async function () {
  // Map of object-id -> cached JSON
  const cache = new Map();

  // Helper: load JSON once per object-id
  async function loadContent(objectId) {
    if (!cache.has(objectId)) {
      try {
        const res = await fetch('/' + objectId.replace(/^\/+/, ''));
        if (!res.ok) throw new Error('Failed to load ' + objectId);
        cache.set(objectId, await res.json());
      } catch (error) {
        console.warn('Failed to load content:', objectId, error);
        return null;
      }
    }
    return cache.get(objectId);
  }

  // Set text or attribute depending on element type
  function applyValue(el, value) {
    if (!el || value === undefined || value === null) return;
    
    if (el.tagName === 'IMG') {
      if (typeof value === 'string') el.setAttribute('src', value);
    } else if (el.tagName === 'A' && el.hasAttribute('href')) {
      // For links, update both href and text content
      if (el.hasAttribute('data-sb-field-path')) {
        const fieldPath = el.getAttribute('data-sb-field-path');
        if (fieldPath.includes('href') || fieldPath.includes('Href')) {
          el.setAttribute('href', value);
        } else {
          el.textContent = (value ?? '').toString();
        }
      }
    } else if (el.hasAttribute('data-sb-html')) {
      el.innerHTML = value ?? '';
    } else {
      el.textContent = (value ?? '').toString();
    }
  }

  // Resolve dot path inside object (e.g., "reviews.0.quote")
  function getByPath(obj, path) {
    if (!path || path === '.') return obj;
    const parts = path.replace(/^\./, '').split('.');
    return parts.reduce((acc, key) => (acc == null ? acc : acc[key]), obj);
  }

  // For list fields (e.g., reviews, navItems), handle templated children
  function hydrateList(container, list) {
    if (!Array.isArray(list)) return;
    
    const children = Array.from(container.children);
    
    // If there are fewer template nodes than items, clone the last one
    while (children.length < list.length && children.length > 0) {
      const clone = children[children.length - 1].cloneNode(true);
      container.appendChild(clone);
      children.push(clone);
    }
    
    // Hide extra children if we have more templates than data
    children.forEach((child, i) => {
      if (i >= list.length) {
        child.style.display = 'none';
        return;
      } else {
        child.style.display = '';
      }
      
      // Update this child's data-sb-field-path attributes for the current index
      const descendants = child.querySelectorAll('[data-sb-field-path]');
      descendants.forEach((node) => {
        const subPath = node.getAttribute('data-sb-field-path');
        if (subPath && subPath.startsWith('.')) {
          // Replace the index in the path with the current index
          const newPath = subPath.replace(/\.\d+/, '.' + i);
          node.setAttribute('data-sb-field-path', newPath);
          const val = getByPath(list, newPath.slice(1));
          applyValue(node, val);
        }
      });
    });
  }

  // Main pass: for each data-sb-object-id section, fetch JSON and apply fields
  const sections = document.querySelectorAll('[data-sb-object-id]');
  for (const section of sections) {
    const objectId = section.getAttribute('data-sb-object-id');
    try {
      const data = await loadContent(objectId);
      if (!data) continue;
      
      const nodes = section.querySelectorAll('[data-sb-field-path]');
      nodes.forEach((el) => {
        const path = el.getAttribute('data-sb-field-path');
        const value = getByPath(data, path);
        
        // Handle list containers
        if (Array.isArray(value)) {
          hydrateList(el, value);
        } else {
          applyValue(el, value);
        }
      });
    } catch (e) {
      console.warn('Content hydrate failed for', objectId, e);
    }
  }
})();
