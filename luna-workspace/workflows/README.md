# Workflows — ขั้นตอนที่เรียกใช้ซ้ำได้

*ไฟล์ที่นี่คือ **คำอธิบายขั้นตอน** ไม่ใช่ slash command*
*slash command จริงอยู่ที่ `~/.claude/commands/*.md` — ไฟล์ที่นี่คือสิ่งที่ command นั้นไปอ่าน*

---

## 📋 Workflow ที่มี slash command คู่กัน

| Slash Command (`~/.claude/commands/`) | ไฟล์ workflow | Trigger | ใช้ทำอะไร |
|---|---|---|---|
| `/daily-log` | `checklist-daily-log.md` | เมื่อมี decision/learning/feedback | บันทึกที่ `<repo>/Luna/team/daily/YYYY-MM-DD.md` |
| `/team-delegate` | `team-delegate.md`, `checklist-team-delegate.md` | งาน Tier 3 | เลือก Role ที่เหมาะสม |
| `/weekly-retro` | `weekly-retro.md` | ปลายสัปดาห์ | Weekly retro + cross-role patterns |
| `/luna-audit` | `weekly-audit.md`, `quarterly-audit.md` | ตามรอบ / เมื่อพี่แมนขอ | Polaris audit |
| `/luna-archive` | — (script โดยตรง) | เมื่อ SessionStart เตือน | archive daily log เก่า |
| `/team-spawn` | `agent-teams-mode.md` | Tier 4 (CLI เท่านั้น) | spawn agent team |

## 📋 Workflow ที่ **ไม่มี** slash command (อ่านเอาเอง)

`feedback-learn.md` · `continuous-improvement.md` · `growth-triggers.md` · `role-creation.md` · `proposed-hooks.md` · `project-detect.md` ฯลฯ

> เดิม README นี้เขียนว่า `/feedback-learn` และ `/weekly-audit` เป็น slash command
> แต่ไม่เคยมีไฟล์ใน `commands/` — แก้ให้ตรงความจริง 2026-08-07

---

## 🎯 เมื่อไหร่ Luna ใช้ Workflow เอง

- **มี decision/learning/feedback:** `/daily-log` — Stop hook (`scripts/log-gate.ps1`) จะเตือนถ้าแก้ไฟล์เยอะแล้วยังไม่บันทึก
- **พี่แมน correct Luna:** อ่าน `feedback-learn.md` แล้วบันทึกเป็น memory (`type=feedback`) ทันที
- **ปลายสัปดาห์:** `/weekly-retro`
- **งาน Tier 3:** `/team-delegate`

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
- memory tool (Luna ส่วนกลาง) — ปลายทางของ feedback-learn
- `Luna/retrospective/` — ปลายทางของ weekly-retro (team retro แยกไฟล์ retired 2026-08-17)

---
*Managed by Lyra (Claude Code Tooling Specialist)*
