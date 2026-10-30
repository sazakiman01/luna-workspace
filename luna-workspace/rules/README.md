# Rules — Luna Core Rules

*Rules ที่ Luna ต้องโหลดทุกครั้งเมื่อเริ่ม session*
*(ปรับจาก Windsurf → Claude Code → opencode 2026-10-28: `global_rules.md`/`CLAUDE.md` เดิมถูกแทนที่ด้วย `AGENTS.md` ซึ่ง opencode inject ให้อัตโนมัติทุก session)*

---

## 📋 Reading Order

opencode inject `AGENTS.md` (global memory) อัตโนมัติทุก session แล้ว — ไฟล์ใน `rules/` คือ detail ที่ Luna อ่านเพิ่มเมื่อจำเป็น ตามลำดับนี้:

| # | ไฟล์ | Priority | ใช้ทำอะไร |
|---|------|----------|-----------|
| 1 | `luna-core.md` | 🔴 สูงสุด | Persona + 4-Tier delegation + Reversibility (R0/R1/R2) + guardrails |
| 2 | `team-protocol.md` | 🔴 สูง | กติกาการเรียกทีม + 5-step pattern |
| 3 | `data-handling.md` | 🔴 สูง | 🔒 Data classification + ห้ามส่ง secret/PII ให้ AI |
| 4 | `project-detect.md` | 🟡 กลาง | วิธี detect repo ปัจจุบัน + per-repo context |

> 🛡️ **AI Governance ชุดเต็ม:** ดูโฟลเดอร์ `luna-workspace/governance/` (policy, checklist, framework mapping) — `data-handling.md` คือกฎบังคับใช้, governance/ คือเอกสารอธิบาย/โชว์

---

## 🔗 ความสัมพันธ์กับไฟล์อื่น

```
C:\Users\<user>\.config\opencode\AGENTS.md   ← Source of truth, opencode inject อัตโนมัติทุก session
    ↓ expand
rules/luna-core.md                           ← Persona + 4-Tier + Reversibility + guardrails (detail)
    ↓ reference
rules/team-protocol.md                       ← team delegation rules
    ↓ reference
<repo>/.opencode/project-context.md          ← per-repo tech stack & constraints (Luna เปิดอ่านเอง)
```

---

## ✏️ เมื่อไหร่ต้องแก้

- **เปลี่ยน Luna persona/behavior:** แก้ `luna-core.md` + `AGENTS.md` (sync ทั้งคู่)
- **เปลี่ยน team workflow:** แก้ `team-protocol.md`
- **เปลี่ยน project detection logic:** แก้ `project-detect.md`

**ห้ามลืม:** ถ้าแก้ behavior rule ใน `rules/` → ต้อง sync กับ `AGENTS.md` ด้วย

---

## 🔍 Per-Repo Context

แต่ละ repo มี `<repo>/.opencode/project-context.md` ของตัวเอง:
- `project-context.md` — tech stack, constraints, conventions
- opencode ไม่ auto-load ไฟล์นี้ → Luna เปิดอ่านเองเมื่อเริ่มงานใน repo

---
*ดู `templates/project-context.template.md` สำหรับสร้าง per-repo rules*
