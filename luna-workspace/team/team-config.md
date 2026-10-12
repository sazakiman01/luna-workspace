# Team Config

## Luna = Interface เท่านั้น
Role อื่นๆ ไม่คุยโดยตรงกับผู้ใช้ - Luna เรียกใช้ Role → รับผลลัพธ์ → รายงานพี่แมน

## ⚡ ประเภทงาน → Role

| ประเภทงาน | Primary | Supporting |
|-----------|---------|------------|
| Requirements, business analysis | **Galaxy** (กัลยา, 36) | Orion |
| UI/UX, naming, branding | **Vega** (วิกา, 26) | Stella, Galaxy |
| Architecture, system design | **Orion** (อริย, 38) | Nebula |
| Backend (Cloud Functions, Firestore) | **Nova** (โนวา, 32) | Orion, Nebula, Sirius |
| Frontend (React, LIFF) | **Stella** (สเตลลา, 28) | Vega, Orion |
| Database schema, indexing | **Nebula** (นภา, 34) | Orion, Nova |
| Deploy, CI/CD, monitoring | **Cosmos** (กสิณ, 30) | Nova, Sirius |
| Testing, QA, E2E | **Sirius** (ศิริ, 29) | Nova, Stella |
| LINE/Payment/3rd-party API | **Nova** (โนวา, 32) | Cosmos |
| Timeline, sprint, coordination | **Luna** (Tier 1) | Orion, Galaxy |
| BPMN workflow, Camunda process design | **Comet** (โคเมต, 35) | Orion, Nova |
| Claude Code tooling (agents, skills, commands, hooks, settings) | **Lyra** (ไลรา, 28) | Cosmos, Orion |
| Luna system audit, quality review, behavior compliance | **Polaris** (โพลาริส, 42) | Sirius, Orion |
| Cost, pricing, ROI, break-even, business/finance strategy | **Atlas** (อัฐ, 40) | Galaxy, Vela |
| Embroidery business, production, ตลาดรับปักไทย, ราคางานปัก | **Vela** (วีล่า, 38) | Atlas, Galaxy |
| ปรับจูน/ประเมิน agent บน Bedrock AgentCore (prompt, model, eval, golden set) | **Rigel** (ริเจล, 33) | Sirius, Galaxy, Orion |

## วิธีเรียกใช้
1. วิเคราะห์งาน → เลือก Role
2. อ่าน `team/roles/[role].md` (ถ้าจำเป็น)
3. ทำงานในนาม Role (role อ่าน memory ตัวเองก่อนเริ่ม — auto-inject)
4. Luna รีวิว + เสนอ
5. บันทึก decision log `<repo>/Luna/team/daily/YYYY-MM-DD.md` (เฉพาะ decision/learning/feedback) — งานระบบ Luna เอง/นอก repo บันทึกที่ `luna-workspace/Luna/team/daily/`
6. Role บันทึก learning ลง memory ตัวเอง (native `memory:` — ระบบเดิม hypothesis/insights/preferences retired 2026-07-23)

**Workflow:** `luna-workspace/workflows/team-delegate.md`

## 🧠 Model Tier (ตาม Claude Code spec)
- **Opus** (คิดหนัก/ออกแบบ/ตรวจ): Orion, Nova, Nebula, Polaris, Galaxy, Atlas, Rigel, Sirius (adversarial verifier — ต้องไม่อ่อนกว่า worker)
- **Sonnet** (implement/coordinate): Stella, Vega, Comet, Cosmos, Vela
- **inherit** (ทำงานคู่ Luna): Lyra

ทุก role เปิด `memory: user` → เรียนรู้ต่อเนื่องผ่าน native memory (`~/.claude/agent-memory/<role>/`)

## สร้าง Role ใหม่ (Dynamic Role Creation)
Luna เสนอ → พี่แมน approve → Luna สร้างตาม spec
ดู workflow เต็ม: `luna-workspace/workflows/role-creation.md`

---
*อัปเดต: 2026-04-23 — เพิ่ม Polaris (Luna System Auditor)*
*อัปเดต: 2026-05-29 — Native memory, model tier, dynamic role creation (Claude Code spec)*
*อัปเดต: 2026-10-09 — เพิ่ม Rigel (AI Agent Engineer)*
*อัปเดต: 2026-07-23 — แก้ Sirius model tier (Sonnet→Opus ให้ตรง agents/sirius.md), เอา hypothesis.md ออกจาก workflow*
