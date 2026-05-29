# Slate Notes — Landing Page

A fully responsive, static landing page for the **Slate Notes** Flutter app, built with [Jaspr](https://docs.page/schultek/jaspr) (Dart SSG framework) and styled with [Tailwind CSS](https://tailwindcss.com).

---

## Features

- **Global dark / light theme** — one toggle switches the entire page
- **Real app screenshots** — dark and light mode screenshots swap with the theme
- **YouTube Shorts embed** — app demo video inside a pixel-perfect phone bezel
- **Single-variable branding** — change `primaryColor` in one file to re-theme everything
- **Fully responsive** — mobile-first grid, collapses gracefully on all screen sizes
- **Interactive FAQ** — native `<details>` / `<summary>` accordion, zero JS
- **Interactive theme preview** — live dark/light toggle inside the preview card
- **PWA ready** — manifest, 192 × 512 icons, apple-touch-icon

---

## Tech Stack

| Layer | Tool |
|---|---|
| Framework | [Jaspr](https://docs.page/schultek/jaspr) `^0.23.1` (Dart, SSG mode) |
| Styling | [Tailwind CSS Play CDN](https://tailwindcss.com/docs/installation/play-cdn) |
| Font | [Inter](https://fonts.google.com/specimen/Inter) via Google Fonts |
| Icons | [Heroicons v2](https://heroicons.com) outline (inline SVG paths) |
| Video | YouTube Shorts `<iframe>` embed |
| Build | `build_runner` + `jaspr_builder` |

---

## Project Structure

```
note_app_landing/
├── lib/
│   ├── app.dart                        # Root StatefulComponent — owns isDark state
│   ├── main.server.dart                # SSG entrypoint, Tailwind config, meta tags
│   ├── main.client.dart                # Client hydration entrypoint
│   ├── constants/
│   │   └── theme.dart                  # ← Change primaryColor here
│   └── components/
│       ├── navbar.dart                 # Fixed top nav + theme toggle button
│       ├── hero_section.dart           # Headline + real phone screenshot
│       ├── features_section.dart       # 2×2 feature card grid
│       ├── video_section.dart          # YouTube Shorts in phone bezel
│       ├── faq_section.dart            # Collapsible FAQ accordion
│       ├── theme_preview_section.dart  # Interactive dark/light app preview
│       └── footer_section.dart         # Links, data-rights disclaimer
└── web/
    ├── favicon.png                     # 32×32 browser tab icon
    ├── manifest.json                   # PWA manifest
    ├── icons/
    │   ├── Icon-192.png
    │   ├── Icon-512.png
    │   ├── Icon-maskable-192.png
    │   └── Icon-maskable-512.png
    └── images/
        ├── logo.png                    # App logo (navbar + footer)
        ├── app-home-dark.jpeg          # Real app screenshot — dark mode
        ├── app-home-light.jpeg         # Real app screenshot — light mode
        ├── banner.png                  # Feature / store banner
        └── note_banner.png             # Alternative banner
```

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.10.0`
- [Dart SDK](https://dart.dev/get-dart) `>=3.10.0`

### Install dependencies

```bash
flutter pub get
```

### Run in development

```bash
dart run jaspr serve
```

The dev server starts at `http://localhost:8080` with hot-reload.

### Build for production (static output)

```bash
dart run jaspr build
```

Output lands in `build/jaspr/`. Upload the contents of that folder to any static host (Netlify, Vercel, Firebase Hosting, GitHub Pages, etc.).

---

## Customisation

### Change the primary accent color

Open `lib/constants/theme.dart` and change the single constant:

```dart
// lib/constants/theme.dart

/// Change this to any Tailwind color name.
/// Options: 'emerald'  'violet'  'blue'  'teal'  'rose'  'amber'  'cyan'  'indigo'
const primaryColor = 'emerald';
```

Every button, badge, icon, glow, shadow, and hover state across all sections updates automatically — no other files need touching.

### Add / swap app screenshots

Replace the files in `web/images/`:

| File | Used for |
|---|---|
| `web/images/app-home-dark.jpeg` | Hero section — dark mode |
| `web/images/app-home-light.jpeg` | Hero section — light mode |
| `web/images/logo.png` | Navbar logo + footer logo |

### Change the YouTube demo video

In `lib/components/video_section.dart`, update the video ID in `_embedUrl`:

```dart
static const _embedUrl =
    'https://www.youtube.com/embed/YOUR_VIDEO_ID'
    '?autoplay=1&mute=1&loop=1&playlist=YOUR_VIDEO_ID'
    '&rel=0&playsinline=1';
```

Also update the external link `href` a few lines below it.

### Edit content (text, features, FAQ)

| What to edit | File |
|---|---|
| Hero headline / subtext / stats | `lib/components/hero_section.dart` |
| Feature cards (title, description, icon) | `lib/components/features_section.dart` |
| FAQ questions & answers | `lib/components/faq_section.dart` |
| Footer links | `lib/components/footer_section.dart` |
| Page `<title>` and meta description | `lib/main.server.dart` |

### Update the favicon and PWA icons

Replace `web/favicon.png` and the files inside `web/icons/` with your own images. Recommended sizes:

- `favicon.png` — 32 × 32 px
- `Icon-192.png` / `Icon-maskable-192.png` — 192 × 192 px
- `Icon-512.png` / `Icon-maskable-512.png` — 512 × 512 px

---

## Page Sections

| Section | ID | Description |
|---|---|---|
| NavBar | — | Fixed top bar with logo, nav links, theme toggle, Download CTA |
| Hero | `#hero` | Two-column: headline + real phone screenshot |
| Features | `#features` | 2 × 2 card grid (Local DB, Security, Themes, Cloud) |
| Security | `#security` | Anchor inside the features grid |
| Demo | `#demo` | YouTube Shorts in portrait phone bezel + 4 highlights |
| Theme Preview | `#theme` | Interactive dark/light toggle with live app card preview |
| FAQ | `#faq` | 5-item native accordion |
| Footer | — | 4-column links, data-rights disclaimer, copyright |

---

## Deployment

The build output (`build/jaspr/`) is pure static HTML + JS — deploy anywhere:

**Netlify**
```bash
# Build command:   dart run jaspr build
# Publish dir:     build/jaspr
```

**Vercel** — add a `vercel.json` at the project root:
```json
{
  "buildCommand": "dart run jaspr build",
  "outputDirectory": "build/jaspr"
}
```

**GitHub Pages** — push the contents of `build/jaspr/` to a `gh-pages` branch.

---

## License

MIT — feel free to use this template for your own app's landing page.
