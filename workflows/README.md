# Workflows — Slash Commands

*Workflow = ขั้นตอนที่เรียกใช้ซ้ำได้ผ่าน `/slash-command`*

---

## 📋 Available Workflows

| Slash Command | ไฟล์ | Trigger | ใช้ทำอะไร |
|---------------|------|---------|-----------|
| `/daily-log` | `daily-log.md` | ท้ายวัน / ก่อนจบงาน | บันทึก daily log ที่ `<repo>/Luna/team/daily/YYYY-MM-DD.md` |
| `/team-delegate` | `team-delegate.md` | เมื่อมีงานเฉพาะทาง | ช่วยเลือก Role ที่เหมาะสม (ใช้ Decision Framework) |
| `/feedback-learn` | `feedback-learn.md` | เมื่อพี่แมน correct Luna | บันทึก feedback → hypothesis.md |
| `/weekly-retro` | `weekly-retro.md` | ทุกวันศุกร์ / ปลายสัปดาห์ | Weekly retrospective + cross-role patterns |
| `/weekly-audit` | `weekly-audit.md` | ทุกวันศุกร์ | Polaris audit: behavior compliance + team perf + learning system |

---

## 🎯 เมื่อไหร่ Luna ใช้ Workflow เอง

- **End of task:** `/daily-log` (auto-trigger ตาม 5-step pattern ขั้นที่ 5)
- **User correction detected:** `/feedback-learn` (auto-trigger)
- **Friday / week end:** `/weekly-retro` (พี่แมน trigger เอง)
- **Ambiguous task:** `/team-delegate` (ถ้าไม่แน่ใจว่าใคร suit)

---

## ✏️ สร้าง Workflow ใหม่

Format (YAML frontmatter + markdown):
```markdown
---
description: [คำอธิบายสั้น]
---
[ขั้นตอนละเอียด]
```

- ใช้ `// turbo` annotation เหนือ step → auto-run (run_command tool)
- Test ทุก workflow ก่อน commit

---

## 🔗 เกี่ยวข้องกับ

- `rules/team-protocol.md` — กติกาการทำงานของทีม
- `team/team-config.md` — Role catalog สำหรับ team-delegate
- `Luna/hypothesis.md` — ปลายทางของ feedback-learn
- `team/retrospective/` — ปลายทางของ weekly-retro

---
*Managed by Lyra (Windsurf Tooling Specialist)*
