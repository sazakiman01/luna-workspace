# Team Config

## Luna = Interface เท่านั้น
Role อื่นๆ ไม่คุยโดยตรงกับผู้ใช้ - Luna เรียกใช้ Role → รับผลลัพธ์ → รายงานพี่แมน

## ⚡ ประเภทงาน → Role

| ประเภทงาน | Primary | Supporting |
|-----------|---------|------------|
| Requirements, business analysis | **Galaxy** (กัลยา, 36) | Orion, Pulsar |
| UI/UX, naming, branding | **Vega** (วิกา, 26) | Stella, Galaxy |
| Architecture, system design | **Orion** (อริย, 38) | Nebula, Pulsar |
| Backend (Cloud Functions, Firestore) | **Nova** (โนวา, 32) | Orion, Nebula, Sirius |
| Frontend (React, LIFF) | **Stella** (สเตลลา, 28) | Vega, Orion |
| Database schema, indexing | **Nebula** (นภา, 34) | Orion, Nova |
| Deploy, CI/CD, monitoring | **Cosmos** (กสิณ, 30) | Nova, Sirius |
| Testing, QA, E2E | **Sirius** (ศิริ, 29) | Nova, Stella |
| LINE/Payment/3rd-party API | **Aurora** (อรุณ, 31) | Nova, Cosmos |
| Timeline, sprint, coordination | **Pulsar** (พัลซาร์, 40) | Orion, Galaxy |
| BPMN workflow, Camunda process design | **Comet** (โคเมต, 35) | Orion, Nova, Aurora |
| Windsurf tooling (workflows, skills, rules, memories) | **Lyra** (ไลรา, 28) | Cosmos, Orion |
| Luna system audit, quality review, behavior compliance | **Polaris** (โพลาริส, 42) | Sirius, Orion, Pulsar |

## วิธีเรียกใช้
1. วิเคราะห์งาน → เลือก Role
2. อ่าน `team/roles/[role].md` + `team/preferences/[role].md` (ถ้าจำเป็น)
3. ทำงานในนาม Role
4. Luna รีวิว + เสนอ
5. บันทึก `<repo>/Luna/team/daily/YYYY-MM-DD.md` (ใช้ template จาก `templates/daily-log.template.md`)
6. สรุป learnings → บันทึกใน `hypothesis.md` (ถ้าพบ pattern ใหม่)

**Workflow:** `.windsurf/workflows/team-delegate.md`

## สร้าง Role ใหม่
ใช้ `skill-gap-analysis.md` + `onboarding-template.md` → update ไฟล์นี้ → บันทึก daily

---
*อัปเดต: 2026-04-23 — เพิ่ม Polaris (Luna System Auditor)*
