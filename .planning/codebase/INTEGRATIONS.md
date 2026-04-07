# External Integrations

**Analysis Date:** 2026-04-07

## External Services

**None** — no backend APIs, databases, auth providers, analytics, or third-party services are integrated. This is a fully static, client-side-only website.

## CDN Resources

**Google Fonts CDN** — loaded on every page via `<link>` tags in `<head>`:
- Host: `https://fonts.googleapis.com` (stylesheet delivery)
- Host: `https://fonts.gstatic.com` (font file delivery, `crossorigin`)
- Preconnect hints are declared before each font load to reduce latency

## Fonts & Icons

**Google Fonts (remote, loaded on every page):**

| Font | Weights | Usage | CSS Class |
|------|---------|-------|-----------|
| Covered By Your Grace | 400 | Quote text | `.quote` |
| Montserrat | 200, 400 | Body text | `body` default via `font-family` |
| Oswald | 200, 400 | Headings / display text | `.large`, `.medium-spacing`, `.medium-spacing-halfsize` |

Font URLs loaded per page (identical across all HTML files):
```html
https://fonts.googleapis.com/css2?family=Covered+By+Your+Grace&display=swap
https://fonts.googleapis.com/css2?family=Montserrat:wght@200&display=swap
https://fonts.googleapis.com/css2?family=Montserrat:wght@400&display=swap
https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap
https://fonts.googleapis.com/css2?family=Oswald:wght@400&display=swap
```

**Fallback stack (CSS):**
- Body: `'Montserrat', Arial, sans-serif`
- Display: `'Oswald', Arial, sans-serif`
- Quote: `'Covered By Your Grace', cursive, sans-serif`

**Local icon images (self-hosted in `assets/`):**
- `assets/linkedin.png` — LinkedIn social link icon
- `assets/github.png` — GitHub social link icon
- `assets/email.png` — Email contact icon

**Icon attribution (not loaded remotely — credit in `index.html` footer):**
- Flatart, Font Awesome, Microsoft Fluent, Chanut Is Industries, Kalash — via Iconfinder

## APIs

**None** — no REST APIs, GraphQL endpoints, or web APIs are called.

## Authentication & Identity

**None** — no login, no auth provider, no session management.

## Data Storage

**None** — no database, no localStorage, no sessionStorage, no cookies.

## Analytics & Monitoring

**None** — no Google Analytics, no error tracking, no performance monitoring.

## Social & External Links (template placeholders)

These are placeholder `href` values in the template HTML that the user replaces with their own URLs. They are outbound navigation links only — no SDK or embed is loaded:

| Service | File | Purpose |
|---------|------|---------|
| LinkedIn | `index.html` | Contact section link |
| GitHub | `index.html`, `portfolio.html` | Contact / portfolio link |
| Email (`mailto:`) | `index.html` | Contact email link |
| Behance | `portfolio.html` | Portfolio external link |
| Instagram | `portfolio.html` | Portfolio external link |
| Facebook | `portfolio.html` | Portfolio external link |
| ZeroToMastery Academy | `about-me.html` | Education reference link |

## Illustration Attribution (self-hosted assets)

Illustrations are local PNG files in `assets/` — downloaded from Storyset and included statically:
- `assets/Contact-me-img.png`
- `assets/about-me.png`, `assets/about-me-home.png`, `assets/about-me1.png`, `assets/about-me2.png`
- Storyset credit: `https://storyset.com/work`

## Webhooks & Callbacks

**None.**

## Environment Configuration

**Not applicable** — no `.env` file or environment variables exist.

---

*Integration audit: 2026-04-07*
