# Luna + Team — คู่มือสำหรับมือใหม่

**Luna คือใคร?** คือ AI Assistant ประจำตัวคุณ (เหมือนเลขาส่วนตัวที่จำได้ทุกอย่าง)
**Team คืออะไร?** คือทีมงาน 12 คนที่ Luna เรียกมาช่วยทำงานต่างๆ (เหมือนมีทีม Developer ในมือ)

**ติดตั้งที่:** `$env:USERPROFILE\.windsurf\luna-workspace\`

---

## ⚡ เริ่มต้นใช้งานใน 3 ขั้นตอน

**ขั้นตอนที่ 1 — เปิด Repo ที่ต้องการ**
เปิดโปรเจกต์ (โฟลเดอร์) ใน Windsurf IDE

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
| ทีมงาน 12 คน | **Orion, Nova, Stella, Nebula, Cosmos, Sirius, Galaxy, Vega, Aurora, Pulsar, Lyra, Polaris** |
| คู่มือบริษัท | `README.md`, `rules/`, `ARCHITECTURE.md` |
| งานประจำวัน | `Luna/team/daily/` |
| การประชุมสรุป | `team/retrospective/` |
| ตรวจสอบคุณภาพ | `team/audits/` |
| วัดผลงาน | `team/performance.md`, `templates/scoring-rubric.md` |

---

## 📁 โครงสร้างโฟลเดอร์ (เข้าใจง่าย)

```
luna-workspace/
├── 🔧 SYSTEM (ย้ายข้ามเครื่องได้)
│   ├── rules/                       ← กฎหลักของ Luna
│   ├── workflows/                   ← คำสั่ง (/weekly-audit, /weekly-retro, ...)
│   ├── templates/                   ← แม่แบบทุกชนิด + scripts
│   ├── team/roles/                  ← role definitions (12 คน)
│   ├── team/<role>/skills/           ← principal skills + basic skills
│   ├── team/<role>/knowledge/        ← domain knowledge
│   ├── knowledge-package-generic/    ← universal coding principles
│   ├── knowledge-package-pmam/       ← PMAM-specific standards
│   └── Luna/skills/                 ← Luna’s own principal skill
│
├── 📊 DATA (เกิดจากการใช้งาน)
│   ├── Luna/team/daily/             ← บันทึกงานทีมรายวัน
│   ├── Luna/hypothesis.md           ← pattern ที่สังเกตได้ (รอยืนยัน)
│   ├── Luna/insights.md             ← pattern ที่ยืนยันแล้ว
│   ├── Luna/preferences.md          ← พฤติกรรมที่เรียนรู้แล้ว
│   ├── team/audits/                 ← รายงานตรวจสอบ
│   ├── team/case-studies/           ← case studies จากงานจริง
│   ├── team/retrospective/          ← retro รายสัปดาห์
│   ├── team/performance.md          ← คะแนนทีม (rubric-calibrated)
│   ├── team/health-dashboard.md     ← system health ภาพรวม
│   └── plans/                       ← แผนงานที่กำลังทำ
│
└── 🔗 MIXED (เริ่มว่าง → เติมจากงานจริง)
    └── team/preferences/<role>.md    ← learnings ของแต่ละ role
```

> **💡 ทิป:** ดู `ARCHITECTURE.md` สำหรับรายละเอียดว่าไฟล์ไหนเป็น SYSTEM / DATA / MIXED

---

## 🚀 เพิ่ม Luna เข้าไปในโปรเจกต์ใหม่

### วิธีที่ 1: ใช้ Script (ง่ายที่สุด)

```powershell
& "$env:USERPROFILE\.windsurf\luna-workspace\templates\Setup-LunaRepo.ps1" -RepoPath "D:\coding\MyNewRepo"
```

หลังรัน: แก้ไฟล์ `MyNewRepo\.windsurf\rules\project-context.md` — บอก Luna ว่าโปรเจกต์นี้ใช้อะไร → เปิดใน Windsurf → พร้อมใช้!

### วิธีที่ 2: ทำเอง (Manual)

```
MyNewRepo/
├── .windsurf/rules/project-context.md   ← บอก Luna ว่าโปรเจกต์นี้คืออะไร
├── Luna/team/daily/                     ← บันทึกงานทีม
└── Luna/daily/                          ← บันทึก Luna ส่วนตัว
```

**ตัวอย่าง `project-context.md`:**
```markdown
# Project: MyNewRepo
- Tech: React + Vite + Firebase
- Style: Tailwind CSS
- Notes: เป็นเว็บขายของออนไลน์
```

---

## 👥 ทีมงาน 12 คน

Luna มีทีมงาน 12 คน ทุกคนมี principal skill เฉพาะทาง:

| ชื่อ | หน้าที่ | ใช้เมื่อไหร่ | Skill Score |
|------|---------|-------------|------------|
| **Orion** | System Architect | วางแผน architecture | 9.3 🌟 |
| **Nova** | Backend Dev | เขียน API, Cloud Functions | 4.3 🟡 |
| **Stella** | Frontend Dev | สร้างหน้าเว็บ, React, UI | 10.0 🌟 |
| **Nebula** | Database Designer | ออกแบบ Firestore schema | 4.3 🟡 |
| **Cosmos** | DevOps Engineer | Deploy, CI/CD, Firebase | 4.3 🟡 |
| **Sirius** | QA Engineer | เทสระบบ, Risk-Coverage Matrix | 9.3 🌟 |
| **Galaxy** | Business Analyst | วิเคราะห์ requirement | ~1.4 🔴 |
| **Vega** | UI/UX Designer | ออกแบบหน้าตา, accessibility | 7.1 🟢 |
| **Aurora** | Integration Specialist | เชื่อมต่อ LINE, Payment | 4.3 🟡 |
| **Pulsar** | Project Manager | จัดการ timeline, retro | 8.6 🌟 |
| **Lyra** | Windsurf Tooling | ปรับแต่งเครื่องมือ, workflows | 9.3 🌟 |
| **Polaris** | Luna System Auditor | ตรวจสอบคุณภาพ, ความถูกต้อง | 9.3 🌟 |

> คะแนนใช้ **Scoring Rubric 3-Part** — ดู `templates/scoring-rubric.md`
> 🌟 Principal (8.5+) · 🟢 Genuine (7.0+) · 🟡 Skeleton (4.0+) · 🔴 Fail (<4.0)

### ทีมงาน 2 ระดับ

**ระดับ 1: ทีมหลัก (Global)** — อยู่ใน `luna-workspace/team/roles/` ใช้ได้กับทุกโปรเจกต์

**ระดับ 2: ทีมเฉพาะโปรเจกต์ (Per-Repo)** — อยู่ใน `MyRepo/team/` เพิ่ม domain knowledge

---

## 💻 ใช้ Luna บนเครื่องอื่น

> 📐 ดู `ARCHITECTURE.md` สำหรับรายละเอียดว่าไฟล์ไหนเป็น SYSTEM / DATA

### วิธีที่ 1: Clone ทุกอย่าง (ย้ายเครื่อง — แนะนำ)
```powershell
# ได้ทั้ง SYSTEM + DATA + history
git clone <repo-url> "$env:USERPROFILE\.windsurf\luna-workspace"
```

### วิธีที่ 2: Export เฉพาะ SYSTEM (ให้คนอื่นใช้)
```powershell
# ได้เฉพาะ rules, templates, workflows, skills, knowledge
& "$env:USERPROFILE\.windsurf\luna-workspace\templates\Export-LunaSystem.ps1" -OutputPath "D:\luna-export"
```
→ คนรับได้ SYSTEM พร้อมใช้ + DATA directories ว่าง (เริ่มสะสมใหม่)

### วิธีที่ 3: Reset fresh (เครื่องเดิม เริ่มใหม่)
```powershell
# ลบ DATA + reset preferences → keep SYSTEM intact (backup อัตโนมัติ)
& "$env:USERPROFILE\.windsurf\luna-workspace\templates\Reset-LunaData.ps1" -Confirm
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
- อัปเดต Windsurf version ใหญ่
- อย่างน้อยเดือนละ 1 ครั้ง

**วิธี:**
```powershell
Compress-Archive -Path "$env:USERPROFILE\.windsurf" -DestinationPath "D:\backup\luna-$(Get-Date -Format yyyyMMdd).zip"
```

---

## ✅ ทดสอบว่า Luna ทำงานได้

ลองถามในช่องแชท:
1. *"คนในทีมมีใครบ้าง"* → ควรตอบได้ 12 คน (อ่านจาก `team/team-config.md`)
2. *"ช่วยสร้างหน้า login"* → ควรเรียก **Stella** มาทำงาน
3. *"สถานะระบบเป็นยังไง"* → ควรเห็น `team/health-dashboard.md`

ถ้าตอบได้ = พร้อมใช้งาน!

---

## ❓ ปัญหาที่พบบ่อย

| ปัญหา | แก้ไข |
|--------|--------|
| Luna ตอบไม่ได้ว่าทีมมีใคร | เช็ค `team/team-config.md` |
| Luna ไม่รู้ tech stack โปรเจกต์ | แก้ `MyRepo/.windsurf/rules/project-context.md` |
| ไม่มี daily log | สร้างโฟลเดอร์ `Luna/team/daily/` |
| กลัวข้อมูลหาย | Backup โฟลเดอร์ `.windsurf` เป็น zip หรือ `git push` |
| ย้ายเครื่อง | `git clone` หรือ `Export-LunaSystem.ps1` |
| เริ่มใหม่สะอาด | `Reset-LunaData.ps1 -Confirm` |

---

## 📚 อ่านเพิ่มเติม (สำหรับคนอยากรู้ลึก)

| หัวข้อ | ไฟล์ |
|--------|------|
| โครงสร้างระบบ (SYSTEM/DATA) | `ARCHITECTURE.md` |
| บุคลิก Luna | `rules/luna-core.md` |
| รายละเอียดทีม 12 คน | `team/roles/*.md` |
| คะแนนทีม | `team/performance.md` |
| สถานะระบบรวม | `team/health-dashboard.md` |
| Scoring rubric | `templates/scoring-rubric.md` |
| Workflows ทั้งหมด | `workflows/` (10 workflows) |
| แม่แบบทุกชนิด | `templates/` |
| ระบบเรียนรู้ | `Luna/hypothesis.md` → `insights.md` → `preferences.md` |
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

*อัปเดต: 2026-04-27 — Phase 5 complete, SYSTEM/DATA separation, 12 roles scored 🌙*
