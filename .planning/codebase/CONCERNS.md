# Codebase Concerns

**Analysis Date:** 2026-04-07

---

## Technical Debt

**Placeholder / template content never replaced:**
- Issue: All 8 HTML pages still contain `meta name="description|keywords|author"` with value `"Sample text for portfolio template meta tag"`. All body copy is lorem ipsum. Footer hardcoded as `@iluskaland 2024`.
- Files: `index.html`, `about-me.html`, `skill-set.html`, `portfolio.html`, `project1.html`, `project2.html`, `project3.html`
- Impact: Zero SEO value; the site presents as an uncustomized template to users and crawlers.
- Fix approach: Replace all placeholder meta tags, names, contact links, and footer copyright with real content.

**Invalid CSS color value:**
- Issue: `rgb(250, 113, 283)` is used in the gradient for `.large` and `.colorful-letter`. The blue channel `283` exceeds the valid range of 0–255; browsers clamp it to 255, changing the intended color silently.
- Files: `style.css` (lines ~25–30 `.large` and ~66–69 `.colorful-letter`)
- Impact: Rendered gradient differs from designed intent across all major browsers.
- Fix approach: Replace `rgb(250, 113, 283)` with a valid value such as `rgb(250, 113, 255)` or the intended hex color.

**Misnamed/misleading CSS property:**
- Issue: Class `.justify-content` sets `justify-content: right`, which is not a valid flexbox value (valid values are `flex-end`, `center`, etc.). Browsers silently ignore this declaration.
- Files: `style.css` (`.justify-content` rule ~line 165)
- Impact: The "Back to portfolio" link alignment on project pages does not behave as intended.
- Fix approach: Change to `justify-content: flex-end`.

**`.DS_Store` in assets:**
- Issue: `assets/.DS_Store` macOS metadata file is committed to the repository.
- Files: `assets/.DS_Store`
- Impact: Pollutes version history; surfaced to anyone cloning or browsing the repo.
- Fix approach: Add `.DS_Store` to `.gitignore` and remove from history with `git rm --cached assets/.DS_Store`.

**Contact links point to generic domain roots:**
- Issue: LinkedIn, GitHub, and email links in `index.html` all go to root domains (`https://www.linkedin.com/`, `https://github.com/`, `mailto:xy@gmail.com`).
- Files: `index.html` (contact section)
- Impact: Contact section is non-functional for visitors.
- Fix approach: Replace with actual profile URLs and real email address.

---

## Accessibility

**Hamburger menu has no accessible label:**
- Issue: The mobile nav toggle is a `<label>` whose only content is a `<span class="nav-icon">` rendered via CSS pseudo-elements. There is no visible text, no `aria-label`, and no `title`. Screen readers announce it as an unlabeled interactive element.
- Files: `index.html`, `about-me.html`, `skill-set.html`, `portfolio.html`, `project1.html`, `project2.html`, `project3.html` (all nav blocks)
- Fix approach: Add `aria-label="Toggle navigation"` to the `<label id="main-toggle">` element.

**Hidden checkbox-based nav is inaccessible:**
- Issue: The hamburger menu relies on `<input type="checkbox" id="drop">` hidden via CSS. It is not keyboard-operable for screen reader users since the checkbox is `display:none`. No `role="button"` or `aria-expanded` is present.
- Files: All HTML pages (nav block)
- Fix approach: Add `aria-controls` and `aria-expanded` attributes, or replace the CSS-only pattern with a JavaScript-driven button that manages `aria-expanded`.

**Contact logo images have empty `alt` attributes:**
- Issue: `<img class="logo" src="assets/linkedin.png" alt="">`, `assets/github.png`, and `assets/email.png` all have `alt=""`. These images are inside `<a>` links, making the links have no accessible name.
- Files: `index.html` (contact section)
- Fix approach: Add descriptive `alt` text: `alt="LinkedIn profile"`, `alt="GitHub profile"`, `alt="Send email"`.

**Progress bars have no ARIA attributes:**
- Issue: `<span class="progress-bar"><span class="html"></span></span>` conveys skill proficiency visually but has no `role="progressbar"`, `aria-valuenow`, `aria-valuemin`, or `aria-valuemax`.
- Files: `index.html`, `skill-set.html`
- Fix approach: Add `role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"` to each progress bar span.

**No skip-to-main-content link:**
- Issue: No `<a href="#main-content" class="skip-link">Skip to main content</a>` at the top of any page.
- Files: All HTML pages
- Fix approach: Add a visually hidden skip link as the first focusable element in `<body>` and add a matching `id="main-content"` to the main content region.

**`<nav>` has no `aria-label`:**
- Issue: The site has a single `<nav>` on each page without `aria-label="Main"`. On pages with multiple landmarks, this causes ambiguity.
- Files: All HTML pages
- Fix approach: Add `aria-label="Main navigation"` to the `<nav>` element.

**`<section>` used in place of `<div>` for non-landmark content:**
- Issue: `<section>` is used as a generic layout wrapper throughout (e.g., wrapping individual grid cells, card contents) with no heading or accessible name, which produces unnamed section landmarks.
- Files: All HTML pages (pervasive throughout)
- Fix approach: Replace presentational `<section>` wrappers that have no heading with `<div>`.

**`colorful-letter` gradient text may fail contrast:**
- Issue: `-webkit-text-fill-color: transparent` with a pink gradient on a white or near-white background may produce contrast ratios below WCAG AA (4.5:1), particularly for the lighter end of the gradient.
- Files: `style.css` (`.colorful-letter`), used across all pages
- Fix approach: Verify gradient colors against WCAG contrast guidelines; add a fallback `color` for browsers that do not support background-clip.

---

## Performance

**Redundant Google Fonts `<link rel="preconnect">` declarations:**
- Issue: Each HTML page includes duplicate `<link rel="preconnect" href="https://fonts.googleapis.com">` and `<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>` declarations — the pair appears 3–4 times per page. Each font weight (Montserrat 200, Montserrat 400, Oswald 200, Oswald 400) is fetched as a separate stylesheet request (6–8 render-blocking HTTP requests per page).
- Files: All HTML pages (`<head>` sections)
- Impact: Unnecessarily inflates the number of render-blocking requests.
- Fix approach: Consolidate all Google Font weights into a single URL: `https://fonts.googleapis.com/css2?family=Covered+By+Your+Grace&family=Montserrat:wght@200;400&family=Oswald:wght@200;400&display=swap`. Keep only one `preconnect` per host.

**No `loading="lazy"` on images:**
- Issue: All `<img>` tags load eagerly. Pages with multiple images (about-me, portfolio, project pages) load all images on initial page load.
- Files: `about-me.html`, `portfolio.html`, `project1.html`, `project2.html`, `project3.html`, `index.html`
- Fix approach: Add `loading="lazy"` to all below-the-fold images.

**No image dimension attributes:**
- Issue: Most `<img>` elements lack explicit `width` and `height` attributes, causing cumulative layout shift (CLS) while images load.
- Files: All HTML pages
- Fix approach: Add `width` and `height` attributes matching the intrinsic dimensions of each image.

**No web font display strategy:**
- Issue: Google Font requests do not specify `&display=swap` except for the Covered By Your Grace font. The Montserrat and Oswald requests have no display strategy, causing invisible text (FOIT) while fonts load.
- Files: All HTML pages (font link tags)
- Fix approach: Append `&display=swap` to all Google Fonts `href` values.

---

## Security

**`target="_blank"` links missing `rel="noopener noreferrer"`:**
- Issue: All external links using `target="_blank"` (Behance, Instagram, Facebook, GitHub, LinkedIn, Storyset, Iconfinder, Zero To Mastery etc.) omit `rel="noopener noreferrer"`, exposing the site to reverse tab-napping where the opened tab can navigate the opener page via `window.opener`.
- Files: `index.html`, `about-me.html`, `portfolio.html`, `project1.html`, `project2.html`, `project3.html`
- Fix approach: Add `rel="noopener noreferrer"` to every `<a target="_blank">` element.

---

## Maintainability

**Entire `<head>` block duplicated across all 8 pages:**
- Issue: The 10-line font loading block, all CSS `<link>` references, and all meta tags are manually copied into every HTML file with no shared include system.
- Files: `index.html`, `about-me.html`, `skill-set.html`, `portfolio.html`, `project1.html`, `project2.html`, `project3.html`
- Impact: Any change to shared `<head>` content (e.g., adding a new font, updating a meta tag) requires editing 8 files.
- Fix approach: Introduce a build tool (e.g., 11ty, Vite, or even PHP includes) or a simple HTML templating approach to share the nav and head partials.

**Nav HTML duplicated across all 8 pages:**
- Issue: The entire `<nav>` block (label, checkbox, `<ul>`, and 5 `<li>` items) is copy-pasted identically into every page.
- Files: All HTML pages
- Impact: Adding a new nav link, fixing ARIA, or changing styling requires 8 manual edits with high risk of inconsistency.
- Fix: Same as above — use a partial/component system.

**`project1.html`, `project2.html`, `project3.html` are near-identical:**
- Issue: All three project pages share ~95% identical HTML structure — the same two card sections, the same "what did I learn" list structure, identical footer. Only minor cosmetic differences exist.
- Files: `project1.html`, `project2.html`, `project3.html`
- Impact: Every layout or style change must be applied three times.
- Fix approach: Use a data-driven template (even a simple HTML template with search-replace) or adopt a static site generator.

**`style-about-me.css` is loaded by unrelated pages:**
- Issue: `portfolio.html` and `skill-set.html` load `style-about-me.css` to inherit its media query overrides. The CSS file name does not communicate shared ownership, making the dependency invisible to future maintainers.
- Files: `portfolio.html` (comment says "This page benefits from the main css and also from the about-me css"), `skill-set.html`
- Fix approach: Extract the shared media query rules into a `style-shared.css` or `style-layout.css` file.

**Footer copyright year and attribution are stale placeholders:**
- Issue: `<footer>@iluskaland 2024</footer>` appears on all pages. The author name and year are not updated from the original template.
- Files: All HTML pages (footer element)

---

## Missing Features

**No 404 error page:**
- No `404.html` exists. Broken links (e.g., accessing non-existent paths) will show a generic browser/host error page.

**No `sitemap.xml` or `robots.txt`:**
- Absent from project root. Search engine crawl control and discoverability are unmanaged.

**No Open Graph / Twitter Card meta tags:**
- No `og:title`, `og:description`, `og:image`, `twitter:card`, or `twitter:image` tags on any page. Social media link previews will render with no image and generic text.

**No contact form:**
- Contact is limited to three external icon links and a `mailto:`. No form allows visitors to contact without leaving the site or exposing their email client.

**No structured data (JSON-LD):**
- No Schema.org `Person`, `WebSite`, or `CreativeWork` markup. Structured data would enhance search result presentation (rich snippets).

**No `<meta name="viewport">` `initial-scale` limitation for iOS text resize:**
- `initial-scale=1.0` is present, but without `maximum-scale=1` (by design, as that harms accessibility). The `-webkit-text-size-adjust: 100%` vendor prefix is present in CSS, but the standard property is present too.

---

## Fragile Areas

**CSS-only hamburger menu — DOM order dependency:**
- The toggle relies on `#drop:checked + .main-nav` CSS adjacent sibling selector. Inserting any element between the `<input id="drop">` and `<ul class="main-nav">` will silently break the mobile menu on all pages.
- Files: All HTML pages (nav block), `style.css` (`#drop:checked+.main-nav`)

**Sticky nav has no `z-index`:**
- `.sticky` uses `position: sticky` with no `z-index`. When content with `position: relative` or stacking contexts (cards with `box-shadow`) scroll behind the nav, overlap without stacking order is undefined across browsers.
- Files: `style.css` (`.sticky` rule)
- Fix: Add `z-index: 100` to `.sticky`.

**`max-width` utility class overridden at multiple breakpoints:**
- `.max-width` is set to `450px` baseline, then overridden to `300px` at `≤867px`, `300px` at `≤950px/≥510px`, `100%` at `≤510px`, `450px` in `style-portfolio.css` at `≤950px`, and `100%` in `style-portfolio.css` at `≤600px`. The cascade is complex and fragile — changing any breakpoint risks unintended consequences.
- Files: `style.css`, `style-about-me.css`, `style-portfolio.css`

**`<section>` unclosed tag in `portfolio.html`:**
- Issue: Two `<section class="center">` blocks wrapping project images are opened but not explicitly closed before the next `</section>`. While browsers auto-close, this is technically malformed HTML and error-prone during manual editing.
- Files: `portfolio.html` (project1 image wrapper ~line 72, project3 image wrapper ~line 120)

**Skill progress bar percentages hardcoded in CSS:**
- Skill proficiency levels (e.g., `.html { width: 90%; }`) are defined as concrete CSS classes, not data attributes. Adding a new skill requires adding CSS classes, keyframe animations, and HTML markup in sync — three separate edit points all prone to mismatch.
- Files: `style.css` (`.html`, `.css`, `.javascript`, `.php`, `.comm-adapt`, etc.), `index.html`, `skill-set.html`

---

*Concerns audit: 2026-04-07*
