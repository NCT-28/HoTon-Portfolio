# Technology Stack

**Analysis Date:** 2026-04-07

## Languages

**Primary:**
- HTML5 - All page markup (`index.html`, `about-me.html`, `skill-set.html`, `portfolio.html`, `project1.html`, `project2.html`, `project3.html`)
- CSS3 - All styling and layout (5 stylesheet files)

**Secondary:**
- None — no JavaScript, no server-side language

## Runtime

**Environment:**
- Static files only — no runtime required
- Served directly from filesystem or any static host

**Package Manager:**
- None — no `package.json`, `requirements.txt`, or any lockfile

## Frameworks

**Core:**
- None — pure vanilla HTML and CSS, zero dependencies

**CSS Methodology:**
- Custom utility-class system (no framework like Tailwind or Bootstrap)
- Class names follow descriptive patterns: `grid-system-2`, `progress-bar`, `button-outline`, `main-nav`

**Build/Dev:**
- None — open HTML files directly in a browser; no build step, no bundler

## Key CSS Features Used

- **CSS Grid** — `grid-system-2` class for two-column layouts
- **CSS Flexbox** — `wrapper`, `column`, `flex`, `align-center` utility classes
- **CSS Animations/Transitions** — hover effects on buttons, links, and progress bars
- **CSS Custom Progress Bars** — skill bars built entirely in CSS (`progress-bar`, `.html`, `.css`, `.javascript`, `.php`)
- **CSS Checkbox Hack** — pure-CSS mobile hamburger menu (no JavaScript)
- **CSS Dark Mode** — `@media (prefers-color-scheme: dark)` in `style.css` (line 677) and `style-project.css` (line 12)
- **CSS Responsive Design** — `@media screen and (max-width: 950px)` and `@media screen and (max-width: 600px)` breakpoints across all stylesheets

## Stylesheets

| File | Purpose | Used by |
|------|---------|---------|
| `style.css` | Global styles, nav, layout, animations, dark mode | All pages |
| `style-about-me.css` | About page-specific overrides and media queries | `about-me.html`, `skill-set.html`, `portfolio.html` |
| `style-skill-set.css` | Skill section overrides | `skill-set.html` |
| `style-portfolio.css` | Portfolio-specific media queries | `portfolio.html` |
| `style-project.css` | Project page styles, dark mode | `project1.html`, `project2.html`, `project3.html` |

## Configuration

**Build:**
- Not applicable — no build configuration

**Environment:**
- Not applicable — no environment variables

**Linting/Formatting:**
- None detected — no `.eslintrc`, `.stylelintrc`, or `.prettierrc`

## Platform Requirements

**Development:**
- Any web browser; no local server required for basic viewing

**Production:**
- Any static file host (GitHub Pages, Netlify, Vercel, Apache, Nginx)
- No server-side processing needed

---

*Stack analysis: 2026-04-07*
