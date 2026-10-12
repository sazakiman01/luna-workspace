---
name: bpmn-review-checklist
description: Luna BPMN/Camunda review checklist — preloaded into Comet
user-invocable: false
disable-model-invocation: true
---

> Checklist นี้ถูก **preload เข้า context ของ comet** ผ่าน `skills:` ใน `~/.claude/agents/comet.md`
> ถ้าต้อง deep review (architecture, framework-specific patterns) → อ่าน `reference.md` ข้างไฟล์นี้
# BPMN Workflow Review — Summary

> Full version: `C:\Users\sansakritsuk\.claude\luna-workspace\templates\_full\bpmn-review.full.md` (load only when deep review needed)

**Header (fill in):** Date, Reviewer, Repo, Scope, Review Round
**Save Location:** `<repo>/Luna/reviews/bpmn/<process>-bpmn-review-r<round>-YYYY-MM-DD.md`
**Language:** Descriptions ไทย, technical terms (Gateway, Service Task, FEEL) อังกฤษ, element names ตามไฟล์เดิม

---

## Review Checklist (critical 22 items)

### Process Soundness & Workflow (critical)
- [ ] ทุก node เข้าถึงได้จาก start event (no orphan/unreachable)
- [ ] ทุก path ไปถึง end event (no dead-end)
- [ ] Exclusive gateway มี default flow + condition ครอบคลุมทุกกรณี (mutually exclusive + complete)
- [ ] Parallel gateway ใช้ split+join เป็นคู่ + ไม่มี condition บน outgoing flow
- [ ] Loop ทุกอันมี exit condition

### Camunda Best Practices (critical)
- [ ] Process variables ใช้ semantic naming (ไม่ใช่ `textfield_k0lhrs`)
- [ ] Variable scope & typing ระบุชัด (local vs process, string/number/date/context)
- [ ] Service tasks มี retry & backoff config (`retries` + `retryBackoff`)
- [ ] Service tasks idempotent + มี boundary error event
- [ ] Message correlation keys ระบุชัดเจน
- [ ] ใช้ DMN แทน complex gateway logic เมื่อ logic ซับซ้อน

### Timer & SLA
- [ ] User task สำคัญมี timeout boundary event
- [ ] Timer expressions ใช้ ISO 8601 (`PT1H`, `P1D`) + ระบุ timezone (UTC+7)

### Form Design
- [ ] Field keys ใช้ semantic naming + ไม่มี hardcoded dropdown (ชื่อคน/department)
- [ ] Required fields มี validation; readonly logic consistent ข้าม tasks
- [ ] ไม่มี sensitive fields ที่ expose

### Security & Deployment
- [ ] ไม่มี hardcoded credentials/API keys/emails/URLs ใน BPMN หรือ connector config (ใช้ Camunda secrets)
- [ ] ไม่มี `.env`, `.claude/`, `.windsurf/`, `.cursor/`, process variable dumps ใน repo
- [ ] `.gitignore` ครอบคลุม + ตรวจสอบ git history (`git rm --cached` ถ้ายังค้าง)

### Collaboration & Docs
- [ ] Lane = role/department (ไม่ใช่ชื่อบุคคล) + activity อยู่ใน lane ผู้รับผิดชอบจริง
- [ ] มี `<bpmn:documentation>` ระดับ process + element สำคัญ
- [ ] Process owner / version metadata ชัดเจน

---

## Severity Rubric
- **Critical:** Security risk (leaked secrets/PII), process deadlock (no default flow, orphan), data loss → ต้องแก้ก่อน merge
- **High:** ไม่มี retry/error handling, hardcoded values, no timeout บน user task สำคัญ, anti-pattern ที่กระทบ production → แก้ก่อน production
- **Medium:** Naming/variable convention ผิด, missing documentation, performance suboptimal → แก้ภายใน 1-2 สัปดาห์
- **Low:** Visual readability (crossing flows), minor docs, cosmetic → แก้ภายใน 1-3 เดือน

---

## Dimension Scores (สั้นๆ)

| ด้าน | Score |
|------|-------|
| Workflow Design | /10 |
| Form Design | /10 |
| Camunda Best Practices | /10 |
| Integration Points | /10 |
| Error Handling | /10 |
| Security | /10 |
| Maintainability | /10 |
| Performance | /10 |
| Naming Conventions | /10 |
| Production Readiness | /10 |

---

## Output Format (1-2 บรรทัดต่อ finding)
- `[element ID] — [Issue] — [Severity] — [Recommendation]`

ตัวอย่าง:
- `Gateway_0xa1b2 — ขาด default flow → process ค้างถ้า condition ไม่ตรง — Critical — เพิ่ม default sequence flow ไปยัง error end event`
- `ServiceTask_send_email — hardcoded recipient email — High — ย้ายไป process variable + Camunda secret`

---

## TL;DR Block (สำหรับ junior)
1. สรุป BPMN file 1-2 ประโยค
2. ปัญหาใหญ่ 3-4 ข้อ (1 บรรทัด/ข้อ)
3. ต้องแก้ก่อน deploy: bullet list
4. คะแนนรวม X/10 + Production Readiness status

---

## Production Readiness Quick-Check
- [ ] ไม่มี Critical/High เหลือ
- [ ] Error handling + retry ครบ
- [ ] Timer/timezone ถูกต้อง
- [ ] ไม่มี secrets ใน BPMN
- [ ] Camunda Operate monitoring พร้อม
- [ ] Rollback plan + version compatibility ตรวจแล้ว

**Status:** ✅ Ready / ⚠️ Ready w/ Concerns / ❌ Not Ready

---

## Escalation
ถ้าต้อง deep dive (5-pillar architecture, ADR rejected alternatives, cross-system flow, performance forecast 6-12mo, migration path/reversibility, framework deep checks เช่น Camunda 8.x, BPMN 2.0 event/gateway/task type details) ให้ load `C:\Users\sansakritsuk\.claude\luna-workspace\templates\_full\bpmn-review.full.md`

---
*BPMN Review Template (Summary) — Comet (BPMN/Camunda Expert)*
