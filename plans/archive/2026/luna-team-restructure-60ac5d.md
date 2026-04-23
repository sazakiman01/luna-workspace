# Restructure Luna + Team for Multi-Repo Reuse

จัดโครงสร้าง Luna + Team ใหม่แบบ **Hybrid**: core/team/generic knowledge อยู่ที่ Windsurf global (`C:\Users\sansakritsuk\.windsurf\`) ส่วน project-specific (daily logs, feedback, performance, business schema) อยู่ในแต่ละ repo เพื่อให้ Luna ช่วยงานได้ทุก repo โดยไม่ต้อง copy.

## 🎯 เป้าหมาย
- Luna + Team 10 คน ใช้ได้ทุก repo อัตโนมัติ (ไม่ต้อง copy)
- Learning ข้าม repo ได้ (preferences, insights สะสมที่เดียว)
- แต่ละ project ยังมีพื้นที่แยกสำหรับ context เฉพาะ (daily, schema, business logic)

## 📂 โครงสร้างใหม่

### 🌐 Global: `C:\Users\sansakritsuk\.windsurf\`
```
.windsurf/
├── rules/
│   ├── luna-core.md              # Luna persona + behavior (global)
│   └── project-detect.md         # 🆕 rule ให้ Luna detect repo context
├── workflows/
│   ├── team-delegate.md
│   ├── daily-log.md
│   └── feedback-learn.md
├── skills/                       # (เว้นไว้สำหรับ Phase 2)
├── team/                         # 🆕 ย้ายมาจาก repo
│   ├── team-config.md
│   ├── roles/                    # 10 Role definitions
│   ├── preferences/              # Role preferences (global)
│   ├── skill-gap-analysis.md
│   └── onboarding-template.md
├── Luna/                         # 🆕 Luna global memory
│   ├── preferences.md            # pattern ที่ยืนยันแล้ว (ข้าม repo)
│   ├── insights.md
│   ├── hypothesis.md
│   └── windsurf-updates.md
└── knowledge-package-generic/    # 🆕 generic coding standards
    ├── coding-standards.md       # TS/JS/React ทั่วไป
    └── best-practices.md         # Git, testing, security ทั่วไป
```

### 📦 Per-Repo: `<repo>/`
```
<repo>/
├── .windsurf/
│   └── rules/
│       └── project-context.md    # 🆕 ข้อมูลเฉพาะ repo (tech stack, naming)
├── Luna/
│   ├── daily/                    # Daily notes เฉพาะ repo
│   ├── decisions.md              # Decisions เฉพาะโปรเจกต์
│   ├── feedback.md               # Feedback เฉพาะ repo
│   └── retrospective/
├── team/
│   ├── daily/                    # Team daily logs เฉพาะ repo
│   └── performance.md            # Role performance เฉพาะ repo
└── knowledge-package/            # Project-specific
    ├── 01-tech-stack-architecture.md
    ├── 02-project-structure.md
    ├── 04-firestore-schema-design.md  # (business schema)
    └── ...
```

## 🔄 สิ่งที่ต้องย้าย

**UniformFlow → Global:**
- `team/team-config.md`, `team/roles/`, `team/preferences/`, `team/skill-gap-analysis.md`, `team/onboarding-template.md`
- `Luna/preferences.md`, `insights.md`, `hypothesis.md`, `windsurf-updates.md`
- `knowledge-package/03-coding-standards.md`, `05-best-practices.md` (ส่วน generic) → `knowledge-package-generic/`
- `.windsurf/rules/luna-core.md`, `.windsurf/workflows/*`

**UniformFlow → คงไว้ใน repo:**
- `Luna/daily/`, `decisions.md`, `feedback.md`, `retrospective/`
- `team/daily/`, `team/performance.md`
- `knowledge-package/01, 02, 04` (project-specific)

## 📝 ไฟล์ใหม่ที่ต้องสร้าง

1. **`global/.windsurf/rules/project-detect.md`**
   - สอน Luna ให้ detect repo ปัจจุบัน
   - อ่าน `<repo>/.windsurf/rules/project-context.md` เพื่อรู้บริบท
   - แยก path global vs repo (daily เขียนใน repo, preferences อ่านจาก global)

2. **`<repo>/.windsurf/rules/project-context.md`** (template)
   - ชื่อโปรเจกต์, tech stack, tone, constraints
   - Path mapping (เช่น daily → `Luna/daily/`)

3. **อัปเดต `luna-core.md`**
   - เพิ่ม reference ไปยัง global paths
   - ระบุว่า daily/feedback เขียนใน repo ปัจจุบัน

4. **อัปเดต `team-delegate.md` workflow**
   - อ่าน roles จาก global
   - บันทึก performance ใน repo

## ⚙️ Environment ที่ยืนยันแล้ว
- **เครื่องเดียว** → ไม่ต้อง sync ข้ามเครื่อง
- **Backup: Manual zip เป็นระยะ** → Luna จะ zip global folder ให้เมื่อมีการเปลี่ยนแปลงสำคัญ

## ⚠️ ข้อควรระวัง

- **Backup ก่อนย้าย** — zip `UniformFlow/team/`, `Luna/`, `.windsurf/` ไว้ก่อนเริ่ม migration
- **Path references** — ไฟล์ใน global ต้องไม่ hard-code path repo
- **Manual backup rhythm** — หลัง migration เสร็จ Luna จะเตือนพี่แมน zip `C:\Users\sansakritsuk\.windsurf\` เก็บเมื่อ:
  - Role preferences เปลี่ยนสำคัญ
  - Luna preferences/insights อัปเดตเยอะ
  - ก่อน update Windsurf version ใหญ่
  - เดือนละ 1 ครั้ง (ขั้นต่ำ)

## 🚀 ขั้นตอนทำ (Phase)

**Phase 1: เตรียม (read-only)**
- สำรวจไฟล์ทั้งหมดที่ต้องย้าย
- Backup `UniformFlow/` ทั้งหมด

**Phase 2: สร้าง global structure**
- สร้างโฟลเดอร์ที่ `C:\Users\sansakritsuk\.windsurf\`
- Copy ไฟล์ global ไปไว้

**Phase 3: ปรับ rules + workflows**
- เขียน `project-detect.md`
- อัปเดต `luna-core.md`, `team-delegate.md`
- สร้าง `project-context.md` template

**Phase 4: Clean up UniformFlow**
- ลบไฟล์ที่ย้ายไป global แล้ว
- สร้าง `project-context.md` ใน UniformFlow
- ทดสอบว่า Luna ยังทำงานได้

**Phase 5: ทดสอบ repo ที่ 2**
- สร้าง repo ทดสอบ
- ใส่แค่ `project-context.md`
- ยืนยันว่า Luna + Team ทำงานได้เลย

## 👥 ทีมที่ใช้

- **Orion** (System Architect) — ออกแบบ structure
- **Cosmos** (DevOps) — จัดการ file migration + backup strategy
- **Pulsar** (PM) — แบ่ง phase + timeline
- **Luna** — รีวิวและเสนอ

## ✅ ยืนยันแล้ว
- เครื่องเดียว, backup แบบ manual zip เป็นระยะ
- พร้อมเริ่ม implement เมื่อพี่แมน approve
