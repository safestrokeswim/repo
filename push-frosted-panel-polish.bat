@echo off
echo Deploying Frosted Panel Polish & Mobile Refinements...

REM Add all changes
git add .

REM Commit with detailed message
git commit -m "Hero Section Frosted Panel Polish - Premium Mobile Experience

✨ Frosted Panel Improvements:
- Reduced opacity: 26% → 18-20% for lighter, less heavy feel
- Increased backdrop blur: 8-10px range for softer background effect
- Repositioned panel lower to show more of child's face
- Maintained 85-90% width on mobile for visual balance

📱 Mobile Background Optimization:
- Recentered image focal point: center 20% positioning
- Child's face now more centered and visible above panel
- Maintains full 100svh viewport coverage
- Enhanced contrast with stronger text shadows

🎨 Enhanced CTAs:
- Secondary button: 3px bright white border for stronger outline
- Improved hover states with scale transform
- Better visual hierarchy and accessibility

⭐ Trust Badge Polish:
- Single line layout with enhanced spacing
- Extra padding around gold stars for breathing room
- Intelligent wrapping on very small screens
- Centered alignment on mobile

🌊 Enhanced Wave Divider:
- Increased height: 100px → 120px for stronger presence
- 3 layered SVG paths with enhanced opacity gradients
- More fluid, dramatic water effect
- Better section transition

📝 Typography Refinements:
- Tighter line height: 1.1-1.15 for less boxy feel
- Enhanced text shadows for bright water highlights
- Consistent 16-18px subheadline sizing
- Improved mobile contrast

🔧 Technical Enhancements:
- Better mobile positioning with flex-end alignment
- Enhanced backdrop-filter effects
- Improved responsive padding and spacing
- WCAG AA contrast maintained throughout"

REM Push to main branch
git push origin main

echo.
echo ✅ Frosted panel polish deployed successfully!
echo 🌟 Mobile hero now feels lighter with better face visibility
echo 💎 Premium glass effect with enhanced readability
echo.
pause
