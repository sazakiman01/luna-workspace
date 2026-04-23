# Skills — Windsurf Skills

*Skills = detailed instructions ที่ Luna/Cascade invoke ได้อัตโนมัติเมื่อ task match description*

---

## 📁 Current Skills

*(empty — skills ยังไม่ถูก deploy ที่ global)*

---

## 🧠 Skills vs Workflows

| | Skills | Workflows |
|---|--------|-----------|
| **Trigger** | Auto (match description) | Manual (`/slash-command`) |
| **Format** | Complex (supporting files, scripts) | Simple (markdown steps) |
| **Use case** | Specialized expertise / review | Repeated procedures |
| **Location (user-level)** | `$env:USERPROFILE\.codeium\windsurf\skills\` | `.windsurf/workflows/` |

**Note:** User-level skills อยู่ที่ `.codeium\windsurf\skills\` (ตัวอย่างที่ active: `frontend-repo-review`, `skill-review-standard`)

---

## 🎯 Future Skills (Planned)

| Skill | Priority | Maintained By | Purpose |
|-------|----------|---------------|---------|
| `pre-response-filter` | High | Lyra | บังคับ Pre-Response Checklist อัตโนมัติ |
| `team-delegate-auto` | Medium | Lyra | Auto-detect role matching |
| `learning-trigger-filter` | Medium | Lyra | Auto-promote evidence tiers |

---

## ✏️ สร้าง Skill ใหม่

Format:
```
skill-name/
├── SKILL.md          # frontmatter + description
├── supporting-file-1.md
├── supporting-file-2.md
└── ...
```

**Frontmatter:**
```yaml
---
description: [เมื่อไหร่ invoke skill นี้]
---
```

---

## 🔗 เกี่ยวข้องกับ

- `workflows/` — manual alternative
- `rules/luna-core.md` — behavior rules
- User-level skills: `.codeium\windsurf\skills\`

---
*Managed by Lyra (Windsurf Tooling Specialist)*
