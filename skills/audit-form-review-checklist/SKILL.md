---
name: audit-form-review-checklist
description: Luna audit-form review checklist (form schema, validation, audit logic) — preloaded into Galaxy
user-invocable: false
disable-model-invocation: true
---

> Checklist นี้ถูก **preload เข้า context ของ galaxy** ผ่าน `skills:` ใน `~/.claude/agents/galaxy.md`
> ถ้าต้อง deep review (architecture, framework-specific patterns) → อ่าน `reference.md` ข้างไฟล์นี้
# Audit Form Review — Summary

> Full version: `~/.claude/luna-workspace/templates/_full/audit-form-review.full.md` (load only when deep review needed)

**Header (fill in):** Date, Reviewer, Repo, Form Name/Version, Scope, Review Round
**Save Location:** `<repo>/Luna/reviews/audit-form/<form>-audit-form-review-r<round>-YYYY-MM-DD.md`

---

## Review Checklist (critical 20 items)

### Schema Definition (critical)
- [ ] Field IDs/keys unique + naming convention เดียวทั้ง form (camelCase หรือ snake_case อย่างเดียว)
- [ ] Field types ถูกต้องตาม data ที่เก็บจริง (number ไม่เก็บเป็น string, date ใช้ ISO format)
- [ ] Required vs optional ระบุชัดทุก field + ไม่มี field ที่ required แต่ user มองไม่เห็น
- [ ] ไม่มี orphan fields (field ใน schema ที่ไม่ถูก render / field ที่ render แต่ไม่อยู่ใน schema)

### Validation Rules (critical)
- [ ] min/max/regex/length ครบทุก field ที่รับ input อิสระ (text, number, date)
- [ ] Conditional validation ถูกต้อง (field ที่ required เฉพาะเมื่อเงื่อนไขเป็นจริง)
- [ ] Validation ฝั่ง client ตรงกับฝั่ง server (ไม่พึ่ง client อย่างเดียว)
- [ ] Error messages เป็นภาษาไทยที่ user เข้าใจ (ไม่ใช่ technical message)

### Audit Logic (critical)
- [ ] Scoring formula ถูกต้อง (คะแนนต่อข้อ, weighting, การรวมคะแนน)
- [ ] Weight รวมกันได้ 100% (หรือ normalize ถูกต้อง)
- [ ] Pass/fail criteria ชัดเจน + boundary cases ถูกต้อง (เช่น คะแนนเท่ากับ threshold พอดี)
- [ ] N/A handling ถูกต้อง (ข้อที่ไม่ประเมิน ไม่ถูกนับเป็น 0 และ weight ถูก redistribute)

### Conditional Visibility
- [ ] Show/hide logic ถูกต้อง + ไม่มี circular dependency ระหว่าง fields
- [ ] Field ที่ถูกซ่อน ไม่ถูกนับคะแนน + ค่าถูกเคลียร์เมื่อเงื่อนไขเปลี่ยน (ไม่ submit ค่าค้าง)

### Data Integrity & Traceability
- [ ] ทุกคำตอบมี audit trail (who/when/old value → new value) + resubmission เก็บประวัติ ไม่ overwrite
- [ ] Form version ผูกกับ submission (แก้ form แล้ว submission เก่าไม่พัง)

### UX & i18n
- [ ] Grouping/ordering ของ sections สมเหตุสมผลตาม flow งานจริง + mobile-friendly
- [ ] Labels/help text ภาษาไทยครบ สะกดถูก + ศัพท์ audit ใช้สม่ำเสมอทั้ง form

### Edge Cases
- [ ] Empty/partial submission handle ถูกต้อง (draft save, resume, ไม่คำนวณคะแนนจากข้อมูลไม่ครบ)

---

## Severity Rubric
- **Critical:** Scoring/pass-fail ผิด, ข้อมูล audit หาย/ถูก overwrite, required field ข้ามได้ → block deploy
- **High:** Validation ขาดจน data เสียได้, conditional logic ผิดบาง path, ไม่มี audit trail → แก้ก่อน production
- **Medium:** Label ไม่สม่ำเสมอ, ordering สับสน, missing help text, weak draft handling → แก้ใน 1-2 สัปดาห์
- **Low:** Naming style, minor UX polish, wording → แก้ใน 1-3 เดือน

---

## Dimension Scores

| ด้าน | Score |
|------|-------|
| Schema Definition | /10 |
| Validation Rules | /10 |
| Audit Logic (Scoring) | /10 |
| Conditional Visibility | /10 |
| Data Integrity | /10 |
| Traceability (Audit Trail) | /10 |
| Form UX | /10 |
| i18n / Labels | /10 |
| Edge Case Handling | /10 |
| Production Readiness | /10 |

**Scoring guide:** 10 perfect • 9 missing 1-2 best practices • 8 missing 3-4 • 6-7 acceptable • <6 not ready

---

## Output Format (1-2 บรรทัดต่อ finding)
- `[field/section]:[location] — [Issue] — [Severity] — [Recommendation]`

ตัวอย่าง:
- `safety_score (section 3) — weight รวมทั้ง form ได้ 95% ไม่ใช่ 100% — Critical — ปรับ weight หรือเพิ่ม normalization`
- `hazard_detail — required เฉพาะเมื่อ hazard_found=true แต่ schema ตั้ง required เสมอ — High — เปลี่ยนเป็น conditional required`

---

## TL;DR Block (สำหรับ junior)
- สุขภาพ: ดีมาก/ดี/ปานกลาง/ต้องปรับปรุง — Overall X/10
- Production Ready: ✅/⚠️/❌
- 3 เรื่องสำคัญสุด (1 บรรทัดต่อข้อ + link ไปยัง finding)

---

## Production Readiness Quick-Check
- [ ] ไม่มี Critical/High เหลือ
- [ ] Scoring/weighting ทดสอบด้วย sample submissions แล้ว (รวม boundary + N/A cases)
- [ ] Validation client + server ตรงกัน
- [ ] Audit trail + form versioning พร้อม
- [ ] Labels ภาษาไทยครบ + ผ่านการตรวจโดยเจ้าของงาน
- [ ] Empty/partial/resubmission cases ทดสอบแล้ว
- [ ] Integration กับ BPMN process ทดสอบแล้ว (ถ้ามี)

**Status:** ✅ Ready / ⚠️ Ready w/ Concerns / ❌ Not Ready

---

## Escalation
ถ้าต้อง deep dive (schema/DB mapping detail, scoring engine verification ทีละสูตร, conditional logic matrix, BPMN/Camunda form integration, full traceability audit) ให้ load `~/.claude/luna-workspace/templates/_full/audit-form-review.full.md` — หรือ delegate ตาม scope: schema → Nebula+Nova, UX → Vega+Stella, process → Comet

---
*Audit Form Review Template (Summary) — Galaxy (Business Analyst)*
