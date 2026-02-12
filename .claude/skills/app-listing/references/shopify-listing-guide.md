# Shopify App Store Listing Guide

Detailed rules, character limits, and examples for each listing section based on [Shopify's official best practices](https://shopify.dev/docs/apps/launch/shopify-app-store/best-practices#5-app-listing).

---

## Table of Contents

1. [App Introduction](#1-app-introduction)
2. [App Details](#2-app-details)
3. [Features](#3-features)
4. [App Card Subtitle](#4-app-card-subtitle)
5. [Search Terms](#5-search-terms)
6. [SEO Content](#6-seo-content)
7. [Testing Instructions](#7-testing-instructions)
8. [Branding](#8-branding)
9. [Screenshots & Media](#9-screenshots--media)

---

## 1. App Introduction

**Limit:** 100 characters

Clearly highlight the benefits merchants can expect. Tie your unique offering to measurable business outcomes.

### DO
- Lead with a clear benefit statement
- Connect to measurable outcomes (sales, efficiency, customer satisfaction)
- Use active language

### DON'T
- Keyword stuff
- Make data claims without evidence
- Leave sentences incomplete
- Use generic marketing language

### Examples

| ✅ DO | ❌ DON'T |
|-------|----------|
| We package and ship your orders. Fast, simple fulfillment can boost sales and delight customers. | Get your products shipped fast. We'll take care of all the busy work for you. |
| Create print-on-demand custom puzzles. More customization options can help increase product sales. | Custom puzzles. A creative solution to your print-on-demand needs. |
| Easily create personalized email campaigns. Buyer targeting can increase customer lifetime value. | App Name is a best in class customer platform. Email marketing, text automation, Facebook custom audiences. |

---

## 2. App Details

**Limit:** 500 characters

Describe functional elements and what makes the app unique.

### DO
- Focus on what the app does and how it solves problems
- Mention unique differentiators
- Use clear, concise language

### DON'T
- Use excessive marketing language
- Keyword stuff
- Make outcome guarantees
- Include support info, links, or testimonials (those have their own fields)

---

## 3. Features

**Limit:** Up to 80 characters per feature

Describe the functionality, not the technical mechanics. Keep features short and scannable—focus on what merchants care about.

### Examples

| ✅ DO | ❌ DON'T |
|-------|----------|
| Reports that show you sales data in real time | Reports that use the latest push technology to offer you sales data with only 250ms of latency |
| Drag and drop page builder | Page builder built on the latest React Native technology to ensure the most efficient page building experience |
| Customize details like shape and difficulty level in a full-screen experience | Print-on-demand, product customization, sales analytics, puzzles |

---

## 4. App Card Subtitle

**Limit:** ~80 characters

Highlight benefits to merchants rather than just describing functions.

### DO
- Focus on merchant outcomes and benefits
- Use action-oriented language

### DON'T
- Just list functions
- Include pricing or reviews
- Use keyword-heavy phrasing

### Examples

| ✅ DO | ❌ DON'T |
|-------|----------|
| Avoid lost sales by making pages load faster and improving SEO | Boost Pagespeed in 1 click. Increase conversions, SEO & Sales. |
| Pick products to sell from vetted manufacturers and suppliers | Dropship via Wholesale Distributors, Manufacturers & Suppliers |
| Control which customers access different parts of your store | Access control, for anything in your online store :) |

---

## 5. Search Terms

**Limit:** Up to 5 terms

### Rules
- Use complete words (not partial)
- Limit to one idea per term
- Don't repeat words from your app name

### Examples

| ✅ DO | ❌ DON'T |
|-------|----------|
| email marketing | email marketing for leads |
| inventory management | inventory |
| product reviews | reviews ratings social proof SEO |

---

## 6. SEO Content

### Title Tag
- **Limit:** Under 60 characters
- Follow [Google's title tag best practices](https://developers.google.com/search/docs/advanced/appearance/title-link)
- Format: `Brand — Primary Value Proposition`

### Meta Description
- **Limit:** Under 155 characters
- [Write effective meta descriptions](https://www.shopify.com/blog/how-to-write-meta-descriptions)
- Include a clear call-to-action or benefit statement
- Make it compelling to drive click-through from search results

---

## 7. Testing Instructions

Provide clear instructions that help the Shopify review team successfully test the full app.

### Format Rules
- Use numbered steps
- Use bullet points for sub-steps
- Include prerequisites (accounts, credentials, dependencies)
- Provide any app-specific settings or configuration
- Be concise and clear
- If the app integrates with third-party platforms, include valid test credentials
- Describe expected outcome for each test case

### Structure Template

```
### Prerequisites
- [List required tools, accounts, credentials]

### Installation Steps
1. [Step-by-step installation]

### Testing Core Functionality
1. [Feature 1 test steps]
   - Expected: [What should happen]
2. [Feature 2 test steps]
   - Expected: [What should happen]

### App-Specific Settings
- [Any configuration notes]

### Expected Outcome
- [Summary of what a successful test looks like]
```

---

## 8. Branding

### App Name
- Start with brand name, not generic descriptor
- Example: "QTeck - Announcement Bar" (not "Announcement Bar - QTeck")
- Max 30 characters
- Must align with TOML configuration name

### App Icon
- 1200px × 1200px, JPEG or PNG
- Bold colors, simple recognizable patterns
- No text, screenshots, or Shopify trademarks
- Square corners (automatically rounded)
- Include padding so logo doesn't touch edges

---

## 9. Screenshots & Media

### Feature Media
- Short video (2-3 min) or static image
- 1600px × 900px (16:9 ratio)
- Keep promotional, not instructional
- Limit screencasts to 25% of video
- Solid backgrounds with good contrast (4.5:1 ratio)
- Include alt text
- Don't use Shopify logos or repeat subtitle

### Screenshots
- 1600px × 900px (16:9)
- 3-6 desktop screenshots minimum
- At least one of app's UI
- Crop out browser chrome and sensitive info
- Include alt text
- No PII, pricing, reviews, or outcome guarantees
- Include mobile/POS screenshots if applicable
