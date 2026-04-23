# Luna + Team — คู่มือการใช้งาน

*Luna + Team ติดตั้งครั้งเดียวที่ `$env:USERPROFILE\.windsurf\luna-workspace\` ใช้ได้ทุก repo บนเครื่องนี้*

---

## 📁 โครงสร้าง

```
$env:USERPROFILE\.windsurf\
├── argv.json                         # Windsurf config (ไม่แตะ)
├── extensions/                       # Managed by Windsurf (ไม่แตะ)
└── luna-workspace/                   ← Luna AI system (git-controlled)
    ├── README.md                     # ไฟล์นี้
    ├── rules/                        # Luna core + team protocol + project-detect
    │   └── README.md                 # → reading order, priority
    ├── workflows/                    # /daily-log, /team-delegate, /feedback-learn, /weekly-retro
    │   └── README.md                 # → slash commands catalog
    ├── skills/                       # Windsurf skills (global) + planned skills
    │   └── README.md
    ├── team/                         # team-config + 11 Roles (roles/ + preferences/)
    │   └── README.md                 # → team overview + role catalog
    ├── Luna/                         # Luna long-term memory
    │   └── README.md                 # → 3-tier learning
    ├── knowledge-package-generic/    # Generic coding standards (cross-repo)
    │   └── README.md                 # → scope & usage
    ├── templates/                    # Templates สำหรับ setup repo ใหม่
    │   └── README.md                 # → template catalog
    ├── plans/                        # Planning mode artifacts (active)
    │   ├── README.md                 # → naming convention + lifecycle
    │   └── archive/YYYY/             # Completed/superseded plans
    └── repo-index/                   # Centralized per-repo index (Hybrid)
        ├── README.md
        └── <repo-name>/              # Index ของแต่ละ repo
```

ทุก sub-folder มี `README.md` อธิบายจุดประสงค์ + วิธีใช้

---

## 🚀 วิธีใช้กับ Repo ใหม่ (บนเครื่องเดียว)

### แบบง่ายที่สุด: ใช้ Setup Script

```powershell
& "$env:USERPROFILE\.windsurf\luna-workspace\templates\Setup-LunaRepo.ps1" -RepoPath "D:\coding\MyNewRepo"
```

> **หมายเหตุ:** Script ใช้ dynamic path แล้ว — ใช้ได้กับ user ต่างกันโดยไม่ต้องแก้อะไร

Script จะทำให้อัตโนมัติ:
- ✅ สร้างโฟลเดอร์ `.windsurf/rules/`, `Luna/daily/`, `Luna/retrospective/`, `team/daily/`
- ✅ Copy `project-context.md` จาก template
- ✅ สร้าง `Luna/decisions.md`, `Luna/feedback.md`, `team/performance.md`

**หลัง setup:**
1. แก้ `<repo>\.windsurf\rules\project-context.md` ให้ตรงกับ tech stack/constraints
2. เปิด repo ใน Windsurf → Luna + Team พร้อมใช้งาน

### Options ของ Script
- `-ProjectName "ชื่อโปรเจกต์"` — ระบุชื่อเอง (default = ชื่อโฟลเดอร์)
- `-Force` — overwrite ไฟล์ที่มีอยู่แล้ว

### แบบ Manual (ถ้าไม่อยากใช้ script)

1. สร้างโฟลเดอร์:
   ```
   <repo>/.windsurf/rules/
   <repo>/Luna/daily/
   <repo>/Luna/retrospective/
   <repo>/team/daily/
   ```

2. Copy template:
   ```powershell
   Copy-Item "$env:USERPROFILE\.windsurf\luna-workspace\templates\project-context.template.md" "<repo>\.windsurf\rules\project-context.md"
   ```

3. สร้างไฟล์เริ่มต้น:
   ```
   <repo>/Luna/decisions.md
   <repo>/Luna/feedback.md
   <repo>/team/performance.md
   ```

4. แก้ `project-context.md` ให้ตรงกับโปรเจกต์

---

## � 2-Tier Team Model

Luna ใช้ทีมแบบ 2 ชั้น:

### Tier 1: Global Team (generic) — อยู่ที่ global
- 10 Role ทั่วไป (Nova, Stella, Aurora, ฯลฯ) — รู้งาน generic
- เก็บที่ `$env:USERPROFILE\.windsurf\luna-workspace\team\roles\`

### Tier 2: Per-Repo Team (specific) — อยู่ในแต่ละ repo
- **Context Extension** — extend global role ด้วย knowledge เฉพาะ repo
  - ไฟล์: `<repo>\team\roles\[role]-context.md` (เช่น `nova-context.md`)
- **Custom Role** — role ใหม่เฉพาะ repo (ไม่มีใน global)
  - ไฟล์: `<repo>\team\roles\[role].md` (เช่น `phoenix.md`)
- **Team Roster** — list ทีม specialist ของ repo
  - ไฟล์: `<repo>\team\team-local.md`

### ตัวอย่างใน UniformFlow
```
UniformFlow/team/
├── team-local.md                 # roster — list specialist
├── roles/
│   ├── nova-context.md          # extend Nova (รู้ Firestore schema ของ UniformFlow)
│   ├── aurora-context.md        # extend Aurora (รู้ LIFF + PromptPay)
│   └── phoenix.md               # custom role (Garment Domain Expert)
├── daily/
└── performance.md
```

### วิธีใช้งาน
- **เรียก global role ธรรมดา:** Luna อ่าน global role เท่านั้น
- **เรียก role ที่มี context:** Luna อ่าน global + context → รู้ทั้ง generic + specific
- **เรียก custom role:** Luna อ่านจาก per-repo `team/roles/` โดยตรง

### Templates ใน global (ใช้สร้างไฟล์ใหม่)
- `templates/team-local.template.md` — สำหรับ team roster
- `templates/role-context.template.md` — สำหรับ context extension
- `templates/role-custom.template.md` — สำหรับ custom role

---

## �💻 วิธีใช้กับเครื่องอื่น

ตอนนี้ global folder อยู่ที่ `C:\Users\sansakritsuk\.windsurf\` บนเครื่องเดียว

ถ้าพี่แมนใช้เครื่องอื่น (เช่น laptop) และอยากใช้ Luna บนเครื่องนั้นด้วย:

### วิธีที่ 1: Manual Copy (ง่ายที่สุด)

1. **Backup global folder** บนเครื่องเดิม:
   ```powershell
   Compress-Archive -Path "C:\Users\sansakritsuk\.windsurf" -DestinationPath "D:\backup\windsurf-luna-backup.zip"
   ```

2. **Copy zip ไปเครื่องใหม่**

3. **Extract ไปที่เดียวกัน**:
   ```
   C:\Users\sansakritsuk\.windsurf\  (บนเครื่องใหม่)
   ```

4. **ตรวจสอบ** — เปิด Windsurf บนเครื่องใหม่ → Luna ควรทำงานเหมือนเครื่องเดิม

### วิธีที่ 2: Git Sync (แนะนำถ้าใช้ git บ่อย)

1. **สร้าง private repo** บน GitHub/GitLab (เช่น `luna-workspace`)

2. **Init git** บนเครื่องเดิม:
   ```powershell
   cd $env:USERPROFILE\.windsurf\luna-workspace
   git init
   git add .
   git commit -m "Initial Luna workspace"
   git remote add origin https://github.com/sazakiman01/luna-workspace.git
   git push -u origin main
   ```

3. **Clone ไปเครื่องใหม่**:
   ```powershell
   git clone https://github.com/sazakiman01/luna-workspace.git $env:USERPROFILE\.windsurf\luna-workspace
   ```

4. **Sync ข้ามเครื่อง**:
   - เครื่องเดิม: `git add . && git commit && git push`
   - เครื่องใหม่: `git pull`

---

## 💾 Backup Strategy

### Manual Backup (แนะนำสำหรับเครื่องเดียว)

**Backup เมื่อ:**
- Role preferences เปลี่ยนสำคัญ
- Luna preferences/insights อัปเดตเยอะ
- ก่อน update Windsurf version ใหญ่
- เดือนละ 1 ครั้ง (ขั้นต่ำ)

**วิธี backup:**
```powershell
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
Compress-Archive -Path "$env:USERPROFILE\.windsurf" -DestinationPath "D:\backup\windsurf-luna-$ts.zip"
```

### Git Backup (ถ้าใช้ Git Sync)

Git repo คือ backup อัตโนมัติ — ไม่ต้อง zip

---

## 🔧 ตรวจสอบว่า Luna ทำงานได้

หลัง setup repo ใหม่ หรือเปลี่ยนเครื่อง:

1. **เปิด repo ใน Windsurf**

2. **ถาม Luna คำถามง่ายๆ:**
   - "คนในทีมมีใครบ้าง"
   - Luna ตอบได้ → อ่าน global `team/team-config.md` สำเร็จ

3. **เรียกทีมให้ทำงาน:**
   - "ช่วยเขียน component หน้า login ให้หน่อย"
   - Luna ประกาศเรียก Stella → อ่าน global `team/roles/stella.md` สำเร็จ

---

## 📂 ไฟล์สำคัญที่ต้องรู้

| ไฟล์ | อยู่ที่ไหน | ใช้ทำอะไร |
|------|-----------|-----------|
| `luna-core.md` | Global `rules/` | Persona + behavior ของ Luna |
| `project-detect.md` | Global `rules/` | สอน Luna detect repo ปัจจุบัน |
| `team-config.md` | Global `team/` | Mapping งาน → Role |
| `project-context.md` | Per-repo `.windsurf/rules/` | บริบทเฉพน repo (tech stack, constraints) |
| `Setup-LunaRepo.ps1` | Global `templates/` | Script setup repo ใหม่ |
| `project-context.template.md` | Global `templates/` | Template พร้อมตัวอย่าง mockup |

---

## ❓ ปัญหาที่พบบ่อย

**Q: Luna ตอบไม่ได้ว่าคนในทีมมีใครบ้าง**
- A: ตรวจว่า global `team/team-config.md` มีอยู่จริง

**Q: Luna ไม่รู้ว่า repo นี้ใช้ tech stack อะไร**
- A: ตรวจว่า `<repo>/.windsurf/rules/project-context.md` มีอยู่และแก้แล้ว

**Q: Daily log ไม่เขียน**
- A: ตรวจว่า `<repo>/Luna/daily/` และ `<repo>/team/daily/` มีอยู่

**Q: ลืม backup global folder**
- A: zip `$env:USERPROFILE\.windsurf` ทันที ก่อนเครื่องพัง

---

## 🌙 ข้อมูลเพิ่มเติม

- **Luna Persona:** ดู global `rules/luna-core.md`
- **Team Roles:** ดู global `team/roles/`
- **Project Context Template:** ดู global `templates/project-context.template.md` (มีตัวอย่าง mockup 3 แบบ)

---
*อัปเดต: 2026-04-23 — Global structure cleanup by Orion + Galaxy + Lyra*
