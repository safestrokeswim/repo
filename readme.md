# SafeStroke Website Setup Guide

## Overview
This is the SafeStroke swimming lessons booking website with Stripe payments, Supabase backend, and a powerful content management system.

## Quick Setup Guide

### 1. Set Up Supabase Database
1. Go to [supabase.com](https://supabase.com) and create a free account
2. Create a new project
3. Go to the SQL Editor in your Supabase dashboard
4. Copy and paste the contents of `database-schema-updated.sql` 
5. Run the SQL to create your tables
6. Go to Settings > API to get your project URL and keys

### 2. Set Up Stripe
1. Go to [stripe.com](https://stripe.com) and create an account
2. Get your test API keys from the Stripe dashboard
3. You'll need both the publishable key (pk_test_...) and secret key (sk_test_...)

### 3. Upload to GitHub (you've already done this!)
- Your code should now be in a GitHub repository

### 4. Deploy to Netlify via Git
1. Go to [netlify.com](https://netlify.com)
2. Click "New Site from Git"
3. Choose GitHub and select your repository
4. Deploy settings:
   - Build command: (leave empty)
   - Publish directory: `.`
5. Click "Deploy site"

### 5. Set Environment Variables in Netlify
1. In your Netlify site dashboard, go to Site Settings > Environment Variables
2. Add these variables (get values from Supabase and Stripe):
   ```
   STRIPE_SECRET_KEY=sk_test_your_actual_key_here
   SUPABASE_URL=https://your-project.supabase.co
   SUPABASE_SERVICE_KEY=your_service_role_key_here
   ```

### 6. Update Stripe Key in Your Code
Edit `booking-logic.js` and update line 56 with your Stripe publishable key:
```javascript
const stripePublicKey = 'pk_test_your_actual_publishable_key_here';
```

## Files Created
- `netlify/functions/create-payment.js` - Handles Stripe payments
- `netlify/functions/validate-package.js` - Validates booking codes  
- `netlify/functions/book-class.js` - Handles class bookings
- `database-schema-updated.sql` - Database setup script
- `.env.example` - Shows what environment variables you need
- `admin.html` - Content management interface

## Testing
Once deployed, your website will be able to:
- Accept payments for lesson packages
- Generate unique booking codes
- Allow customers to book classes with their codes
- Store everything in your Supabase database

## Content Management System

### ✅ What's Set Up
Your website has a powerful, reliable content management system:

- ✅ **Zero Build Dependencies** - No build failures ever
- ✅ **Visual Content Editor** - Easy-to-use interface at `/admin.html`
- ✅ **JSON-Based Content** - Simple, reliable data storage
- ✅ **Auto-Sync Content** - Changes appear instantly on your site
- ✅ **Team-Friendly** - Non-technical users can edit content

### How to Edit Content

#### Method 1: Visual Content Editor (Recommended)
1. Visit `https://yoursite.netlify.app/admin.html`
2. Edit content in the user-friendly interface
3. Click "Generate Code" to get updated JSON
4. Copy and paste the JSON into your content files
5. Commit to GitHub - changes go live instantly!

#### Method 2: Direct File Editing
```bash
# Edit content files directly:
# content/site.json     - Navigation, contact info, global content
# content/home.json     - Homepage content, hero section, reviews
```

#### Method 3: Local Development
```bash
# Install and run locally
npm install
npm run dev
# Site available at http://localhost:5173
# Admin interface at http://localhost:5173/admin.html
```

### Editable Content Areas

| Section | What You Can Edit | How to Edit |
|---------|------------------|-------------|
| **Navigation** | Menu items, labels, "Book Now" button | Admin interface → Site Settings |
| **Hero Section** | Headlines, taglines, button text | Admin interface → Homepage Content |
| **Contact Info** | Phone number, address | Admin interface → Site Settings |
| **Reviews** | Testimonials, ratings, customer names | Admin interface → Homepage Content |
| **Trust Elements** | Badge text, family count | Admin interface → Homepage Content |

### How Content Updates Work
1. Edit content via admin interface or JSON files
2. Commit changes to GitHub
3. Netlify automatically deploys (no build step needed)
4. JavaScript hydration script updates the page content
5. Changes appear instantly on your live site

### Content Structure
```
content/
├── site.json     # Global site content
│   ├── navItems  # Navigation menu
│   ├── phone     # Contact phone
│   ├── address   # Business address
│   └── ctaLabel  # Call-to-action button text
│
└── home.json     # Homepage content
    ├── heroHeadline    # Main headline
    ├── heroSubhead     # Subtitle
    ├── trustBadgeText  # Trust indicator
    ├── reviews         # Customer testimonials
    └── [more fields]   # Other homepage content
```

### Adding New Editable Content
1. Add new field to appropriate JSON file
2. Add `data-sb-field-path="newFieldName"` to HTML element
3. Content will automatically sync via hydration script

### Benefits of This Approach
- ✅ **100% Reliable Deployments** - No build can fail
- ✅ **Visual Editing Interface** - User-friendly admin panel
- ✅ **Instant Updates** - Edit → Commit → Live (30 seconds)
- ✅ **Team Friendly** - Perfect for non-technical users
- ✅ **Future Proof** - Can integrate any CMS later
- ✅ **No Dependencies** - No external services required

## Need Help?
If you get stuck, check:
1. Netlify Functions logs (in Netlify dashboard > Functions)
2. Supabase logs (in Supabase dashboard > Logs)
3. Browser console for frontend errors
4. Admin interface: Visit `/admin.html` for content editing
5. Content files: Check `/content/` directory for your JSON files
