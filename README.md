# Luna + Team — คู่มือการใช้งาน

**Luna + Team** คือระบบ AI Assistant ที่ติดตั้งครั้งเดียว แล้วใช้ได้กับทุก repo บนเครื่องนี้

ติดตั้งที่: `$env:USERPROFILE\.windsurf\luna-workspace\`

---

## 📁 โครงสร้างระบบ

```
$env:USERPROFILE\.windsurf\
├── argv.json                         # ตั้งค่า Windsurf (ไม่ต้องแก้)
├── extensions/                       # Extensions ของ Windsurf (ไม่ต้องแก้)
└── luna-workspace/                   ← ระบบ Luna + Team (git-controlled)
    ├── README.md                     # คู่มือนี้
    ├── rules/                        # กฎการทำงานของ Luna
    │   └── README.md                 # คู่มือการอ่านกฎต่างๆ
    ├── workflows/                    # คำสั่งทางลัด (slash commands)
    │   └── README.md                 # รายการคำสั่งที่ใช้ได้
    ├── skills/                       # Skills ของ Windsurf
    │   └── README.md
    ├── team/                         # ทีมงาน 11 คน + การตั้งค่า
    │   └── README.md                 # รายชื่อทีมงานและหน้าที่
    ├── Luna/                         # ความจำยาวนานของ Luna
    │   ├── README.md                 # วิธีเรียนรู้และจดจำ
    │   ├── preferences.md            # Pattern ยืนยันแล้ว (Evidence ≥ 3)
    │   ├── insights.md                # Pattern ที่เริ่มเห็นซ้ำ (Evidence 1-2)
    │   ├── hypothesis.md              # Pattern ใหม่ที่ยังไม่ชัดเจน (Evidence 0)
    │   └── team/daily/                # Daily log ของทีมงาน (YYYY-MM-DD.md)
    ├── knowledge-package-generic/    # มาตรฐานการเขียนโค้ดทั่วไป
    │   └── README.md                 # คู่มือการใช้
    ├── templates/                    # แม่แบบสำหรับเริ่มโปรเจกต์ใหม่
    │   └── README.md                 # รายการแม่แบบที่มี
    ├── plans/                        # แผนงานที่กำลังทำอยู่
    │   ├── README.md                 # วิธีตั้งชื่อแผนงาน
    │   └── archive/YYYY/             # แผนงานที่เสร็จแล้ว
    └── repo-index/                   # ดัชนีของแต่ละ repo
        ├── README.md
        └── <repo-name>/              # ข้อมูลของแต่ละ repo
```

**ทุกโฟลเดอร์มี README.md** อธิบายไว้ว่าใช้ทำอะไรและวิธีใช้อย่างไร

---

## 🚀 วิธีใช้กับ Repo ใหม่ (บนเครื่องเดียว)

### วิธีที่ 1: ใช้ Script แนะนำ (ง่ายที่สุด)

รัน script เดียวเสร็จเลย:

```powershell
& "$env:USERPROFILE\.windsurf\luna-workspace\templates\Setup-LunaRepo.ps1" -RepoPath "D:\coding\MyNewRepo"
```

Script จะสร้างโฟลเดอร์และไฟล์ที่จำเป็นให้อัตโนมัติ:
- ✅ สร้างโฟลเดอร์ `.windsurf/rules/`, `Luna/daily/`, `Luna/retrospective/`, `team/daily/`
- ✅ Copy แม่แบบ `project-context.md`
- ✅ สร้างไฟล์ `Luna/decisions.md`, `Luna/feedback.md`, `team/performance.md`

**หลังรัน script:**
1. แก้ไฟล์ `<repo>\.windsurf\rules\project-context.md` ให้ตรงกับโปรเจกต์ของคุณ (tech stack, constraints)
2. เปิด repo ใน Windsurf → Luna + Team พร้อมใช้งาน

**ตัวเลือกเพิ่มเติม:**
- `-ProjectName "ชื่อโปรเจกต์"` — ระบุชื่อเอง (ค่าเริ่มต้น = ชื่อโฟลเดอร์)
- `-Force` — ถ้าไฟล์มีอยู่แล้ว จะเขียนทับ

---

### วิธีที่ 2: ทำเองแบบ Manual

ถ้าไม่อยากใช้ script ทำตามนี้:

**1. สร้างโฟลเดอร์:**
```
<repo>/.windsurf/rules/
<repo>/Luna/daily/
<repo>/Luna/retrospective/
<repo>/team/daily/
```

**2. Copy แม่แบบ:**
```powershell
Copy-Item "$env:USERPROFILE\.windsurf\luna-workspace\templates\project-context.template.md" "<repo>\.windsurf\rules\project-context.md"
```

**3. สร้างไฟล์เริ่มต้น:**
```
<repo>/Luna/decisions.md
<repo>/Luna/feedback.md
<repo>/team/performance.md
```

**4. แก้ไฟล์ `project-context.md`** ให้ตรงกับโปรเจกต์ของคุณ

---

## 👥 ระบบทีมงาน 2 ชั้น

Luna มีทีมงาน 11 คน แบ่งเป็น 2 ชั้น:

### ชั้นที่ 1: Global Team (ทีมทั่วไป)
- อยู่ที่ global เดียว ใช้ได้กับทุก repo
- มี 11 Role เช่น Nova (Backend), Stella (Frontend), Aurora (Integration)
- เก็บไฟล์ที่: `$env:USERPROFILE\.windsurf\luna-workspace\team\roles\`
- ใช้กับงานทั่วไปที่ไม่ต้องรู้รายละเอียดเฉพาะโปรเจกต์

### ชั้นที่ 2: Per-Repo Team (ทีมเฉพาะโปรเจกต์)
- อยู่ในแต่ละ repo เฉพาะเจาะจง
- มี 3 แบบ:
  1. **Context Extension** — เพิ่มความรู้เฉพาะโปรเจกต์ให้ global role
     - ไฟล์: `<repo>\team\roles\[role]-context.md`
     - ตัวอย่าง: `nova-context.md` (บอก Nova ว่าโปรเจกต์นี้ใช้ Firestore schema แบบไหน)
  2. **Custom Role** — สร้าง role ใหม่ที่ไม่มีใน global
     - ไฟล์: `<repo>\team\roles\[role].md`
     - ตัวอย่าง: `phoenix.md` (ผู้เชี่ยวชาญด้านเสื้อผ้า สำหรับโปรเจกต์ UniformFlow)
  3. **Team Roster** — รายชื่อทีม specialist ของ repo
     - ไฟล์: `<repo>\team\team-local.md`

### ตัวอย่างจริงในโปรเจกต์ UniformFlow
```
UniformFlow/team/
├── team-local.md                 # รายชื่อทีม specialist
├── roles/
│   ├── nova-context.md          # เพิ่มความรู้ Firestore schema ให้ Nova
│   ├── aurora-context.md        # เพิ่มความรู้ LIFF + PromptPay ให้ Aurora
│   └── phoenix.md               # Role ใหม่: ผู้เชี่ยวชาญเสื้อผ้า
├── daily/
└── performance.md
```

### วิธีเรียกใช้
- **เรียก global role:** Luna อ่านจาก global เท่านั้น
- **เรียก role ที่มี context:** Luna อ่าน global + context → รู้ทั้งงานทั่วไป + งานเฉพาะโปรเจกต์
- **เรียก custom role:** Luna อ่านจาก repo นั้นโดยตรง

### แม่แบบไฟล์ (Templates)
มีอยู่ใน global `templates/`:
- `team-local.template.md` — สำหรับสร้าง team roster
- `role-context.template.md` — สำหรับสร้าง context extension
- `role-custom.template.md` — สำหรับสร้าง custom role

---

## 💻 วิธีใช้กับเครื่องอื่น

ตอนนี้ระบบ Luna อยู่ที่ `C:\Users\sansakritsuk\.windsurf\` บนเครื่องเดียว

ถ้าคุณใช้เครื่องอื่น (เช่น laptop) และอยากใช้ Luna บนเครื่องนั้นด้วย:

### วิธีที่ 1: Copy แบบ Manual (ง่ายที่สุด)

**1. Backup บนเครื่องเดิม:**
```powershell
Compress-Archive -Path "C:\Users\sansakritsuk\.windsurf" -DestinationPath "D:\backup\windsurf-luna-backup.zip"
```

**2. Copy ไฟล์ zip ไปเครื่องใหม่** (ผ่าน USB, Google Drive, ฯลฯ)

**3. Extract ไปที่เดียวกันบนเครื่องใหม่:**
```
C:\Users\sansakritsuk\.windsurf\
```

**4. เปิด Windsurf บนเครื่องใหม่** → Luna ควรทำงานเหมือนเครื่องเดิม

---

### วิธีที่ 2: Git Sync (แนะนำถ้าใช้ git บ่อย)

**1. สร้าง private repo** บน GitHub/GitLab (ตั้งชื่อเช่น `luna-workspace`)

**2. เริ่มใช้ git บนเครื่องเดิม:**
```powershell
cd $env:USERPROFILE\.windsurf\luna-workspace
git init
git add .
git commit -m "Initial Luna workspace"
git remote add origin https://github.com/YOUR_USERNAME/luna-workspace.git
git push -u origin main
```

**3. Clone ไปเครื่องใหม่:**
```powershell
git clone https://github.com/YOUR_USERNAME/luna-workspace.git $env:USERPROFILE\.windsurf\luna-workspace
```

**4. Sync ข้อมูลข้ามเครื่อง:**
- บนเครื่องเดิม: `git add . && git commit && git push`
- บนเครื่องใหม่: `git pull`

---

## 💾 การ Backup

### แบบ Manual (สำหรับเครื่องเดียว)

**ควร backup เมื่อ:**
- เปลี่ยนการตั้งค่า Role สำคัญๆ
- Luna เรียนรู้ข้อมูลใหม่เยอะๆ
- ก่อนอัปเดต Windsurf version ใหญ่
- อย่างน้อยเดือนละ 1 ครั้ง

**วิธี backup:**
```powershell
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
Compress-Archive -Path "$env:USERPROFILE\.windsurf" -DestinationPath "D:\backup\windsurf-luna-$ts.zip"
```

---

### แบบ Git (ถ้าใช้ Git Sync)

ถ้าใช้วิธี Git Sync ข้างบน ไม่ต้อง backup แบบ manual เพราะ git เก็บประวัติไว้ให้อัตโนมัติ

---

## 🔧 ตรวจสอบว่า Luna ทำงานได้

หลังจาก setup repo ใหม่ หรือย้ายไปเครื่องอื่น ทดสอบตามนี้:

**1. เปิด repo ใน Windsurf**

**2. ถาม Luna คำถามง่ายๆ:**
- "คนในทีมมีใครบ้าง"
- ถ้า Luna ตอบได้ → อ่าน global `team/team-config.md` สำเร็จ

**3. สั่งให้ทีมทำงาน:**
- "ช่วยเขียน component หน้า login ให้หน่อย"
- ถ้า Luna เรียก Stella มาทำงาน → อ่าน global `team/roles/stella.md` สำเร็จ

---

## 📂 ไฟล์สำคัญที่ควรรู้

| ไฟล์ | อยู่ที่ไหน | ใช้ทำอะไร |
|------|-----------|-----------|
| `luna-core.md` | Global `rules/` | บุคลิกและวิธีการทำงานของ Luna |
| `project-detect.md` | Global `rules/` | สอน Luna รู้ว่ากำลังอยู่ repo ไหน |
| `team-config.md` | Global `team/` | รายชื่อทีมงานและหน้าที่ |
| `project-context.md` | Per-repo `.windsurf/rules/` | ข้อมูลเฉพาะโปรเจกต์ (tech stack, constraints) |
| `Setup-LunaRepo.ps1` | Global `templates/` | Script สำหรับ setup repo ใหม่ |
| `project-context.template.md` | Global `templates/` | แม่แบบพร้อมตัวอย่าง |

---

## ❓ ปัญหาที่พบบ่อย

**Q: Luna ตอบไม่ได้ว่าคนในทีมมีใครบ้าง**
- A: ตรวจสอบว่าไฟล์ `team/team-config.md` ใน global มีอยู่จริง

**Q: Luna ไม่รู้ว่า repo นี้ใช้ tech stack อะไร**
- A: ตรวจสอบว่าไฟล์ `<repo>/.windsurf/rules/project-context.md` มีอยู่และแก้ไฟล์นี้แล้ว

**Q: Daily log ไม่ถูกเขียน**
- A: ตรวจสอบว่าโฟลเดอร์ `<repo>/Luna/team/daily/` มีอยู่ (สำหรับงานทีมงาน)
- A: ตรวจสอบว่าโฟลเดอร์ `<repo>/Luna/daily/` มีอยู่ (สำหรับงานส่วนตัว Luna)
- A: Luna ควรบันทึก daily log ทุกครั้งหลังทำงานเสร็จตาม protocol

**Q: ลืม backup ข้อมูล**
- A: zip โฟลเดอร์ `$env:USERPROFILE\.windsurf` ทันที ก่อนเครื่องจะเสีย

---

## 🌙 อ่านเพิ่มเติม

- **Luna Persona:** ดูที่ global `rules/luna-core.md`
- **รายละเอียดทีมงาน:** ดูที่ global `team/roles/`
- **ตัวอย่าง project-context:** ดูที่ global `templates/project-context.template.md` (มีตัวอย่าง 3 แบบ)
- **Daily Log:** ดูที่ `<repo>/Luna/team/daily/YYYY-MM-DD.md` — บันทึกงานที่ทีมทำในแต่ละวัน
- **Learning Patterns:** ดูที่ global `Luna/hypothesis.md`, `Luna/insights.md`, `Luna/preferences.md` — ระบบเรียนรู้ของ Luna

---
*อัปเดต: 2026-04-23 — Global structure cleanup by Orion + Galaxy + Lyra*
