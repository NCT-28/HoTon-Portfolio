# Phase 1: portfolio-content-update — Context

**Gathered:** 04/2026
**Status:** Ready for planning
**Source:** User-provided content — all decisions locked

<domain>
## Phase Boundary

Replace all template/placeholder content in the portfolio HTML files with real Vietnamese content for Nguyễn Thị Phúc Hòa. No structural changes to CSS or layout — content replacement only.

Files in scope:
- `index.html` — cover/hero + about preview + contact
- `about-me.html` — full about me + work experience + industry experience
- `skill-set.html` — professional skills + industry sectors
- `portfolio.html` — key achievements overview
- `project1.html` — campaign launch achievements detail
- `project2.html` — multi-channel marketing achievements detail
- `project3.html` — event communications achievements detail

</domain>

<decisions>
## Locked Decisions — Exact Content to Use

### 1. index.html — Cover / Hero (Ảnh bìa)

**Hero headline:**
- "Welcome to my portfolio"
- Name: "Nguyễn Thị Phúc Hòa"
- Subtitle: "Cập nhật: 04/2026"

**Contact section (index.html #contact-me):**
- Phone: 034 329 9933
- Email: nguyenthiphuchoa9933@gmail.com

**About preview section (brief, links to about-me.html):**
- Use the short version of the bio from section 2 below (1–2 sentences max)

---

### 2. index.html & about-me.html — About Me (Giới thiệu)

**Full bio:**
- "Marketing Executive với hơn 3 năm kinh nghiệm trong lĩnh vực công nghệ và dịch vụ. Có thế mạnh trong xây dựng nội dung, vận hành social media và triển khai các chiến dịch marketing đa kênh."
- "Tập trung vào việc tạo ra nội dung gắn với hiệu quả thực tế: tăng trưởng người dùng, tối ưu chi phí và cải thiện chuyển đổi."

---

### 3. about-me.html & skill-set.html — Skills / Kỹ năng

**Industry experience (Kinh nghiệm lĩnh vực):**
- Nhà hàng khách sạn (with company logo placeholder — note: "kèm logo công ty")
- Công nghệ phần mềm (with company logo placeholder — note: "kèm logo công ty")

**Work experience timeline (Kinh nghiệm làm việc):**
- 03/2021 - 01/2022: CÔNG TY SPEED LIGHT JSC — Nhân Viên Kinh Doanh Và CSKH
- 05/2022 - 07/2023: FLC QUY NHƠN BEACH & GOLF RESORT — Training Coordinator
- 11/2022 - 03/2023: FLC QUY NHƠN BEACH & GOLF RESORT — I/C Marcom
- 07/2023 - Đến nay: Công ty Cổ phần Công nghệ FUS — Marketing Executive

**Professional skills (Kỹ năng chuyên môn):**
- Content Marketing (Facebook, TikTok, Youtube, Website)
- Facebook Ads
- Community Building (Group, Seeding)
- Landing Page & Website Content
- Basic Design & Video (CapCut, Photoshop)
- Ứng dụng AI trong sản xuất nội dung

---

### 4. portfolio.html — Key Achievements Overview (Thành tựu nổi bậc)

**Section intro:**
- Title: "Key Achievements Portfolio"
- Subtitle: "Tổng hợp thành tựu nổi bậc"
- Description: "Xây dựng kế hoạch, tạo nội dung chi tiết và triển khai các chiến dịch marketing"

**Achievement areas (each links to a project page):**
1. Campaign ra mắt sản phẩm & nâng cấp tính năng (→ project1.html)
2. Marketing online đa kênh (→ project2.html)
3. Truyền thông sự kiện (→ project3.html)

---

### 5. project1.html — Campaign Achievements Detail

**Section: Campaign ra mắt sản phẩm (kèm hình ảnh)**
- TVC giới thiệu công ty: https://youtu.be/b4DP6pu5oVA?si=UQYF36h7HwBI_Xho
- TVC giới thiệu sản phẩm: https://youtu.be/48dGlHdIUBk?si=FzQIYEmOYu9ajGJr
- Ký kết hợp tác với chuỗi các Cyber lớn nhất Việt Nam: OEG, DV CENTER, IMAX CYBER,...
- Thu hút sự quan tâm hợp tác từ các đại lý cài đặt phần mềm "Top đầu": Song Phương Cần Thơ, Hoàng Tuấn Technology,...

**Section: Campaign nâng cấp tính năng (kèm hình ảnh)**
- Kế hoạch mkt online đa kênh - Kết hợp CTKM, khảo sát ý kiến khách hàng
- Tạo video viral "bí kíp quản lý chuỗi cyber game lớn nhất Việt Nam của CEO Huy OEG"
- Hơn 50 phòng máy đăng ký nâng cấp ngay khi ra mắt

---

### 6. project2.html — Multi-channel Marketing Detail

**Section: Marketing online đa kênh (kèm hình ảnh)**
- Xây dựng và vận hành các kênh mạng xã hội: Facebook, Tiktok, Zalo OA, Youtube, Website
- Xây dựng vận hành các hội nhóm trên nền tảng Social

---

### 7. project3.html — Event Communications Detail

**Section: Truyền thông sự kiện (kèm hình ảnh)**
- Kinh nghiệm viết bài truyền thông sự kiện với đa dạng hình thức:
  - Brand opening
  - NSOC - Giải đấu sinh viên điện tử toàn quốc
  - Ký kết hợp tác

---

### 8. index.html — Closing / Thank You (Ảnh bìa cuối)

**Closing message:**
- "Chân thành cảm ơn vì đã dành thời gian quý báu để xem qua giới thiệu về tôi"

**Contact:**
- Sdt: 034 329 9933
- Mail: nguyenthiphuchoa9933@gmail.com

---

### Claude's Discretion

- Where to place company logos in skill-set.html (use `<img>` placeholder with alt text since no actual logo files provided)
- Minor title/heading text in HTML (e.g., page `<title>` tags — update to Vietnamese/relevant names)
- Project page names/titles in portfolio.html cards (use achievement titles above)
- How to render the YouTube links in project1.html (use `<a>` links with descriptive text; no iframe unless existing pattern shows it)
- progress-bar section in skill-set.html: either keep existing progress bars repurposed for marketing skills or remove them if they look out of place — use judgment based on existing CSS classes

</decisions>

<canonical_refs>
## Canonical References

No external specs — requirements fully captured in decisions above.

Key source files for executors to read before editing:
- `index.html` — current structure for cover/about/contact sections
- `about-me.html` — current structure for bio/story sections
- `skill-set.html` — current structure for skills sections
- `portfolio.html` — current structure for project listing
- `project1.html`, `project2.html`, `project3.html` — current structure for project detail pages
- `style.css`, `style-about-me.css`, `style-skill-set.css`, `style-portfolio.css`, `style-project.css` — CSS classes available

</canonical_refs>

<deferred>
## Deferred Ideas

- Adding real company logos (no logo files provided — use text placeholder or skip image)
- Adding real portfolio images for achievements (no images provided — use placeholder comment)
- Dark mode, animations, or interactive features
- New pages or navigation changes

</deferred>

---

*Phase: 01-portfolio-content-update*
*Context gathered: 04/2026 via user content input*
