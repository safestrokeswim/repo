@echo off
echo Deploying Refined Mobile-First Hero Section...

REM Add all changes
git add .

REM Commit with detailed message
git commit -m "Hero Section Mobile-First Refinement - Premium Trust Building

🎯 Major Improvements:
- Mobile: New cropped hero image (johnnydaveback - mobile.jpg) for optimal child visibility
- Desktop/Tablet: Maintains existing wide swim photo for emotional trust
- Premium frosted glass panel with refined opacity and positioning

📱 Mobile Optimization:
- Child's face clearly visible with mobile-optimized image
- White headline text for maximum contrast against photo background
- 85-90% panel width for balanced composition
- Stacked CTAs with 12-16px spacing

🖥️ Desktop Experience:
- Brand blue accent on 'Toddlers & Kids' for visual hierarchy
- Side-by-side CTAs with 16-20px spacing
- 60% max panel width, left-positioned over photo

✨ Enhanced Elements:
- Outfit SemiBold typography for premium feel
- Trust badge with gold stars (#FFD166) and navy background
- Middot-separated microcopy for clarity
- Layered wave divider with 3-gradient depth effect
- Responsive sticky CTA with adaptive height

🎨 Brand Colors Applied:
- Primary: #2284B8 (SafeStroke Blue)  
- Secondary: #0B3856 (Navy - 22-26% opacity)
- Supporting: #5EAEDD, #E9F5FC (Light Blues)
- Accent: #FFD166 (Gold), #2D96CC (Hover)

🔧 Technical Enhancements:
- 100svh viewport height with flex layout
- 8-10px backdrop blur for glass effect
- WCAG AA contrast compliance
- Reduced CTA height on devices <700px tall"

REM Push to main branch
git push origin main

echo.
echo ✅ Refined hero section deployed successfully!
echo 🚀 Mobile-first design now live on safestrokeswim.com
echo 📱 Parents will clearly see kids in the water on mobile devices
echo.
pause
