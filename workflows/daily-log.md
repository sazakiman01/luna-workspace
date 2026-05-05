---
description: บังคับ Luna บันทึก daily note ทุกงานสำคัญ — มี auto-trigger conditions เพื่อกันลืม
---

# Daily Log Workflow

## 🎯 Goal

ป้องกัน drift ของ `performance.md` และ traceability gap — บันทึกทุก substantive task ทันทีหลังเสร็จ ไม่รอพี่แมนถาม

---

## 🚨 Auto-Trigger Conditions (บังคับ — ไม่ต้องรอสั่ง)

ลูน่า/role ต้องเริ่ม daily log **ทันที** เมื่อเจอ trigger ใดข้อหนึ่ง:

| Trigger | Action |
|---------|--------|
| **T1** จบ task ที่ ≥ 5 tool calls | Append entry ทันที ก่อนตอบสรุปพี่แมน |
| **T2** สร้าง/แก้ไฟล์ที่ผู้ใช้จะใช้จริง (rule, workflow, skill, doc) | Append entry หลัง edit เสร็จ |
| **T3** Decision ที่กระทบทีม / โครงสร้าง | Append entry + update `<repo>/Luna/decisions.md` |
| **T4** พี่แมนให้ feedback / correct | Append entry + update relevant role's `preferences/<role>.md` |
| **T5** Role ทำงานเสร็จ + Luna review เสร็จ | Append entry (5-step pattern step 5) |
| **T6** จบ session — มี task แล้วยังไม่บันทึก | Append entry ก่อน close |

**ห้าม:** ตอบพี่แมนเสร็จแล้วค่อยจำไปบันทึกทีหลัง — บันทึก *ก่อน* ตอบสรุปท้าย

---

## 📂 ไฟล์ที่ต้องเขียน

### `<repo>/Luna/team/daily/YYYY-MM-DD.md` (มุมทีม — บังคับเสมอเมื่อมี role ทำงาน)
- งานที่ทำ, Role ไหนทำอะไรเสร็จ, Decisions, Pending, Files produced
- Use template: `templates/daily-log.template.md`

### `<repo>/Luna/daily/YYYY-MM-DD.md` (มุม Luna ↔ พี่แมน — เมื่อมีบทสนทนาสำคัญ)
- บทสนทนา, mood/feelings, learnings ส่วนตัว

### Per-trigger update files

| Trigger | Update เพิ่มที่ |
|---------|-------------------|
| Decision | `<repo>/Luna/decisions.md` |
| Feedback จากพี่แมน | `<repo>/Luna/feedback.md` |
| Cross-repo pattern | global `Luna/insights.md` |
| Anti-pattern | global `Luna/insights.md` + `team/preferences/<role>.md` |

---

## 🔁 ขั้นตอน Execution

```
1. เช็คไฟล์ <repo>/Luna/team/daily/YYYY-MM-DD.md
   - มีอยู่ → append (ห้าม overwrite) — เพิ่ม section "Append: [time]"
   - ไม่มี → สร้างใหม่จาก templates/daily-log.template.md

2. กรอก section ที่เกี่ยวข้อง:
   - งานที่ทำ (Role + Scope + ผลลัพธ์ + ไฟล์ผลลัพธ์)
   - Decisions (ถ้ามี)
   - Blockers (ถ้ามี)
   - Mood/Feelings (Luna's perspective)
   - Learnings (จาก task)
   - Next Steps (Pending checkboxes)

3. Update files ที่ trigger บอก (ตารางด้านบน)

4. Mark `performance.md` row ของ role ที่ทำ — เพิ่ม Tasks +1, Last active = today

5. ตอบสรุปพี่แมน (หลังบันทึกเสร็จ ไม่ก่อน)
```

---

## 📋 Template สั้น (เมื่อ append แค่ 1 task)

```markdown
## Append: [HH:MM] ICT — [หัวข้อ]
- **Role:** [ชื่อ Role]
- **งาน:** ...
- **Scope:** ...
- **ผลลัพธ์:** ...
- **ไฟล์ผลลัพธ์:** `[path]`
- **Decision:** (ถ้ามี)
- **Learning:** (ถ้ามี)
```

---

## ⚠️ Anti-Patterns (ห้าม)

- ❌ **Overwrite logs เก่า** — append-only เสมอ
- ❌ **ข้ามงานสำคัญ** — ถ้าเข้า trigger T1-T6 ต้องบันทึก
- ❌ **บันทึกท้าย session แบบ batch** — สูญเสียบริบท ลืมรายละเอียด → บันทึกทันทีหลัง task
- ❌ **บันทึกกำกวม** — ระบุไฟล์ผลลัพธ์ + path ทุกครั้ง
- ❌ **ลืม update performance.md** — daily log โดยไม่ update performance ทำให้ drift กลับมา (root cause ของ audit C4)
- ❌ **สร้าง format ใหม่โดยไม่เช็ค templates** — เช็ค `templates/` directory ก่อนสร้าง format ใหม่ทุกครั้ง (Evidence 3/3)

---

## 🔗 Reference

- Template: `templates/daily-log.template.md`
- Rule enforcement: `rules/luna-core.md` (section "การบันทึก")
- Audit หา drift: `team/audits/YYYY-Www-weekly.md`
- Polaris weekly check: `workflows/weekly-audit.md` (Step 2 — "Daily logs last 7 days")

---

*Updated 2026-04-27 by Lyra — Action A5 of `2026-W18-baseline-audit.md` (Phase 2.1 of `plans/luna-principal-elevation-roadmap-6faefc.md`)*
