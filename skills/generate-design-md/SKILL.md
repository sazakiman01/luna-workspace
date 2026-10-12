---
name: generate-design-md
description: Use this skill when creating or updating a DESIGN.md design-system file for a codebase (color tokens, typography, component patterns, spacing — the spec an AI coding agent reads before building UI). Triggers on "สร้าง DESIGN.md", "generate design.md", "ทำ design system", "extract design tokens", "อัปเดต DESIGN.md", "design md", or any DESIGN.md authoring request. Delegates to Vega, who has the extraction checklist preloaded.
allowed-tools: Agent, Read, Glob, Grep
---

# DESIGN.md Generator Skill

**Delegate to `subagent_type: vega`** ด้วย Agent tool

DESIGN.md = ไฟล์ markdown ไฟล์เดียวที่ root ของ repo บอก AI coding agent ว่า design system ของระบบคืออะไร
→ agent generate UI ออกมาตรงของเดิม แทนที่จะเดาเอง (spec เดิมจาก Google Stitch · [designmd.ai](https://designmd.ai/what-is-design-md))

**ส่งไปใน prompt:** repo path (absolute) + ว่าเป็นการสร้างใหม่หรืออัปเดตของเดิม + ถ้ามีหน้า/feature ที่ถือเป็น "design language ปัจจุบัน" ให้ระบุ

**สั่ง Vega ให้อ่าน `reference.md` ข้าง SKILL.md นี้ก่อนเริ่ม** — มี template 10 sections + extraction checklist + กฎตัดสินเมื่อเจอของขัดกัน

**จุดที่ Vega ต้องสกัด:**
- Token config — `tailwind.config.js` / `theme.json` / CSS `:root` variables
- Global CSS — font, `@font-face`, base layer, utility classes ที่ทีมเขียนเอง
- **หน้าที่ commit ล่าสุด** = design language ปัจจุบัน (ใช้ `git log` หา) — อันนี้คือของจริงที่ต้องยึด
- Component pattern จริง — quote className/JSX พร้อม file:line
- UI library theme config (antd `ConfigProvider`, flowbite `theme`, MUI `createTheme`) — ถ้าไม่มี ต้องระบุว่าไม่มี เพราะ default ของ library จะหลุดออกมา
- ของที่ **declare แล้วไม่มีใครใช้** และของที่ **ใช้แต่ไม่ได้ declare** — สองอันนี้คือสัญญาณว่า design system แตก

**กฎเหล็ก (NO MAGIC):** ทุก hex / class / ค่า ต้องมี `file:line` อ้างอิงจริง — ห้ามเดา ห้ามเติมค่าที่ "น่าจะใช่" ถ้า grep แล้วไม่เจอว่าถูกใช้จริง ให้ระบุว่าเป็น dead code

**Output:** `<repo>/DESIGN.md` ตาม template ใน `reference.md`
**Return กลับมา:** executive summary สั้นๆ — จำนวน token ที่สกัดได้ + divergence ที่เจอ + สิ่งที่ตัดสินใจเลือกเป็น canonical พร้อมเหตุผล
