# DESIGN.md — Extraction Checklist & Template

*Payload สำหรับ skill `generate-design-md` · อ่านไฟล์นี้ก่อนเริ่มสกัดเสมอ*

---

## หลักการ

DESIGN.md ไม่ใช่ "เอกสาร design system ในฝัน" — มันคือ **สัญญาที่ AI agent จะทำตามตัวอักษร**
ถ้าจดของที่ไม่มีจริง agent จะสร้างของที่ไม่ตรง codebase
ถ้าจดทุกอย่างเท่ากันหมดโดยไม่จัดลำดับ agent จะลอกความมั่วต่อ

→ **จดของจริง + จัดลำดับชั้น + อ้างอิง file:line ได้ทุกค่า**

---

## Phase 1 — Extraction checklist

ไล่ตามลำดับนี้ อย่าข้าม:

### 1.1 Token config layer
- [ ] `tailwind.config.{js,ts}` — `theme.extend` (colors / fontFamily / spacing / borderRadius / boxShadow / screens), `darkMode`, `content` globs, plugins
- [ ] ถ้าไม่ใช่ Tailwind: `theme.json`, `_variables.scss`, styled-components `ThemeProvider`, CSS-in-JS theme object
- [ ] `:root {}` / `@theme` CSS custom properties — grep `--[a-z-]+:` ทั้ง repo
- [ ] **resolve ค่าจริง** — ถ้า config เขียน `colors.indigo` ต้องแตกเป็น hex ให้ครบ อย่าปล่อยเป็นชื่อ

### 1.2 Global CSS
- [ ] entry stylesheet (`index.css` / `globals.css` / `app.css`)
- [ ] `@font-face` — **เช็ค `unicode-range`** (ฟอนต์ที่โหลดเฉพาะบางภาษาเป็นกับดักคลาสสิก)
- [ ] fallback font stack เต็มๆ
- [ ] custom utility / component layer ที่ทีมเขียนเอง
- [ ] background ที่ตั้งบน `<html>` / `<body>` ใน `index.html` — มักไม่อยู่ใน CSS

### 1.3 หา design language ปัจจุบัน (สำคัญที่สุด)
```bash
git log --oneline -20
git log -1 --stat -- <หน้าที่สงสัย>
```
- [ ] หา commit ล่าสุดที่แตะ UI แล้วดูว่าหน้าไหนถูกแก้
- [ ] **หน้านั้นคือ canonical** — token ที่ขัดกับหน้านั้นถือเป็น legacy
- [ ] ถ้ามีหลายหน้าใหม่พอกัน ให้ถามผู้ใช้ว่ายึดหน้าไหน

### 1.4 Component patterns
สกัดจากหน้า canonical เป็นหลัก — quote className/JSX จริง พร้อม `file:line`
- [ ] Card (resting / hover / selected / disabled)
- [ ] Button ทุก variant (primary / secondary / ghost / icon-only / danger / FAB)
- [ ] Badge / pill / chip + status color map
- [ ] Form input (text / search / checkbox / select / dropdown) — **ครบทั้ง 4 state: resting / focus / error / disabled**
- [ ] **Status vocabulary ให้ครบทุก domain object** — ไม่ใช่แค่ object เดียว เช่น มีทั้ง task status และ process-instance status ต้องจดทั้งคู่ (กับดัก: จดแค่หน้าที่ redesign ล่าสุด แล้ว agent ไปสร้าง component ของ object อื่นไม่ได้)
- [ ] Modal / overlay / drawer — **ระบุ library ที่ใช้จริง** (Headless UI? Radix? antd?)
- [ ] Table / list
- [ ] Loading + empty state
- [ ] Layout shell — header, container max-width, page gutter

### 1.5 UI library theme
- [ ] grep `ConfigProvider` / `createTheme` / `ThemeProvider` / `theme={{`
- [ ] **ถ้าไม่มี ต้องเขียนลง DESIGN.md ว่าไม่มี** — เพราะ default ของ library (antd `#1677ff`, MUI `#1976d2`) จะหลุดออกมาปนกับสีแบรนด์ agent ต้องรู้เพื่อจะได้ไม่เพิ่ม component จาก library นั้น

### 1.6 Dead & phantom tokens
- [ ] token ที่ **declare แล้วไม่มีใครใช้** — grep ชื่อ token ทั้ง repo
- [ ] class ที่ **ใช้แล้วไม่ได้ declare** (invalid Tailwind class เช่น `font-small`, `border-1`)
- [ ] CSS file ที่ import แล้วแต่ selector ข้างในไม่ถูกอ้างถึงเลย → **dead stylesheet**
- [ ] class ที่ประกอบขึ้นด้วย string manipulation (`.replace()`, template concat) → JIT มองไม่เห็น

---

## Phase 2 — กฎตัดสินเมื่อเจอของขัดกัน

| สถานการณ์ | ยึดอะไร |
|---|---|
| config บอกอย่าง โค้ดจริงใช้อีกอย่าง | **โค้ดจริง** (นับ usage ด้วย grep) |
| CSS file vs inline utility ในหน้าเดียวกัน | **อันที่ render จริง** — grep ว่า class ถูกอ้างถึงมั้ย |
| หน้าเก่า vs หน้าใหม่ | **หน้าใหม่** (จาก `git log`) |
| หลาย implementation เท่าๆ กัน | ยึดอันในหน้า canonical แล้วจดที่เหลือเป็น divergence |

**ของที่ไม่ได้เลือก ห้ามทิ้ง** — ย้ายไปหมวด "Known Divergences — Do Not Replicate" พร้อม `file:line`
เหตุผล: agent ต้องรู้ว่ามันมีอยู่และเป็นของที่ **ไม่ควรลอก** ไม่งั้นเจอโค้ดเก่าแล้วจะลอกตาม

---

## สัญญากับ viewer (ทำไม §2/§3 ถึงบังคับรูปตาราง)

`DESIGN.md` ไม่ได้ถูกอ่านด้วยตาอย่างเดียว — ระบบ **sys-blueprint** เก็บมันเป็นชิ้นงาน `DS-nn`
แล้ว `src/lib/designMdParse.js` **อ่านตารางใน §2/§3 เพื่อ render สีเป็นแถบสีจริงและขนาดอักษรเป็นตัวอย่างจริง**
⇒ ไฟล์นี้ (ผู้เขียน) กับ viewer (ผู้อ่าน) เป็น **สองครึ่งของสัญญาเดียวกัน**

สิ่งที่ parser ต้องเจอถึงจะแสดงเป็นภาพได้:

| ต้องการ | รูปที่ parse ได้ | รูปที่ **parse ไม่ได้** |
|---|---|---|
| แถบสี | `` \| `--accent` \| `#4f46e5` \| ปุ่มหลัก \| `` | `` \| `--a` / `-wash` \| `#111` / `#eee` \| … \| `` (ยุบหลาย token) |
| แถบสี 2 ธีม | หัวตารางเป็น `Hex (light)` + `Hex (dark)` | คอลัมน์ชื่ออื่น เช่น `Light` / `มืด` |
| ตัวอย่างขนาดอักษร | `` \| `--text-sm` \| 13px \| body \| `` | `` \| Body \| `text-sm` \| `` (มีแต่ชื่อ class) |

ค่าที่ **ไม่ใช่ hex** เขียนได้ตามปกติ — `rgba(28,27,24,.45)`, `= var(--accent)` — parser รองรับ
(แสดงเป็นแถวข้อความแทนแถบสี) **แต่ห้ามยุบหลาย token ไว้แถวเดียว** เพราะไม่มีทางแยกคืนได้ถูก

ไฟล์ที่ไม่ตามรูปนี้ยัง**เปิดอ่านได้ปกติ** (degrade เป็น markdown ล้วน ไม่พัง) — แค่ไม่ได้ภาพช่วยอ่าน

---

## Phase 3 — Template (10 sections)

````markdown
# DESIGN.md — <Product Name>

> Design system spec for AI coding agents.
> **Status: as-is** — this documents what actually ships today.
> Source of truth: `<canonical file>` (commit `<hash>`).
> Anything contradicting this file is in §10 — do not replicate those.

## 1. Visual Theme & Atmosphere
Mood · density · primary UI language · surface treatment · motion philosophy
(ประโยคสั้นๆ ที่ทำให้ agent "จับอารมณ์" ได้ ไม่ใช่ token)

## 2. Color Palette & Roles
ตาราง **หัวคอลัมน์ต้องเป็นรูปใดรูปหนึ่งนี้เท่านั้น** (ดู §สัญญากับ viewer):
  ธีมเดียว : | Token | Hex | Role |
  สองธีม   : | Token | Hex (light) | Hex (dark) | Role |
แยกกลุ่ม: Brand/Primary · Surfaces & neutrals · Text · Status/semantic · Gradients
→ ทุกแถวมี file:line · **1 แถว = 1 token เสมอ** (ห้ามยุบ `--x` / `-wash` / `-wash-ink` ไว้แถวเดียว)

## 3. Typography
Font family + weights + **unicode-range caveat ถ้ามี** + fallback stack เต็ม
ตาราง scale ที่ใช้จริง — **คอลัมน์ที่ 2 ต้องเป็นขนาดจริง** (`13px` / `1.125rem`) ไม่ใช่ชื่อ class:
  | Token | ค่า | ใช้ยังไง |
ระบบที่ไม่มี token ขนาด (ใช้ `text-sm` ของ Tailwind ล้วน) → ใส่ค่าที่ class นั้น resolve เป็นจริง
เช่น `| text-sm | 14px | body/controls |` แล้วค่อยอธิบาย class ในคอลัมน์สุดท้าย
⚠️ กับดักที่ต้องเตือน (เช่น "อย่าใช้ `font-sans` เพราะจะหลุดฟอนต์")

## 4. Component Stylings
โค้ด block จริงต่อ component พร้อม state (resting/hover/selected/disabled)
ระบุ overlay library ที่ต้องใช้

## 5. Layout Principles
Container max-width · page gutter · spacing rhythm · grid · radius ladder

## 6. Depth & Elevation
ตาราง level → class → ใช้กับอะไร
กฎการจับคู่ (เช่น shadow เปลี่ยนพร้อม border)

## 7. Do's and Don'ts
✅ Do — pattern ที่ต้องลอก
❌ Don't — dead code, legacy palette, invalid class, library ที่ห้ามเพิ่ม

## 8. Responsive Behavior
Breakpoints · grid steps · mobile nav · modal→sheet · touch target (+ ระบุถ้าต่ำกว่า 44px)

## 9. Agent Prompt Guide
Quick reference block (สี/radius/shadow/font ย่อ) + prompt สำเร็จรูปให้ copy
+ ตารางไฟล์อ้างอิงต่อความต้องการ

## 10. Known Divergences — Do Not Replicate
ตาราง: | # | Divergence | Evidence (file:line) | Canonical choice |
→ **ช่อง Canonical choice ห้ามเว้นว่าง** ถ้าตัดสินใจไม่ได้ให้เขียนว่าตัดสินใจไม่ได้เพราะอะไร
ปิดท้าย: "แต่ละข้อเป็น candidate สำหรับ cleanup task แยก — ห้ามแก้เป็นผลพลอยได้ของงาน UI"

## 11. Gaps — Not Defined Anywhere
ของที่ codebase **ไม่มีคำตอบ** — บอก agent ให้ถามก่อนแต่งเอง
ตาราง: | Gap | Nearest neighbor | Note |
เช็คอย่างน้อย: focus/keyboard state · button disabled · in-button loading · z-index scale · modal↔sheet switch · icon family นอกหน้า canonical

## Maintenance
เตือนว่า line number pin กับ commit ไหน + ให้ค้นด้วย className string ไม่ใช่เลขบรรทัด
````

---

## Phase 4 — Self-check ก่อนส่ง

- [ ] ทุก hex / class ในไฟล์ traceable ไป `file:line` ได้จริง (สุ่มตรวจ 5 จุด)
- [ ] ไม่มีค่าที่ "น่าจะใช่" — ถ้าไม่แน่ใจ ระบุว่าไม่แน่ใจ
- [ ] §7 Don't มีอย่างน้อย: dead code ที่เจอ + legacy palette + invalid class
- [ ] §9 prompt copy ไปใช้ได้ทันทีโดยไม่ต้องแก้
- [ ] §10 ทุกแถวมีหลักฐาน + ช่อง canonical ไม่มีที่เว้นว่าง
- [ ] ตาราง palette ครบทุกเฉดที่ปรากฏใน §4 (กับดัก: §4 ใช้ `purple-700` แต่ §2 ไม่ได้ list ไว้)
- [ ] ไม่ได้แก้โค้ดใดๆ ระหว่างทาง (งานนี้เขียนเอกสารอย่างเดียว)
- [ ] **§2 ทุกแถวมี token เดียว** — ไม่มีแถวไหนยุบ `--x` / `-wash` / `-wash-ink` ไว้ด้วยกัน
      (นับเร็ว: `grep -cE '^\| *.?--[a-z-]+.? */' DESIGN.md` ต้องได้ **0**)
- [ ] **§3 คอลัมน์ที่ 2 เป็นขนาดจริง** (`13px`/`1rem`) ไม่ใช่ชื่อ class — ดู §สัญญากับ viewer

### Dry-run test (บังคับ)
ส่ง DESIGN.md ให้ agent ตัวใหม่ที่ **ไม่เคยเห็น codebase** แล้วสั่ง:
> "อ่าน DESIGN.md อย่างเดียว ห้ามอ่านไฟล์อื่น แล้วเขียน component ใหม่ 1 ตัว + ตอบว่าอะไรที่ตอบไม่ได้"

ถ้า agent ตอบคำถามไหนไม่ได้ → นั่นคือช่องโหว่จริง ต้องเติมก่อนส่งงาน

---

## กับดักที่เจอบ่อย

1. **Dead stylesheet** — ไฟล์ CSS ที่ `import` แล้วแต่ selector ไม่ถูกใช้เลย มักเกิดตอน redesign แล้วเปลี่ยนไปเขียน utility แทนแต่ลืมลบไฟล์เก่า → grep ทุก selector ก่อนเชื่อ
2. **Config บอกสีนึง โค้ดใช้อีกสี** — `primary` ใน config มักเป็นสีรุ่นแรกของโปรเจกต์
3. **Library default หลุด** — ไม่มี theme config = default color ของ library ปนเข้ามาเป็นสีที่ 4-5
4. **ฟอนต์ครึ่งภาษา** — `unicode-range` ทำให้ไทย/อังกฤษคนละ typeface
5. **`<html class="bg-...">`** — สีพื้นแอปมักอยู่ใน HTML ไม่ใช่ CSS
6. **Class ที่สร้างด้วย string manipulation** — JIT มองไม่เห็น รอดเพราะบังเอิญมี literal ที่อื่น
