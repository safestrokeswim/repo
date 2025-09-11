# SafeStroke Website Setup Guide

## Overview
This is the SafeStroke swimming lessons booking website with Stripe payments and Supabase backend.

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

## Testing
Once deployed, your website will be able to:
- Accept payments for lesson packages
- Generate unique booking codes
- Allow customers to book classes with their codes
- Store everything in your Supabase database

## Visual Editor (Stackbit) Setup

### What's Already Configured
Your website is fully set up with Netlify's Visual Editor (Stackbit) for click-to-edit content:

- ✅ Stackbit configuration (`stackbit.config.ts`)
- ✅ Content JSON files in `/content/` directory
- ✅ HTML annotations with `data-sb-*` attributes
- ✅ Client-side content hydration script
- ✅ NPM dependencies and scripts

### How to Use Visual Editor

#### Local Development
```bash
# Install dependencies
npm install

# Start local development server
npm run dev
# Site will be available at http://localhost:5173

# In another terminal, start Visual Editor
npm run sb:dev
# Follow the URL provided to open Visual Editor
```

#### Production Editing
1. Go to your Netlify site dashboard
2. Navigate to **Visual Editor** tab
3. Click elements on your site to edit them
4. Click **Publish** to commit changes to GitHub
5. Netlify will automatically deploy the updates

#### Editable Content
- **Navigation menu** (links and labels)
- **Hero section** (headline, subtext, buttons)
- **Trust badges** (reviews count, testimonials)
- **Reviews section** (individual reviews, ratings)
- **Contact information** (phone, address)
- **Call-to-action buttons** (text and links)

#### Adding New Editable Content
1. Add new fields to `stackbit.config.ts` models
2. Update corresponding JSON files in `/content/`
3. Add `data-sb-field-path` attributes to HTML elements
4. Content will automatically sync via the hydration script

### Content Structure
- `content/site.json` - Global site content (nav, contact info)
- `content/home.json` - Homepage-specific content (hero, reviews)

## Need Help?
If you get stuck, check:
1. Netlify Functions logs (in Netlify dashboard > Functions)
2. Supabase logs (in Supabase dashboard > Logs)
3. Browser console for frontend errors
4. Stackbit Visual Editor documentation: https://docs.stackbit.com