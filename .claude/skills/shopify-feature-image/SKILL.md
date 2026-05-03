---
name: shopify-feature-image
description: Create, critique, or regenerate Shopify App Store feature images for app listings using Shopify's current App Store media guidance and the $imagegen skill for actual image generation/editing. Use when the user asks for a Shopify app feature image, App Store listing hero image, marketing image, listing media, image prompt, image validation, or review-safe visual direction for Shopify app submission.
---

# Shopify Feature Image

## Core Standard

Use this skill for Shopify App Store feature media images, not app icons or screenshots.

- Output size: `1600x900`, `16:9`.
- Format: `PNG` or `JPEG`.
- Composition: simple, one focal point, benefit-led, clear at small listing sizes.
- Accessibility: good contrast, target at least `4.5:1` for meaningful text or UI text.
- Required companion: provide concise alt text.
- Avoid: Shopify logos/trademarks, pricing, reviews/testimonials, statistics, guarantees, "best/#1/only/most powerful", duplicate app card subtitle text, image made only of the app logo, browser chrome, desktop backgrounds.

For the source snapshot and rejection checklist, read `references/shopify-app-store-feature-image-2026.md` when exact standards matter.

## Workflow

1. Gather app context: app name, primary merchant benefit, target merchant, feature to highlight, brand colors, app UI screenshots/assets if available, and whether the user wants an actual generated image or only a prompt.
2. Design first: define visual concept, focal point, hierarchy, color direction, safe zones, and text strategy before generating.
3. Keep text minimal. Prefer no text, or one short benefit phrase that is not the app card subtitle and contains no pricing, stats, rankings, guarantees, or unsupported claims.
4. If the user wants an actual image, invoke `$imagegen` for generation or editing. Pass the prompt from the Prompt Pattern section and include `Canvas: 1600x900, 16:9`.
5. If `$imagegen` cannot produce exact dimensions, generate in 16:9, then resize/export to `1600x900` before final delivery.
6. Validate the final image with `scripts/validate_feature_image.py <image-path>`.
7. Return the image path plus alt text and any compliance notes. If the image fails validation, fix it before finalizing.
8. If the user only asks for a prompt or creative direction, do not generate an image; return a ready-to-use `$imagegen` prompt plus the review checklist.

## Imagegen Usage

When creating or editing a real bitmap image, explicitly use `$imagegen`.

- For new images: produce a concise, complete prompt using the Prompt Pattern section, then call `$imagegen`.
- For edits from user-provided screenshots or existing images: preserve the useful product UI, remove browser chrome/unrelated backgrounds, and ask `$imagegen` to create a polished `1600x900` feature image.
- After generation: validate dimensions and format with the script. If the image is not `1600x900`, resize/export before delivering.
- Do not use `$imagegen` when the user only asks for text instructions, a compliance review, or a reusable prompt.

## Prompt Pattern

Use this structure for `$imagegen` prompts:

```text
Create a Shopify App Store feature image for [APP_NAME], a [APP_TYPE] app for [TARGET_MERCHANT].

Canvas: 1600x900, 16:9, PNG/JPEG-ready.
Visual direction: [brand colors], clean modern SaaS, premium but not generic, strong contrast.
Core benefit to show: [single merchant outcome].
Composition: one clear focal point, generous padding, no Shopify logo, no pricing, no ratings, no rankings, no statistics, no guarantees.
Content: [abstract product UI, dashboard cards, merchant workflow, illustration, or provided screenshot treatment].
Text: [none OR one short phrase], do not repeat the app card subtitle.
Accessibility: ensure readable contrast for any text/UI.
Style constraints: avoid browser chrome, desktop background, testimonial cards, app-logo-only composition, cluttered feature list.
```

## Visual Direction Rules

- Prefer a merchant outcome metaphor over a literal collage of features.
- Use one dominant object: a polished UI panel, product card, automation flow, backup timeline, analytics board, or before/after state.
- Keep edges and corners clean; assume Shopify may crop or display the image at reduced size.
- Use the app's real brand colors when supplied. If not supplied, choose a restrained palette and explain it.
- If screenshots are provided, crop into the app UI only; remove browser window chrome and unrelated backgrounds.
- If using text, keep it large, short, and factual.

## Review-Safe Copy Rules

Allowed:

- "Automate backups"
- "Restore with confidence"
- "Sync product data"
- "Recover deleted products"

Not allowed:

- "Free", "$9/month", "50% off"
- "#1 backup app", "best", "only", "most powerful"
- "Trusted by 10,000 stores"
- Star ratings, quotes, testimonials, review snippets
- Shopify logo or Shopify bag mark

## Validation Script

Run:

```bash
python3 /Users/devhugon/.codex/skills/shopify-feature-image/scripts/validate_feature_image.py /path/to/image.png
```

The script verifies file existence, PNG/JPEG format, exact `1600x900` dimensions, and `16:9` ratio. It cannot detect policy-copy violations, so still apply the checklist manually.
