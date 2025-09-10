@echo off
echo Finalizing SafeStroke Hero Section Updates...

REM Add all changes
git add .

REM Commit with detailed message
git commit -m "Finalize Premium Hero Section - Mobile-First Design

✨ Key Improvements:
- Premium frosted glass panel with refined styling
- Mobile-first approach: navy background with subtle brand graphics
- Desktop/tablet: enhanced swim photo positioning
- Fluid layered wave divider with 3 gradient layers
- Optimized typography: Outfit SemiBold, improved sizing
- Enhanced CTAs with better shadows and hover states
- Responsive trust badge and microcopy
- Adaptive sticky CTA height for different device sizes
- Full viewport height (100svh) with proper flex layout

🎨 Brand Colors Applied:
- Primary: #2284B8 (SafeStroke Blue)
- Secondary: #0B3856 (Navy)
- Supporting: #5EAEDD, #E9F5FC (Light Blues)
- Accent: #FFD166 (Gold stars)

📱 Mobile Optimizations:
- Solid navy background with decorative graphics
- Centered white text for maximum contrast
- Full-width stacked CTAs
- Reduced sticky CTA on short devices (<700px)
- Bottom padding accounts for sticky button

🎯 Conversion Focused:
- Clear value proposition
- Trust indicators
- No-risk messaging
- Premium visual hierarchy"

REM Push to main branch
git push origin main

echo.
echo ✅ Hero section finalization pushed to GitHub!
echo 🚀 Changes are now live on safestrokeswim.com
echo.
pause
