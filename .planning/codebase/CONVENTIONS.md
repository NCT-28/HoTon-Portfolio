# Coding Conventions

**Analysis Date:** 2026-04-07

## HTML Patterns

**Doctype and Language:**
- All pages declare `<!DOCTYPE html>` and `<html lang="en">`

**Head boilerplate (identical across all pages):**
- `<meta charset="UTF-8">`, viewport meta, and three placeholder metas (description, keywords, author)
- Favicon linked only in `index.html` (via `<link rel="shortcut icon">` + `<link rel="icon">`)
- CSS loaded via `<link rel="stylesheet" type="text/css" href="...">` — always explicit `type="text/css"`
- Six Google Fonts `<link>` blocks per page (two fonts, three weights): Covered By Your Grace, Montserrat (200 & 400), Oswald (200 & 400); `<link rel="preconnect">` repeated redundantly across pages

**CSS loading order (subpages):**
1. `style.css` (global base)
2. `style-about-me.css` (shared on about-me, portfolio, skill-set due to shared media queries)
3. Page-specific CSS (`style-portfolio.css`, `style-skill-set.css`, `style-project.css`)

**Semantic elements used:**
- `<nav>`, `<header>`, `<article>`, `<footer>` — used once each in their semantic roles
- `<section>` — heavily overloaded as both content sections AND layout grid cells/columns; not separated into layout vs. semantic usage

**Navigation pattern:**
- CSS-only hamburger toggle: `<input type="checkbox" id="drop">` + `<label for="drop" class="toggle">` — no JavaScript
- Nav hidden at `<510px` via `.main-nav { display: none }` revealed by `#drop:checked + .main-nav { display: block }`

**External links:** always use `target="_blank"` — no `rel="noopener noreferrer"` present (security gap)

**Image pattern:** `<img class="max-width" src="assets/..." alt="descriptive-name">` — alt text present on all content images; decorative contact icons use `alt=""`

**No JavaScript** in any file — the entire site is pure HTML + CSS.

## CSS Patterns

**File organization:**
- `style.css` — all global, reusable utility and component classes (~750 lines)
- `style-about-me.css` — media query overrides for the two-column → single-column breakpoints; shared by portfolio and skill-set pages
- `style-portfolio.css` — 9-line media query override only
- `style-skill-set.css` — 9-line single media query (`grid-flip` ordering on mobile)
- `style-project.css` — column hover effect + dark mode override for `.baby-pink-light`

**Internal structure of `style.css`:**
Sections separated by comment blocks:
```css
/* SECTION NAME */
/* content */
/*-------------------------------------------*/
```
Sections in order: BODY, GENERAL (fonts, colors, alignment, spacing, misc), ANIMATIONS, NAV, FOOTER, INTRODUCTION, SKILLS, PROJECTS, CONTACT ME, SPECIAL THANKS, RESPONSIVENESS, DARK THEME

**Color palette (all inline values, no CSS variables):**
- Pink gradient: `linear-gradient(135deg, rgb(250, 113, 283) 0%, rgb(255, 142, 134) 60%)` — reused in `.large`, `.colorful-letter`, progress bar fills
- Background pink: `rgba(253, 129, 187, 0.3)` — baby pink
- Dark bg: `rgba(45, 45, 45, 1)` — dark mode body
- Nav bg light: `rgb(253, 249, 249)`

**Vendor prefixes used:**
- `-webkit-text-size-adjust`, `-webkit-background-clip`, `-webkit-text-fill-color`, `-webkit-background`, `-webkit-border-radius`, `-webkit-sticky`, `-webkit-transition`

**Units:**
- `rem` for font sizes, `px` for margins/padding/dimensions, `%` for flex/grid widths and progress bar fills

**No CSS custom properties (variables)** — all values are hardcoded literals.

**Animations:** `@keyframes` used for progress bar fill animations on `skill-set.html`; each skill has its own named animation (`html`, `css`, `javascript`, `php`, `comm-adapt`, `team-player`, `problem-solving`, `open-minded`).

## Naming Conventions

**Files:**
- HTML pages: kebab-case (`about-me.html`, `skill-set.html`, `project1.html`)
- CSS files: `style-[page-name].css` (`style-about-me.css`, `style-skill-set.css`, `style-project.css`)
- Assets: kebab-case (`about-me1.png`, `profile-pic.png`, `github-portfolio-template-demo.JPG`)

**CSS classes:** all kebab-case — no camelCase, no BEM, no underscore variants
- Utility classes: `.padding`, `.padding-top`, `.center`, `.justify`, `.bold`, `.italic`, `.uppercase`, `.max-width`, `.max-height`, `.align-center`, `.margin-auto`
- Layout classes: `.grid-system-2`, `.grid-system-4`, `.wrapper`, `.column`, `.w-900`, `.flex`
- Component classes: `.main-nav`, `.main-title`, `.main-title-large`, `.progress-bar`, `.box-contact`, `.nav-icon`, `.button-outline`, `.button`, `.card`
- Theme/color classes: `.baby-pink`, `.baby-pink-light`, `.colorful-letter`
- Typography classes: `.large`, `.medium-spacing`, `.medium-spacing-halfsize`, `.small`, `.quote`

**HTML IDs:** kebab-case (`main-toggle`, `contact-me`), with one plain word (`drop`)

## Layout Approaches

**Max-width container:** `.w-900` (`max-width: 900px; margin: auto`) applied to most page sections

**Two-column grid:** `.grid-system-2` (`display: grid; grid-template-columns: repeat(2, 1fr)`) — primary content layout for text + image pairs

**Four-column auto-fill grid:** `.grid-system-4` (`grid-template-columns: repeat(auto-fill, minmax(200px, 1fr))`) — used for hobby/card grids

**Flexbox wrapper:** `.wrapper` (`display: flex; gap: 20px; max-width: 900px`) with `.column` (`flex: 50%`) — alternative to `.grid-system-2` for skill pairs

**Responsive breakpoints (major):**
| Breakpoint | Change |
|---|---|
| `max-width: 950px` | `.grid-system-2` → 1 column (subpage CSS), `.main-title-large` centers |
| `max-width: 867px` | `.grid-system-2` → 1 column (main CSS), font size reductions |
| `max-width: 750px` | `.wrapper` → `flex-direction: column` |
| `max-width: 510px` | Hamburger nav activates, `.main-nav { display: none }` |
| `max-width: 377px` | Small-screen font size reductions |

**Dark mode:** `@media (prefers-color-scheme: dark)` — full override block at end of `style.css`; partial overrides in `style-project.css`

## Accessibility Patterns

**Present:**
- `lang="en"` on every page
- `alt` text on all content images
- `<label for="drop">` correctly associates with checkbox hamburger toggle

**Absent (gaps):**
- No ARIA attributes (`aria-label`, `aria-expanded`, `aria-hidden`, etc.)
- No `role` attributes
- No `rel="noopener noreferrer"` on `target="_blank"` external links (security + tab-napping risk)
- No explicit `:focus` styles defined — relies on browser defaults
- Empty `alt=""` used on contact icon images (correct for decorative images, but inconsistent — some icons have no alt at all in markup)
- No skip-navigation link

## Error Handling

No JavaScript → no runtime error handling. No forms → no validation. No 404 page exists in the project. No server-side logic.

---

*Convention analysis: 2026-04-07*
