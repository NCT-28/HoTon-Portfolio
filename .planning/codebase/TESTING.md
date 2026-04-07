# Testing

**Analysis Date:** 2026-04-07

## Test Infrastructure

**None.** This project has no build system, no package manager (`package.json` absent), no `node_modules`, and no test runner configuration of any kind.

No test frameworks detected:
- No Jest, Vitest, Mocha, Jasmine, or similar unit test runner
- No Playwright, Cypress, Puppeteer, or similar E2E framework
- No HTML validation automation (W3C validator, html-validate, etc.)
- No CSS linting (Stylelint, etc.)
- No accessibility auditing tools (axe, Lighthouse CI, etc.)

## Automated Tests

**None.** Zero test files exist in the repository. The project is pure static HTML + CSS with no JavaScript logic to test.

File search confirms: no `*.test.*`, `*.spec.*`, `test/`, `tests/`, or `__tests__/` directories.

## Manual Testing Approach

The README.md states "Test your changes thoroughly" in the contributing guidelines but provides no process. Based on the project structure, the only viable testing approach is:

1. Open any `.html` file directly in a browser (no server required — all assets use relative paths)
2. Visually verify layout at multiple viewport widths by resizing the browser window or using DevTools device emulation
3. Check key breakpoints: 950px, 867px, 750px, 510px, 377px (documented in `style.css`)
4. Toggle system dark mode to verify `@media (prefers-color-scheme: dark)` overrides in `style.css` and `style-project.css`
5. Click all navigation links to verify cross-page routing
6. Verify hamburger menu toggles correctly at <510px viewport

The README links to a live demo at `https://iluskaland.github.io/portfolio-template/index.html` for reference comparison.

## Coverage Notes

**No automated coverage.** All quality assurance is visual and manual.

**Known gaps with no test safety net:**
- `rel="noopener noreferrer"` missing on all `target="_blank"` external links — no security linting to catch this
- Redundant `<link rel="preconnect">` tags in every page `<head>` — no HTML linting to flag duplication
- Missing favicon on subpages — no automated check
- Google Fonts loaded with inconsistent weight combinations across pages — no audit tooling
- Unclosed `<p>` and `<section>` tags observed in `portfolio.html` (e.g., `<p><a href="project1.html"><img ...></a>` without closing `</p>`) — no HTML validator in CI
- CSS gradient uses `rgb(250, 113, 283)` which has an out-of-range blue value (283 > 255) — no CSS linting

**Adding a testing baseline (recommended approach):**
```bash
# HTML validation
npx html-validate "*.html"

# Accessibility audit
npx @axe-core/cli index.html

# Lighthouse CI (layout, perf, a11y)
npx lhci autorun
```

---

*Testing analysis: 2026-04-07*
