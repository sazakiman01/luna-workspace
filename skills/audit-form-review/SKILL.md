---
name: audit-form-review
description: Use this skill when reviewing audit forms or audit form definitions (form schema, field validation, audit logic). Triggers on "review audit form", "ตรวจฟอร์ม audit", "audit form review", "ตรวจ schema form". Delegates to Galaxy, who has the checklist preloaded.
---

# Audit form Review Skill

**Delegate ให้ subagent `galaxy`** ด้วย task tool

Galaxy จะโหลด checklist `audit-form-review-checklist` เองด้วย skill tool (สั่งไว้ใน agent ของ Galaxy แล้ว)

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
