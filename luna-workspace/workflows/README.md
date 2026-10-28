# Workflows — ขั้นตอนที่เรียกใช้ซ้ำได้

*ไฟล์ที่นี่คือ **คำอธิบายขั้นตอน** ไม่ใช่ slash command*
*slash command จริงอยู่ที่ `~/.config/opencode/commands/*.md` = wrapper ที่โหลด skill ชื่อเดียวกัน (`~/.config/opencode/skills/`) — ไฟล์ที่นี่คือขั้นตอนที่ skill นั้นอ้างถึง*

---

## 📋 Workflow ที่มี slash command คู่กัน

| Slash Command (`~/.config/opencode/commands/`) | ไฟล์ workflow | Trigger | ใช้ทำอะไร |
|---|---|---|---|
| `/daily-log` | `checklist-daily-log.md` | เมื่อมี decision/learning/feedback | บันทึกที่ `<repo>/Luna/team/daily/YYYY-MM-DD.md` |
| `/team-delegate` | `team-delegate.md`, `checklist-team-delegate.md` | งาน Tier 3 | เลือก Role ที่เหมาะสม |
| `/weekly-retro` | `weekly-retro.md` | ปลายสัปดาห์ | Weekly retro + cross-role patterns |
| `/luna-audit` | `weekly-audit.md`, `quarterly-audit.md` | ตามรอบ / เมื่อพี่แมนขอ | Polaris audit |
| `/luna-archive` | — (skill `luna-archive`) | log เก่ากว่า 14 วัน (ยังไม่มี hook เตือน — รอ plugin เฟส 2) | archive daily log เก่า |

*`/team-spawn` + `agent-teams-mode.md` (Tier 4) ไม่ได้ย้ายมา — opencode ไม่มี Agent Teams → ใช้ Tier 3 หลาย role ขนานแทน · `agent-teams-mode.md` เก็บไว้เป็นประวัติ*

## 📋 Workflow ที่ **ไม่มี** slash command (อ่านเอาเอง)

`feedback-learn.md` · `continuous-improvement.md` · `growth-triggers.md` · `role-creation.md` · `proposed-hooks.md` · `project-detect.md` ฯลฯ

> เดิม README นี้เขียนว่า `/feedback-learn` และ `/weekly-audit` เป็น slash command
> แต่ไม่เคยมีไฟล์ใน `commands/` — แก้ให้ตรงความจริง 2026-08-07

---

## 🎯 เมื่อไหร่ Luna ใช้ Workflow เอง

- **มี decision/learning/feedback:** `/daily-log` — ยังไม่มี gate เตือน (log-gate จะทำเป็น plugin เฟส 2) → ลูน่าต้องเสนอ `/daily-log` เองก่อนจบงาน · *เดิม (Claude Code): Stop hook `scripts/log-gate.ps1`*
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

- ~~`// turbo` annotation → auto-run (run_command tool)~~ — ของ Windsurf เดิม ไม่มีผลใน opencode
- ต้องการ slash command → สร้าง skill ใน `~/.config/opencode/skills/` + wrapper ใน `commands/` (ให้ Lyra ทำ)
- Test ทุก workflow ก่อน commit

---

## 🔗 เกี่ยวข้องกับ

- `rules/team-protocol.md` — กติกาการทำงานของทีม
- `team/team-config.md` — Role catalog สำหรับ team-delegate
- `~/.config/opencode/memory/` (Luna ส่วนกลาง) — ปลายทางของ feedback-learn
- `Luna/retrospective/` — ปลายทางของ weekly-retro (team retro แยกไฟล์ retired 2026-08-17)

---
*Managed by Lyra (opencode Tooling Specialist)*
