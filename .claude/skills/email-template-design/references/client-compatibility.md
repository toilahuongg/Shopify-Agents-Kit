# Email Client Compatibility Reference

## Table of Contents

1. [Client Support Matrix](#client-support-matrix)
2. [Outlook Desktop Quirks](#outlook-desktop-quirks)
3. [Gmail Quirks](#gmail-quirks)
4. [Apple Mail / iOS](#apple-mail--ios)
5. [Yahoo Mail](#yahoo-mail)
6. [Dark Mode Per Client](#dark-mode-per-client)
7. [Background Images](#background-images)
8. [Web Fonts](#web-fonts)
9. [Common Fixes](#common-fixes)

---

## Client Support Matrix

| Feature | Gmail | Outlook (Desktop) | Outlook.com | Apple Mail | Yahoo | Mobile (iOS/Android) |
|---------|-------|--------------------|-------------|------------|-------|---------------------|
| `<style>` block | Yes (limited) | Yes | Yes | Yes | Yes | Yes |
| Media queries | No (Gmail App: partial) | No | Yes | Yes | No | iOS: Yes, Android: Varies |
| `max-width` | Yes | No | Yes | Yes | Yes | Yes |
| `border-radius` | Yes | No | Yes | Yes | Yes | Yes |
| CSS `background-image` | Yes | No (VML required) | Yes | Yes | Yes | Yes |
| Web fonts (`@import`) | No | No | No | Yes | No | iOS: Yes |
| `position`/`float` | No | No | Partial | Yes | Partial | Varies |
| CSS Grid / Flexbox | No | No | No | Yes | No | Partial |
| SVG | No | No | No | Yes | No | Partial |
| `<video>` | No | No | No | Yes (autoplay) | No | iOS: Yes |
| Dark mode CSS | No | No | Yes | Yes | No | iOS: Yes |
| `margin` on tables | Stripped | Ignored | Partial | Yes | Partial | Varies |

## Outlook Desktop Quirks

Outlook 2007-2021+ uses the Word rendering engine (MSO). Key issues:

- **No `border-radius`** — rounded corners require VML or image slices
- **No `max-width`** — use conditional `<!--[if mso]>` with fixed-width tables
- **No CSS `background-image`** — use VML:
  ```html
  <!--[if mso]>
  <v:rect xmlns:v="urn:schemas-microsoft-com:vml" fill="true" stroke="false" style="width:600px; height:300px;">
    <v:fill type="frame" src="https://example.com/bg.jpg" />
    <v:textbox style="mso-fit-shape-to-text:true" inset="0,0,0,0">
  <![endif]-->
  <div style="background-image:url('https://example.com/bg.jpg'); background-size:cover; padding:40px;">
    Content here
  </div>
  <!--[if mso]></v:textbox></v:rect><![endif]-->
  ```
- **Padding on `<a>` tags ignored** — wrap CTA in `<td>` with padding, or use VML roundrect (see SKILL.md CTA pattern)
- **Line-height rendering** — specify `line-height` in px, not unitless or em
- **DPI scaling issues** — include `<o:PixelPerInch>96</o:PixelPerInch>` in head (included in base template)
- **Image spacing** — always use `display:block` on images to remove phantom gaps
- **Table cell widths** — must use explicit `width` attributes, not CSS-only

## Gmail Quirks

- **Strips `<style>` in non-Gmail addresses** — inline styles are mandatory for reliable rendering
- **Removes `class` and `id` attributes** in some contexts — do not rely on class-based styling alone
- **Rewrites colors** — `#000000` may be rewritten in dark mode; use `!important` sparingly in `<style>` block
- **Strips `position`, `float`, `display:flex`, `display:grid`**
- **Max email size**: clips emails larger than **102KB** (shows "View entire message" link). Keep HTML under this limit.
- **Image proxy**: Gmail serves all images through its proxy, stripping original headers

## Apple Mail / iOS

The most capable email client:

- Full `<style>` block support, media queries, web fonts, CSS animations
- Supports `<video>` with autoplay
- Supports `prefers-color-scheme` media query
- Use Apple Mail as the upper bound for progressive enhancement features

## Yahoo Mail

- Supports `<style>` blocks but **not media queries**
- Strips `class` attributes that start with `yiv` or contain special characters
- Prefix class names to avoid conflicts (e.g., `.em-header` instead of `.header`)
- `max-width` works but `min-width` is stripped
- `background-image` in CSS works, but VML fallback still needed for Outlook

## Dark Mode Per Client

| Client | Dark mode behavior |
|--------|-------------------|
| Apple Mail / iOS Mail | Respects `@media (prefers-color-scheme: dark)`. Full CSS control. |
| Outlook.com / Outlook App | Partial auto-inversion. Respects `[data-ogsc]` and `[data-ogsb]` selectors. |
| Gmail (Android) | Auto-inverts light backgrounds. No CSS dark mode support. |
| Gmail (iOS) | Follows system dark mode, auto-inverts. Limited CSS control. |
| Yahoo | No dark mode support (always light rendering). |

### Defensive dark mode strategy

```html
<head>
  <meta name="color-scheme" content="light dark">
  <meta name="supported-color-schemes" content="light dark">
  <style>
    :root { color-scheme: light dark; }

    /* Apple Mail, Outlook.com */
    @media (prefers-color-scheme: dark) {
      .dark-bg { background-color: #1a1a2e !important; }
      .dark-text { color: #e0e0e0 !important; }
      .dark-img-light { display: none !important; }
      .dark-img-dark { display: block !important; }
    }

    /* Outlook App-specific (mobile) */
    [data-ogsc] .dark-bg { background-color: #1a1a2e !important; }
    [data-ogsc] .dark-text { color: #e0e0e0 !important; }
  </style>
</head>
```

### Logo swap technique

```html
<!-- Light mode logo (default) -->
<img src="logo-dark.png" alt="Logo" class="dark-img-light" style="display:block;">
<!-- Dark mode logo (hidden by default) -->
<img src="logo-light.png" alt="Logo" class="dark-img-dark" style="display:none;">
```

## Background Images

### CSS only (Gmail, Apple Mail, Yahoo, Outlook.com)
```html
<td style="background-image:url('https://example.com/bg.jpg'); background-size:cover; background-position:center;">
```

### VML fallback (Outlook Desktop)
See the VML pattern in the Outlook Desktop Quirks section above. Always pair CSS `background-image` with a VML wrapper using `<!--[if mso]>` conditionals.

## Web Fonts

Only Apple Mail and iOS Mail reliably support `@import` or `@font-face` web fonts.

```html
<style>
  /* Progressive enhancement — falls back to system font stack */
  @import url('https://fonts.googleapis.com/css2?family=Instrument+Serif&display=swap');
</style>
<!-- Usage with fallback -->
<td style="font-family: 'Instrument Serif', Georgia, 'Times New Roman', serif;">
```

Always declare a full system-font fallback stack. Never depend on the web font rendering.

## Common Fixes

### Phantom gaps below images
```html
<img style="display:block; line-height:0; font-size:0;" ...>
```

### Blue links on iOS (phone numbers, dates)
```html
<meta name="format-detection" content="telephone=no,address=no,email=no,date=no,url=no">
<!-- Or wrap in a styled span -->
<span style="color:#333333; text-decoration:none;">December 15, 2025</span>
```

### Outlook adding extra spacing
```html
<!-- On table cells -->
<td style="mso-line-height-rule:exactly; line-height:20px;">
```

### Gmail stripping styles from `<style>` block
Always duplicate critical styles inline. Use `<style>` only for resets, dark mode, and responsive breakpoints as progressive enhancement.

### Yahoo class name conflicts
Prefix all class names: `.em-header`, `.em-footer`, `.em-cta` instead of generic names.
