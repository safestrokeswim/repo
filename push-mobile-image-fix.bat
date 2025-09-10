@echo off
echo Fixing Mobile Hero Image Path...

REM Add all changes
git add .

REM Commit with bug fix message
git commit -m "Fix: Correct mobile hero image filename

- Updated CSS to use correct filename: johnnydaveback - mobile.jpg
- Fixes mobile background image not displaying issue
- Mobile hero now shows optimized child/instructor image"

REM Push to main branch
git push origin main

echo.
echo ✅ Mobile hero image fix deployed!
echo 📱 Background should now display correctly on mobile devices
echo.
pause
