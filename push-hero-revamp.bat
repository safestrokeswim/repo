@echo off
echo ========================================
echo SafeStroke Hero Section Revamp - Git Push
echo ========================================
echo.

:: Add all changes
echo Adding changes to git...
git add .

:: Commit with descriptive message
echo Committing changes...
git commit -m "feat: Revamp hero section with specialized premium messaging

- Updated headline to 'North Jersey's Specialized Swim Academy for Toddlers & Kids'
- Added new supporting copy: 'Trusted instructors. Adaptive methods. Proven results.'
- Implemented mobile-first design with desktop left-text/right-image layout
- Added smooth fade-in animations and subtle hover effects
- Updated primary CTA to prominent green 'Book Your FREE Lesson' button
- Added secondary 'View Programs' outline button
- Enhanced visual hierarchy with brand colors (Navy #0B3856, Blue #2284B8, Green #23C552)
- Added floating trust indicators and premium visual elements
- Improved SEO with updated title and meta description
- Maintains brand consistency while emphasizing specialization and premium quality"

:: Push to GitHub
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo Push completed successfully!
echo ========================================
echo.
pause
