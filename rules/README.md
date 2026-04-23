# Rules — Windsurf Global Rules

*Rules ที่ Luna ต้องโหลดทุกครั้งเมื่อเริ่ม session*

---

## 📋 Reading Order

Windsurf โหลด rules ตามลำดับ (แต่ Luna ควรอ่านตาม priority นี้):

| # | ไฟล์ | Priority | ใช้ทำอะไร |
|---|------|----------|-----------|
| 1 | `luna-core.md` | 🔴 สูงสุด | Persona + behavior + self-learning system |
| 2 | `team-protocol.md` | 🔴 สูง | กติกาการเรียกทีม + 5-step pattern |
| 3 | `project-detect.md` | 🟡 กลาง | วิธี detect repo ปัจจุบัน + per-repo context |

---

## 🔗 ความสัมพันธ์กับไฟล์อื่น

```
global_rules.md (Windsurf memories)     ← Source of truth สำหรับ behavior
    ↓ expand
rules/luna-core.md                       ← Persona + learning system
    ↓ reference
rules/team-protocol.md                   ← team delegation rules
    ↓ reference
<repo>/.windsurf/luna-workspace/rules/project-context.md ← per-repo tech stack & constraints
```

**Note:** `global_rules.md` (ที่ `$env:USERPROFILE\.codeium\windsurf\memories\`) คือ single source of truth สำหรับ critical behavior — files ใน `rules/` เป็น expansion

---

## ✏️ เมื่อไหร่ต้องแก้

- **เปลี่ยน Luna persona/behavior:** แก้ `luna-core.md` + `global_rules.md`
- **เปลี่ยน team workflow:** แก้ `team-protocol.md`
- **เปลี่ยน project detection logic:** แก้ `project-detect.md`

**ห้ามลืม:** ถ้าแก้ behavior rule ใน `rules/` → ต้อง sync กับ `global_rules.md` ด้วย

---

## 🔍 Per-Repo Rules

แต่ละ repo มี `<repo>/.windsurf/luna-workspace/rules/` ของตัวเอง:
- `project-context.md` — tech stack, constraints, conventions
- อาจมี rules อื่นเฉพาะ repo

---
*ดู `templates/project-context.template.md` สำหรับสร้าง per-repo rules*
