---
name: shopify-app-logo
description: Create, critique, regenerate, or validate Shopify App Store app logos/icons using Shopify's current app icon guidance. Use when the user asks for a Shopify app logo, Shopify App Store icon, app listing icon, Dev Dashboard app icon, branded square logo, logo prompt, icon validation, or review-safe visual direction for Shopify app submission.
---

# Shopify App Logo

## Core Standard

Use this skill for Shopify App Store app icons and Dev Dashboard icons. Do not use it for feature media images, screenshots, banners, or in-app sidebar icons unless the user explicitly asks for derivative sizes.

- Output size: `1200x1200`.
- Format: `PNG` or `JPEG`.
- Corners: keep the file square; Shopify rounds the corners automatically.
- Composition: bold, simple, recognizable at small size.
- Safe padding: keep the primary mark away from edges so automatic rounding does not crop it.
- Consistency: icon in Dev Dashboard and app listing must be identical.
- Avoid: text, screenshots, Shopify trademarks/logos, pricing, badges, ratings, rankings, guarantees, noisy detail, edge-to-edge marks.

For the source snapshot and rejection checklist, read `references/shopify-app-logo-2026.md` when exact standards matter.

## Workflow

1. Gather app context: app name, product category, key merchant benefit, brand colors, preferred symbol/metaphor, existing logo/assets, and target output path.
2. Design first: choose one simple icon metaphor, palette, shape language, padding, and contrast before generating.
3. Prefer a vector-like mark that remains legible at `48x48`; avoid detailed UI panels or mini screenshots.
4. Generate at `1200x1200` when the image tool supports exact sizing. If it does not, generate square and export/resize to `1200x1200`.
5. Validate the final icon with `scripts/validate_app_logo.py <image-path>`.
6. If the user needs app UI assets too, create derivatives after the master icon: `512x512`, `256x256`, `120x120`, favicon, or SVG source when appropriate.

## Prompt Pattern

Use this structure for logo/image generation prompts:

```text
Create a Shopify App Store app icon for [APP_NAME], a [APP_TYPE] app for [TARGET_MERCHANT].

Canvas: 1200x1200 square, PNG/JPEG-ready, square corners.
Visual direction: [brand colors], bold simple vector-like mark, premium SaaS, high contrast.
Core metaphor: [single symbol tied to app benefit].
Composition: centered icon mark, generous safe padding, recognizable at small sizes.
Do not include: text, letters unless they are part of a simple brand monogram, screenshots, Shopify logo or bag mark, pricing, badges, ratings, rankings, guarantees, statistics, busy details, rounded-corner mask baked into the image.
Style constraints: clean geometric shape language, no photo realism, no browser/app UI mockups, no edge-to-edge artwork.
```

## Visual Direction Rules

- Use one symbol, not a feature collage.
- Prefer distinctive shapes over generic gradients.
- Use strong silhouette and clear negative space.
- Keep any monogram extremely simple. Avoid spelling the app name inside the icon.
- Leave enough margin for Shopify's automatic rounded corners.
- Avoid thin strokes that disappear at small sizes.
- If brand color is supplied, use it. If not, choose a palette that fits the app category and state the rationale.

## Review-Safe Rules

Allowed:

- Abstract symbols tied to the app's core benefit.
- Simple monogram or brand mark if legible without text.
- Product-category metaphors like shield, sync arrows, spark, box, archive, cart, tag, image, chart, or workflow node.

Not allowed:

- "Free", "$9/month", "Sale", "50% off".
- "#1", "best", "only", "most powerful".
- Star ratings, review snippets, testimonial quotes.
- Shopify logo, Shopify bag, or lookalike trademarks.
- Screenshot of the app UI.
- Icon made mostly of text or app name.

## Validation Script

Run:

```bash
python3 /Users/devhugon/.codex/skills/shopify-app-logo/scripts/validate_app_logo.py /path/to/icon.png
```

The script verifies file existence, PNG/JPEG format, exact `1200x1200` dimensions, and square ratio. It cannot detect trademark/text/pricing violations, so still apply the checklist manually.
