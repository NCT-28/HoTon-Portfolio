# Architecture

**Analysis Date:** 2026-04-07

## Pattern

**Overall:** Static Multi-Page Website (MPW)

**Key Characteristics:**
- Pure HTML + CSS, zero JavaScript, zero build tooling
- No framework, no npm, no package manager — open files directly in browser
- Each page is a self-contained HTML document sharing a common CSS base
- All interactivity (mobile nav hamburger) implemented via CSS checkbox hack — no JS
- External dependency only: Google Fonts CDN

## Page Structure

Each HTML page follows an identical structural template:

```
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- SEO meta tags -->
    <!-- CSS links: style.css + page-specific CSS -->
    <!-- Google Fonts links (Covered By Your Grace, Montserrat, Oswald) -->
  </head>
  <body>
    <nav class="sticky">           <!-- Shared nav — identical across all pages -->
      <label for="drop">...</label>
      <input type="checkbox" id="drop">
      <ul class="main-nav">...</ul>
    </nav>
    <!-- Page-specific content sections -->
  </body>
</html>
```

**Pages and their purpose:**

| File | Title | CSS Used |
|------|-------|----------|
| `index.html` | Home / Landing page | `style.css` |
| `about-me.html` | About Me detail page | `style.css`, `style-about-me.css` |
| `skill-set.html` | Skills / Competencies | `style.css`, `style-about-me.css`, `style-skill-set.css` |
| `portfolio.html` | Project gallery | `style.css`, `style-about-me.css`, `style-portfolio.css` |
| `project1.html` | Project 1 detail | `style.css`, `style-project.css` |
| `project2.html` | Project 2 detail | `style.css`, `style-project.css` |
| `project3.html` | Project 3 detail | `style.css`, `style-project.css` |

## Navigation Model

**Type:** Flat site-wide navigation bar, duplicated verbatim on every page.

**Nav links (same on all pages):**
- `index.html` → Home
- `about-me.html` → About me
- `skill-set.html` → Skill-set
- `portfolio.html` → Portfolio
- `index.html#contact-me` → Contact me (anchor to contact section on index)

**Special case:** `index.html` uses `#contact-me` (relative anchor); all other pages use `index.html#contact-me`.

**Mobile nav:** CSS-only hamburger toggle using `<input type="checkbox" id="drop">` and `<label for="drop">`. No JavaScript required.

**Sticky positioning:** Nav uses `class="sticky"` — defined in `style.css`.

**Project drill-down flow:**
```
portfolio.html
  └── project1.html  (linked via "More info" button + image click)
  └── project2.html
  └── project3.html
```

## Data Flow

**No dynamic data.** All content is static, hard-coded HTML.

**CSS cascade per page:**
```
style.css  (base: reset, typography, layout grid, utilities, nav, buttons, contact)
    ↓
style-about-me.css  (responsive media query overrides for grid-system-2, max-width breakpoints)
    ↓
style-portfolio.css  (portfolio-specific max-width media query overrides)
    OR
style-skill-set.css  (skill page: grid-flip order fix on mobile)
    OR
style-project.css    (project page: hover/active background transition on .column, dark mode fix)
```

**Font loading:** Google Fonts loaded via `<link>` tags in each page `<head>`. Fonts: `Covered By Your Grace` (quotes), `Montserrat` wt 200+400 (body), `Oswald` wt 200+400 (headings).

**Images:** All served as static files from `assets/` — referenced by relative path (e.g., `src="assets/profile-pic.png"`).

## Layout System

**Two layout primitives in `style.css`:**

1. **CSS Grid** — `grid-system-2` (2-column), `grid-system-4` (auto-fill, min 200px)
2. **Flexbox** — `wrapper` (max-width 900px, flex, gap 20px) + `column` (flex: 50%)

**Max-width container:** `.w-900` — `max-width: 900px; margin: auto;` used on all primary content sections.

**Responsive breakpoints (in `style-about-me.css`):**
- `≤950px`: grid-system-2 collapses to 1 column; grid-system-4 to 2 columns
- `≤600px`: grid-system-4 collapses to 1 column

## Entry Points

**Browser entry:** `index.html` — the landing page. Contains:
- Hero/intro (`<header>`)
- Quote banner
- About me preview (links to `about-me.html`)
- Skills progress bars preview
- Current projects cards (links to `portfolio.html`)
- Contact section (`id="contact-me"`) — anchor target for all pages

**Direct page entries:** Any page can be entered directly via URL; all have full nav.

---

*Architecture analysis: 2026-04-07*
