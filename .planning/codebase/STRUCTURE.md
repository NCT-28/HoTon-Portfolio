# Directory Structure

**Analysis Date:** 2026-04-07

## Layout

```
HoTon-Portfolio/           # Project root — all files at top level
├── index.html             # Home / landing page
├── about-me.html          # About Me detail page
├── skill-set.html         # Skills page
├── portfolio.html         # Project gallery page
├── project1.html          # Project 1 detail page
├── project2.html          # Project 2 detail page
├── project3.html          # Project 3 detail page
├── style.css              # Shared base stylesheet (all pages)
├── style-about-me.css     # Supplement: responsive overrides for about-me, skill-set, portfolio
├── style-portfolio.css    # Supplement: portfolio page media query overrides
├── style-skill-set.css    # Supplement: skill-set page grid-flip mobile fix
├── style-project.css      # Supplement: project detail pages hover + dark mode
├── favicon.ico            # Browser tab icon (referenced from index.html head)
├── README.md              # Project documentation and setup guide
└── assets/                # All static images (flat directory, no subdirectories)
    ├── profile-pic.png
    ├── about-me.png
    ├── about-me-home.png
    ├── about-me1.png
    ├── about-me2.png
    ├── Contact-me-img.png
    ├── project1.png
    ├── project2.png
    ├── project3.png
    ├── linkedin.png
    ├── github.png
    ├── email.png
    ├── html5.png
    ├── coding.png
    ├── dog.png
    ├── board-game.png
    ├── plot-reading.png
    └── github-portfolio-template-demo.JPG
```

## Key Files

**Entry Point:**
- `index.html`: Landing page; contains hero, quote, about preview, skills, projects, and contact section (`id="contact-me"`)

**Page Files:**
- `about-me.html`: 3-section layout — introduction, background story, future plans
- `skill-set.html`: Technical and professional skill progress bars
- `portfolio.html`: Project gallery listing all 3 projects with description + image
- `project1.html`: Detailed view of project 1 — title, description, card system showcase
- `project2.html`: Detailed view of project 2
- `project3.html`: Detailed view of project 3

**Stylesheets:**
- `style.css`: Master stylesheet — body reset, typography classes (`.large`, `.medium-spacing`, `.quote`, etc.), layout grid (`.grid-system-2`, `.grid-system-4`, `.wrapper`, `.column`), navigation (`.sticky`, `.main-nav`, `.toggle`), buttons (`.button-outline`), contact section
- `style-about-me.css`: Media query overrides only (≤950px, ≤600px) — grid collapse, image sizing, heading font scaling. Shared by `about-me.html`, `skill-set.html`, and `portfolio.html`
- `style-portfolio.css`: Media query overrides for `.max-width` on portfolio page
- `style-skill-set.css`: Order fix for `.grid-flip` (CSS grid reordering on mobile)
- `style-project.css`: `.column` hover transition; dark mode media query fix for `.baby-pink-light`

**Assets:**
- `assets/profile-pic.png`: Used in `index.html` hero section
- `assets/about-me.png`: Used in `index.html` about-me preview section
- `assets/about-me1.png`, `assets/about-me2.png`: Used in `about-me.html` sections 1 and 2
- `assets/Contact-me-img.png`: Used in `index.html` contact section
- `assets/project1.png`, `assets/project2.png`, `assets/project3.png`: Used in `portfolio.html` gallery and individual project pages
- `assets/linkedin.png`, `assets/github.png`, `assets/email.png`: Social contact icons in `index.html`

## Naming Conventions

**HTML files:**
- `kebab-case` with descriptive name: `about-me.html`, `skill-set.html`, `project1.html`
- Top-level only — no subdirectories for pages

**CSS files:**
- `style.css` (base) + `style-{page-name}.css` (page supplement)
- Pattern: `style-about-me.css`, `style-portfolio.css`, `style-skill-set.css`, `style-project.css`
- Note: `style-project.css` is shared by all three `project*.html` files (not one CSS per project file)

**Asset files:**
- `kebab-case` or descriptive lowercase for illustrations: `about-me1.png`, `Contact-me-img.png`
- Functional names for project images: `project1.png`, `project2.png`, `project3.png`
- Mixed case present (e.g., `Contact-me-img.png`, `github-portfolio-template-demo.JPG`) — no strict enforced casing

**CSS classes:**
- `kebab-case` throughout: `.grid-system-2`, `.main-title`, `.baby-pink-light`, `.no-bullet-list`
- Layout utilities: `.w-900`, `.max-width`, `.max-height`, `.margin-auto`, `.align-center`
- Typography modifiers: `.large`, `.medium-spacing`, `.main-title`, `.small`, `.quote`, `.italic`, `.bold`, `.uppercase`, `.colorful-letter`
- Background helpers: `.baby-pink`, `.baby-pink-light`
- Spacing helpers: `.padding`, `.padding-top`, `.padding-bottom`, `.padding-list-10`

## Asset Organization

**Single flat directory:** `assets/` — all images in one directory with no subdirectories.

**Asset categories (by convention, not by folder):**
- Profile/personal images: `profile-pic.png`, `about-me*.png`
- Project thumbnails: `project1.png`, `project2.png`, `project3.png`
- Social icons: `linkedin.png`, `github.png`, `email.png`
- Hobby/interest illustrations: `coding.png`, `dog.png`, `board-game.png`, `plot-reading.png`
- UI illustrations: `Contact-me-img.png`, `about-me-home.png`
- Demo/documentation: `github-portfolio-template-demo.JPG`

**Adding new assets:** Place all image files directly in `assets/` and reference with relative path `src="assets/filename.ext"`.

## Where to Add New Code

**New page:**
1. Create `{page-name}.html` at project root
2. Copy nav block verbatim from any existing page
3. Create `style-{page-name}.css` at project root for page-specific styles
4. Link both `style.css` and `style-{page-name}.css` in the new page's `<head>`
5. Add nav link to all existing pages' `<ul class="main-nav">` blocks

**New project detail page:**
- Use `project1.html` as template
- Reuse `style-project.css` (already shared across all project pages)
- Add thumbnail to `assets/` as `project{N}.png`
- Add entry to `portfolio.html`

**New images/illustrations:**
- Drop file in `assets/` directory
- Reference as `src="assets/filename.ext"`

---

*Structure analysis: 2026-04-07*
