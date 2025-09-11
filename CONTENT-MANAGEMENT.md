# SafeStroke Content Management (No-Build Setup)

## Overview
This simplified setup gives you all the benefits of content management through JSON files without build dependencies that could cause deployment issues.

## How It Works
- ✅ Content stored in JSON files (`content/site.json`, `content/home.json`)
- ✅ Client-side hydration updates content automatically
- ✅ HTML annotations with `data-sb-*` attributes preserved
- ✅ Team can edit JSON files directly or through any JSON editor
- ✅ No build step required - deploys instantly

## Editing Content

### Method 1: Direct JSON Editing
Edit the JSON files directly in your repository:
- `content/site.json` - Navigation, contact info, global content
- `content/home.json` - Homepage content, hero, reviews

### Method 2: Using a JSON Editor
Use online JSON editors for a better editing experience:
1. Copy content from your JSON files
2. Edit in https://jsoneditoronline.org/
3. Paste back into your files
4. Commit to GitHub

### Method 3: Simple CMS Interface
You can add a simple admin interface later using tools like:
- Forestry.io (free tier available)
- Netlify CMS (open source)
- Tina.io (modern alternative)

## Deployment
```bash
# Your current deployment is already optimized
# Just commit JSON changes and Netlify deploys automatically
git add content/
git commit -m "Update content"
git push origin main
```

## Benefits of This Approach
- ✅ Zero build failures
- ✅ Instant deployments  
- ✅ Same editing flexibility
- ✅ No complex dependencies
- ✅ Easy to maintain
- ✅ Can upgrade to full CMS later
