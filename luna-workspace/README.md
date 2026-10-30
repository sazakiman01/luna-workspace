# Luna + Team — คู่มือสำหรับมือใหม่

**Luna คือใคร?** คือ AI Assistant ประจำตัวคุณ (เหมือนเลขาส่วนตัวที่จำได้ทุกอย่าง)
**Team คืออะไร?** คือทีมงานที่ Luna เรียกมาช่วยทำงานต่างๆ (เหมือนมีทีม Developer ในมือ)

**ติดตั้งที่:** `$env:USERPROFILE\.config\opencode\luna-workspace\` (ระบบลูน่ารันบน opencode ตั้งแต่ 2026-10-28 · เดิม Claude Code ที่ `~/.claude` = fallback)

---

## ⚡ เริ่มต้นใช้งานใน 3 ขั้นตอน

**ขั้นตอนที่ 1 — เปิด opencode**
เปิด **opencode Desktop** (หรือ `opencode-cli`) ในโฟลเดอร์โปรเจกต์

**ขั้นตอนที่ 2 — ถาม Luna**
พิมพ์ในช่องแชท: *"สวัสดี Luna"* หรือ *"ช่วยสร้างหน้า login ให้หน่อย"*

**ขั้นตอนที่ 3 — Luna จัดการให้**
Luna จะวิเคราะห์งาน → เรียกทีมงานที่เหมาะสม → ทำงาน → รายงานผล

> **💡 ตัวอย่าง:** ถ้าคุณขอ "สร้างหน้า login" → Luna จะเรียก **Stella** (Frontend Dev) มาออกแบบและเขียนโค้ดให้

---

## 🏢 เปรียบเทียบเข้าใจง่าย

| ในโลกจริง | ในระบบ Luna |
|-----------|-------------|
| บริษัท | Repo (โปรเจกต์) |
| เลขาส่วนตัว | **Luna** |
| ทีมงาน | รายชื่อครบ + Thai name + subagent_type: `team/team-config.md` (mirror ของ `~/.config/opencode/agents/*.md`) |
| คู่มือบริษัท | `README.md`, `rules/`, `ARCHITECTURE.md` |
| งานประจำวัน | `Luna/team/daily/` |
| การประชุมสรุป | `Luna/retrospective/` |
| ตรวจสอบคุณภาพ | `team/audits/` |
| วัดผลงาน | `team/performance.md`, `templates/scoring-rubric.md` |

---

## 📁 โครงสร้างโฟลเดอร์ (เข้าใจง่าย)

```
luna-workspace/
├── 🔧 SYSTEM (ย้ายข้ามเครื่องได้)
│   │                                  (.clauderules archived 2026-08-07 — Claude Code ไม่อ่าน)
│   ├── rules/                       ← กฎหลักของ Luna
│   ├── workflows/                   ← ขั้นตอนงาน (บางตัวมี command wrapper เช่น /weekly-retro)
│   ├── templates/                   ← แม่แบบทุกชนิด + scripts
│   ├── guides/                      ← (ไม่มีโฟลเดอร์นี้แล้ว — เดิม Claude Code best practices)
│   ├── team/roles/                  ← role definitions (จำนวน: ดู team-config.md)
│   ├── team/<role>/skills/           ← principal skills + basic skills
│   ├── team/<role>/knowledge/        ← domain knowledge
│   ├── knowledge-package-generic/    ← universal coding principles
│   ├── knowledge-package-pmam/       ← PMAM-specific standards
│   └── Luna/skills/                 ← Luna's own principal skill
│
├── 📊 DATA (เกิดจากการใช้งาน)
│   ├── Luna/team/daily/             ← บันทึกงานทีมรายวัน
│   ├── (memory — Luna ส่วนกลาง)      ← feedback/learnings (`~/.config/opencode/memory/` + `project-memory/<slug>/` · แทน hypothesis/insights/preferences.md — retired 2026-07)
│   ├── (agent-memory ของ role)       ← pattern เฉพาะ role (`~/.config/opencode/agent-memory/<role>/`)
│   ├── team/audits/                 ← รายงานตรวจสอบ
│   ├── team/case-studies/           ← case studies จากงานจริง
│   ├── Luna/retrospective/          ← retro รายสัปดาห์ (ฉบับเดียว — team retro retired 2026-08-17)
│   ├── team/performance.md          ← คะแนนทีม (rubric-calibrated)
│   │                                  (health-dashboard.md archived — ใช้ luna-dashboard แทน)
│   ├── plans/                       ← แผนงานที่กำลังทำ
│   └── repo-index/                  ← per-repo state (reviews, processes)
│
└── 🔗 MIXED (เริ่มว่าง → เติมจากงานจริง)
    └── team/preferences/<role>.md    ← learnings ของแต่ละ role
```

> **💡 ทิป:** ดู `ARCHITECTURE.md` สำหรับรายละเอียดว่าไฟล์ไหนเป็น SYSTEM / DATA / MIXED

---

## 🚀 เพิ่ม Luna เข้าไปในโปรเจกต์ใหม่

### วิธีที่ 1: ใช้ Script (ง่ายที่สุด)

```powershell
& "$env:USERPROFILE\.config\opencode\luna-workspace\templates\Setup-LunaRepo.ps1" -RepoPath "D:\coding\MyNewRepo"
```

หลังรัน: แก้ไฟล์ `MyNewRepo/.opencode/project-context.md` — บอก Luna ว่าโปรเจกต์นี้ใช้อะไร → เปิดใน opencode → พร้อมใช้! (opencode ไม่โหลดไฟล์นี้ให้เอง → ลูน่าเปิดอ่านเมื่อเริ่มงาน · memory ราย project อยู่ `~/.config/opencode/project-memory/<slug>/`)

### วิธีที่ 2: ทำเอง (Manual)

```
MyNewRepo/
├── .opencode/project-context.md       ← บอก Luna ว่าโปรเจกต์นี้คืออะไร
└── Luna/team/daily/                   ← บันทึก decision/learning/feedback
```

**ตัวอย่าง `project-context.md`:**
```markdown
# Project: MyNewRepo
- Tech: React + Vite + Firebase
- Style: Tailwind CSS
- Notes: เป็นเว็บขายของออนไลน์
```

---

## 👥 ทีมงาน

รายชื่อ runtime ปัจจุบันมี **14 roles** (source of truth: `team/team-config.md`; agent definitions อยู่ที่ `~/.config/opencode/agents/*.md`):

| Role | หน้าที่ | ใช้เมื่อไหร่ |
|------|---------|-------------|
| **Galaxy** | Business Analyst | วิเคราะห์ requirement และ business analysis |
| **Vega** | UI/UX Designer | UX, naming, branding, accessibility |
| **Orion** | System Architect | architecture และ system design |
| **Nova** | Backend Developer | API, Cloud Functions, Firestore และ integration |
| **Stella** | Frontend Developer | React, LIFF และ UI implementation |
| **Nebula** | Database Designer | schema, index และ data modeling |
| **Cosmos** | DevOps Engineer | deploy, CI/CD และ monitoring |
| **Sirius** | QA Engineer | test strategy, E2E และ quality verification |
| **Comet** | BPMN/Camunda Expert | workflow และ Camunda process |
| **Lyra** | OpenCode Tooling | agents, skills, commands, plugins และ config |
| **Polaris** | Luna System Auditor | compliance, quality และ learning-loop audit |
| **Atlas** | Business & Finance Advisor | cost, pricing, ROI และ business strategy |
| **Vela** | Embroidery Specialist | production และตลาดงานปักไทย |
| **Rigel** | AI Agent Engineer | Bedrock AgentCore prompt/model/eval tuning |

> Luna เป็น interface เดียว: เลือก Tier และ role ที่จำเป็น แล้วสรุปผลกลับให้ผู้ใช้
> Aurora และ Pulsar เลิกใช้แล้ว: งาน integration อยู่กับ Nova และงาน coordination อยู่กับ Luna

### วิธีทำงานของทีม

- งานเล็ก Luna ทำตรง (Tier 1); งาน review ใช้ skill ที่ตรง (Tier 2)
- งานใหญ่, หลายไฟล์ หรือเป็น design decision ใช้ subagent (Tier 3); OpenCode ไม่มี Agent Teams
- งานเสี่ยงด้าน security, schema, money, migration หรือ production ต้องมี human-in-the-loop และ verifier เพิ่ม
- ค่ารันจริงของ model อยู่ที่ frontmatter `model:` ใน `agents/*.md`; `team-config.md` เป็นข้อมูลอ้างอิง

---

## 💻 ใช้ Luna บนเครื่องอื่น

> 📐 ดู `ARCHITECTURE.md` สำหรับรายละเอียดว่าไฟล์ไหนเป็น SYSTEM / DATA

### วิธีที่ 1: Clone ทุกอย่าง (ย้ายเครื่อง — แนะนำ)
```powershell
# ได้เฉพาะ SYSTEM (repo = ~/.config/opencode ทั้งก้อน, branch opencode, allowlist ใน .gitignore)
git clone -b opencode <repo-url> "$env:USERPROFILE\.config\opencode"
```
→ DATA (`Luna/`, memory, plans ฯลฯ) ไม่อยู่ใน git — ต้อง zip ย้ายแยก (ดู ARCHITECTURE.md → Scenario 1)

### วิธีที่ 2: Export เฉพาะ SYSTEM (ให้คนอื่นใช้)
```powershell
# ได้เฉพาะ rules, templates, workflows, skills, knowledge
& "$env:USERPROFILE\.config\opencode\luna-workspace\templates\Export-LunaSystem.ps1" -OutputPath "D:\luna-export"
```
→ คนรับได้ SYSTEM พร้อมใช้ + DATA directories ว่าง (เริ่มสะสมใหม่)

### วิธีที่ 3: Reset fresh (เครื่องเดิม เริ่มใหม่)
```powershell
# ลบ DATA + reset preferences → keep SYSTEM intact (backup อัตโนมัติ)
& "$env:USERPROFILE\.config\opencode\luna-workspace\templates\Reset-LunaData.ps1" -Confirm
```

### ไฟล์อะไรคืออะไร?
| ประเภท | คือ | ตัวอย่าง |
|--------|-----|---------|
| 🔧 **SYSTEM** | โครงสร้างหลัก ไม่เปลี่ยนตามการใช้ | `rules/`, `templates/`, `workflows/`, role skills |
| 📊 **DATA** | เกิดจากการใช้งาน เปลี่ยนทุกวัน | `daily/`, `audits/`, `performance.md` |
| 🔗 **MIXED** | เริ่มว่าง → เติมจากงานจริง | `preferences/<role>.md` |

---

## 💾 Backup ข้อมูล

**เมื่อไหร่ควร backup:**
- เปลี่ยนการตั้งค่าสำคัญ
- อัปเดต opencode version ใหญ่
- อย่างน้อยเดือนละ 1 ครั้ง

**วิธี:**
```powershell
Compress-Archive -Path "$env:USERPROFILE\.config\opencode" -DestinationPath "D:\backup\luna-$(Get-Date -Format yyyyMMdd).zip"
```
⚠️ โฟลเดอร์นี้มี `service.json` / `auth.json` (ความลับ) ติดไปด้วย — เก็บ zip ในที่ปลอดภัย ห้ามแชร์

---

## ✅ ทดสอบว่า Luna ทำงานได้

ลองถามในช่องแชท:
1. *"คนในทีมมีใครบ้าง"* → ตอบจาก `team/team-config.md` (อย่าจำตัวเลขไว้เอง)
2. *"ช่วยสร้างหน้า login"* → ควรเรียก **Stella** มาทำงาน
3. *"สถานะระบบเป็นยังไง"* → รัน `/luna-audit` หรือดู `luna-dashboard` (npm run scan)

ถ้าตอบได้ = พร้อมใช้งาน!

---

## ❓ ปัญหาที่พบบ่อย

| ปัญหา | แก้ไข |
|--------|--------|
| Luna ตอบไม่ได้ว่าทีมมีใคร | เช็ค `team/team-config.md` |
| Luna ไม่รู้ tech stack โปรเจกต์ | แก้ `MyRepo/.opencode/project-context.md` แล้วบอกลูน่าให้อ่าน หรือบันทึกลง `project-memory/<slug>/` |
| ไม่มี daily log | สร้างโฟลเดอร์ `Luna/team/daily/` |
| กลัวข้อมูลหาย | Backup โฟลเดอร์ `~/.config/opencode` เป็น zip (SYSTEM อยู่ใน git แล้ว แต่ DATA ไม่อยู่) |
| ย้ายเครื่อง | `git clone` หรือ `Export-LunaSystem.ps1` |
| เริ่มใหม่สะอาด | `Reset-LunaData.ps1 -Confirm` |

---

## 📚 อ่านเพิ่มเติม (สำหรับคนอยากรู้ลึก)

| หัวข้อ | ไฟล์ |
|--------|------|
| โครงสร้างระบบ (SYSTEM/DATA) | `ARCHITECTURE.md` |
| บุคลิก Luna | `rules/luna-core.md` |
| รายละเอียดทีมรายคน | `team/roles/*.md` |
| คะแนนทีม | `team/performance.md` |
| สถานะระบบรวม | `/luna-audit` หรือ `luna-dashboard` (generated) |
| Scoring rubric | `templates/scoring-rubric.md` |
| Workflows ทั้งหมด | `workflows/` (10 workflows) |
| แม่แบบทุกชนิด | `templates/` |
| ระบบเรียนรู้ | ไฟล์ memory (`~/.config/opencode/memory/`, `project-memory/<slug>/`) + `agent-memory/<role>/` (path เขียนไว้ใน agent) |
| Case studies (จากงานจริง) | `team/case-studies/` |

---

## 🏆 Roadmap Status

Luna Principal Elevation Roadmap — **เสร็จครบ 5 phases:**

| Phase | สถานะ | Output หลัก |
|-------|--------|------------|
| 1. Audit & Foundation | ✅ | Baseline audit, 5 critical findings |
| 2. Operational Discipline | ✅ | 10 workflows + auto-triggers |
| 3. Principal Skills Rewrite | ✅ | 12/12 genuine (0 boilerplate) |
| 4. Knowledge Depth + Rubric | ✅ | Scoring rubric 3-part + calibration |
| 5. Continuous Loop | ✅ | Cadence + growth triggers + dashboard |

---

*อัปเดต: 2026-05-25 — Migrated from Windsurf to Claude Code, repo-index/, BPMN processes reorganized 🌙*
*อัปเดต: 2026-10-28 — Migrated from Claude Code to opencode (path, backup, memory, setup)*
