---
name: audit-form-review
description: Use this skill when reviewing audit forms or audit form definitions (form schema, field validation, audit logic). Triggers on "review audit form", "ตรวจฟอร์ม audit", "audit form review", "ตรวจ schema form". Delegates to Galaxy, who has the checklist preloaded.
allowed-tools: Agent, Read, Glob, Grep
---

# Audit form Review Skill

**Delegate to `subagent_type: galaxy`** ด้วย Agent tool

Galaxy ได้ checklist เต็มอัตโนมัติจาก `skills: audit-form-review-checklist` ใน frontmatter ของตัวเอง

**ส่งไปใน prompt:** ขอบเขตงาน (ไฟล์/feature/PR) + บริบท repo + deliverable ที่ต้องการ

**จุดที่ Galaxy ต้องดู:**
- Form schema completeness
- Field validation rules
- Audit logic correctness
- Conditional / branching logic
- ถ้าแตะ data model → consult nebula/nova
- ถ้าแตะ UI → consult vega/stella

**Deep review** (architecture / framework-specific patterns) → บอกให้อ่าน `reference.md` ข้าง SKILL.md ของ checklist

**Output:** review report ตาม format ใน checklist + severity rating
**บันทึกที่:** `<repo>/Luna/reviews/audit-form/<form>-audit-form-review-r<round>-YYYY-MM-DD.md`
