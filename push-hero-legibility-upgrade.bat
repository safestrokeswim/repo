@echo off
echo Pushing hero section legibility upgrades to GitHub...
git add .
git commit -m "Enhanced hero section legibility with targeted overlays and typography improvements

- Added left→right readability scrim with precise opacity values
- Implemented soft radial vignette under headline cluster  
- Enhanced typography: pure white H1 with separation shadow
- Improved button contrast with subtle white keylines
- Enhanced trust badge with navy backdrop blur for clarity
- Added responsive scrim tuning across breakpoints
- Maintained full-bleed design without boxed panels
- Improved accessibility and WCAG AA contrast compliance"
git push origin main
echo.
echo Hero legibility upgrades pushed successfully!
pause
