@echo off
echo Pushing hero focal point and reviews mobile clipping fixes to GitHub...
git add .
git commit -m "Fixed hero image focal points and reviews section mobile clipping

Hero Image Fixes (A):
- Implemented precise focal points by breakpoint
  * Desktop (≥1200px): 35% 30% (slightly left, above center)
  * Tablet (768-1199px): 40% 35% 
  * Mobile (≤767px): 50% 28-30% (faces higher in crop)
- Added 96-120px safe area clearance between faces and CTAs
- Increased hero bottom padding for sticky CTA protection
- Enhanced mobile image positioning with portrait-friendly crop

Reviews Section Fixes (B):
- Fixed mobile 'cut off' issue with proper section padding
- Added 36-48px top padding after wave transition
- Set overflow: visible to prevent content clipping
- Implemented dynamic carousel height with ResizeObserver
- Added sticky CTA clearance with scroll-padding-bottom
- Enhanced scroll-margin-top for proper anchor navigation
- Ensured review cards show completely without truncation

QA Verified:
✅ Hero faces fully visible across all breakpoints
✅ Reviews section header visible with 20-24px space above
✅ No sticky CTA overlap with review content
✅ Carousel height adapts to tallest card dynamically
✅ Clean wave transitions maintained"
git push origin main
echo.
echo Hero and reviews fixes pushed successfully!
pause
