# Frontend Repo Review Skill

## 📖 Overview

Skill นี้ใช้สำหรับรีวิว frontend codebase ตามมาตรฐานสากล 8 dimensions เพื่อประเมินความพร้อมก่อน merge, ขึ้น production หรือส่งเข้า PRD

## 🎯 Use Cases

- Review pull request ก่อน merge
- ประเมินความพร้อมขึ้น production
- Review ก่อนส่งเข้า PRD
- Code health check ทั่วไป
- Technical debt assessment

## 🚀 How to Invoke

เมื่อ Luna เรียก Stella ให้ทำ frontend review, Stella จะใช้ skill นี้เป็น guide ในการรีวิว

## 📁 Structure

```
team/stella/skills/frontend-repo-review/
├── SKILL.md              # Main skill definition
├── README.md             # This file
├── checklist.md          # Quick reference checklist
└── references/           # Additional reference materials
```

## 🔗 Related Roles

- **Stella (Frontend Dev)** - Owner และ Primary user ของ skill นี้
- **Lyra (Windsurf Tooling)** - Maintainer ของ skill structure

## 📊 Review Dimensions

1. Functional Correctness
2. Architecture
3. Maintainability
4. Accessibility
5. Performance
6. Security
7. Testing
8. Production Readiness

รายละเอียดแต่ละ dimension ดูใน `SKILL.md`

## 🎯 Priority Levels

- **Critical** - ต้องแก้ก่อน merge (blocker)
- **Major** - ควรแก้ก่อน production
- **Minor** - แก้ได้ทีหลัง

## 📝 Output Format

Skill นี้จะ generate report ใน markdown format พร้อม:
- Executive summary
- Issues แยกตาม priority
- Dimension scores
- Recommendations
- Production readiness decision

---
*Skill ของ Stella (Frontend Dev) - Maintained by Lyra (Windsurf Tooling)*
