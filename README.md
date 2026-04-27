# Luna + Team — คู่มือสำหรับมือใหม่

**Luna คือใคร?** คือ AI Assistant ประจำตัวคุณ (เหมือนเลขาส่วนตัวที่จำได้ทุกอย่าง)
**Team คืออะไร?** คือทีมงาน 11 คนที่ Luna เรียกมาช่วยทำงานต่างๆ (เหมือนมีทีม Developer ในมือ)

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
| ทีมงาน 11 คน | **Orion, Nova, Stella, Nebula...** |
| คู่มือบริษัท | `README.md`, `rules/` |
| งานประจำวัน | `daily/` |
| การประชุมสรุป | `retrospective/` |

---

## 📁 โครงสร้างโฟลเดอร์ (เข้าใจง่าย)

```
luna-workspace/
├── rules/              ← กฎการทำงานของ Luna (อ่านก่อนใช้)
├── workflows/          ← คำสั่งสั้นๆ ที่พิมพ์ได้ (เช่น /weekly-retro)
├── skills/             ← ชุดความรู้เฉพาะทาง (เช่น code-review)
├── team/               ← ประวัติทีมงาน 11 คน + การตั้งค่า
│   └── roles/          ← ประวัติแต่ละคน (orion.md, stella.md, ...)
├── Luna/               ← ความจำของ Luna (เรียนรู้จากการคุย)
│   ├── daily/          ← บันทึกงานแต่ละวัน
│   └── team/daily/     ← บันทึกงานทีมแต่ละวัน
├── templates/          ← แม่แบบสำหรับสร้างโปรเจกต์ใหม่
└── plans/              ← แผนงานที่กำลังทำ
```

> **💡 ทิป:** ทุกโฟลเดอร์มี `README.md` อธิบายไว้ — ถ้าสงสัยให้เปิดอ่าน

---

## 🚀 เพิ่ม Luna เข้าไปในโปรเจกต์ใหม่

### วิธีที่ 1: ใช้ Script (ง่ายที่สุด)

เปิด PowerShell แล้วรัน:

```powershell
& "$env:USERPROFILE\.windsurf\luna-workspace\templates\Setup-LunaRepo.ps1" -RepoPath "D:\coding\MyNewRepo"
```

Script จะสร้างโฟลเดอร์ที่จำเป็นทั้งหมดให้คุณ

**หลังรัน:**
1. แก้ไฟล์ `MyNewRepo\.windsurf\rules\project-context.md` — บอก Luna ว่าโปรเจกต์นี้ใช้อะไร (เช่น React + Firebase)
2. เปิดโปรเจกต์ใน Windsurf → พร้อมใช้!

---

### วิธีที่ 2: ทำเอง (Manual)

ถ้าอยากทำเอง แค่สร้างโฟลเดอร์และไฟล์นี้:

```
MyNewRepo/
├── .windsurf/
│   └── rules/
│       └── project-context.md     ← บอก Luna ว่าโปรเจกต์นี้คืออะไร
├── Luna/
│   ├── daily/                     ← บันทึกงาน Luna
│   └── team/
│       └── daily/                 ← บันทึกงานทีม
└── team/
    └── daily/
```

**ไฟล์ `project-context.md` ตัวอย่าง:**
```markdown
# Project: MyNewRepo
- Tech: React + Vite + Firebase
- Style: Tailwind CSS
- Notes: เป็นเว็บขายของออนไลน์
```

---

## 👥 ทีมงาน 12 คน

Luna มีทีมงานพร้อมช่วยเหลือทุกด้าน:

| ชื่อ | หน้าที่ | ใช้เมื่อไหร่ |
|------|---------|-------------|
| **Orion** | ออกแบบระบบ | ต้องวางแผน architecture |
| **Nova** | Backend Dev | เขียน API, database |
| **Stella** | Frontend Dev | สร้างหน้าเว็บ, UI |
| **Nebula** | Database | ออกแบบตารางข้อมูล |
| **Cosmos** | DevOps | Deploy, ตั้งค่า server |
| **Sirius** | QA / Tester | เทสระบบหา bug |
| **Galaxy** | Business Analyst | วิเคราะห์ requirement |
| **Vega** | UI/UX Designer | ออกแบบหน้าตา |
| **Aurora** | Integration | เชื่อมต่อ LINE, Payment |
| **Pulsar** | Project Manager | จัดการ timeline |
| **Lyra** | Windsurf Tools | ปรับแต่งเครื่องมือ |
| **Polaris** | Luna System Auditor | ตรวจสอบคุณภาพ, ความถูกต้องของ Luna |

### ทีมงาน 2 ระดับ

**ระดับ 1: ทีมหลัก (Global)**
- อยู่ใน `luna-workspace/team/roles/` — ใช้ได้กับทุกโปรเจกต์
- ตัวอย่าง: ถ้าขอ "สร้างหน้า login" → Stella จะมาทำให้

**ระดับ 2: ทีมเฉพาะโปรเจกต์ (Per-Repo)**
- อยู่ใน `MyRepo/team/` — เพิ่มเติมความรู้เฉพาะ
- ตัวอย่าง: ถ้าโปรเจกต์ขายเสื้อผ้า → เพิ่มไฟล์ `team/roles/phoenix.md` (ผู้เชี่ยวชาญเสื้อผ้า)

> **💡 ตัวอย่าง:** ถ้า Nova (Backend) มาทำงาน แต่ต้องรู้ว่าโปรเจกต์นี้ใช้ Firestore schema แบบไหน → เพิ่มไฟล์ `team/roles/nova-context.md` บอกเขา

---

## 💻 ใช้ Luna บนเครื่องอื่น

**วิธีง่ายที่สุด:**
1. Backup โฟลเดอร์ `C:\Users\sansakritsuk\.windsurf` เป็น zip
2. Copy ไปเครื่องใหม่ แตกไว้ที่ path เดียวกัน
3. เปิด Windsurf → พร้อมใช้!

**วิธี Git (แนะนำ):**
```powershell
cd $env:USERPROFILE\.windsurf\luna-workspace
git init
git add .
git commit -m "Luna backup"
git push
```

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
1. *"คนในทีมมีใครบ้าง"* → ควรตอบได้ (อ่านจาก `team/team-config.md`)
2. *"ช่วยสร้างหน้า login"* → ควรเรียก **Stella** มาทำงาน

ถ้าตอบได้ = พร้อมใช้งาน!

---

## ❓ ปัญหาที่พบบ่อย

| ปัญหา | แก้ไข |
|--------|--------|
| Luna ตอบไม่ได้ว่าทีมมีใคร | เช็คไฟล์ `team/team-config.md` |
| Luna ไม่รู้ tech stack โปรเจกต์ | แก้ไฟล์ `MyRepo/.windsurf/rules/project-context.md` |
| ไม่มี daily log | สร้างโฟลเดอร์ `Luna/daily/` และ `team/daily/` |
| กลัวข้อมูลหาย | Backup โฟลเดอร์ `.windsurf` เป็น zip |

---

## 📚 อ่านเพิ่มเติม (สำหรับคนอยากรู้ลึก)

| หัวข้อ | ไฟล์ |
|--------|------|
| บุคลิก Luna | `rules/luna-core.md` |
| รายละเอียดทีม 12 คน | `team/roles/*.md` |
| แม่แบบสำหรับโปรเจกต์ใหม่ | `templates/` |
| ระบบเรียนรู้ของ Luna | `Luna/hypothesis.md`, `Luna/insights.md` |

---

*อัปเดต: 2026-04-27 — เพิ่ม Polaris (Luna System Auditor) 🌙*
