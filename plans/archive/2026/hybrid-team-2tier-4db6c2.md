# Hybrid Team Model (2-Tier)

ปรับโครงสร้างทีมให้มี 2 ระดับ: Global team (generic) + Per-repo team (specialist/context) โดยรองรับทั้ง extend global role และสร้าง role ใหม่เฉพาะ repo

## 🎯 Concept

```
Tier 1: Global (รู้ทั่วไป)           Tier 2: Per-repo (รู้เฉพาะ)
├── Luna                              (ไม่มี — Luna เป็น global เท่านั้น)
├── Nova (Backend generic)       →    <repo>/team/roles/nova-context.md (Firebase Functions + Zod schema)
├── Stella (Frontend generic)    →    <repo>/team/roles/stella-context.md (Vite + shadcn + store)
├── Aurora (Integration generic) →    <repo>/team/roles/aurora-context.md (LIFF + PromptPay)
└── ... 10 roles                      + <repo>/team/roles/phoenix.md (custom role เฉพาะ repo)
```

## 📂 โครงสร้างใหม่

### Global (ไม่เปลี่ยน)
```
$env:USERPROFILE\.windsurf\
├── rules/luna-core.md, team-protocol.md, project-detect.md
├── team/
│   ├── team-config.md              # global team roster
│   ├── roles/                      # 10 global roles (generic knowledge)
│   └── preferences/
└── workflows/
```

### Per-repo (เพิ่ม)
```
<repo>/.windsurf/rules/project-context.md
<repo>/team/
├── team-local.md                   # 🆕 list specialist + context ของ repo
├── roles/                          # 🆕
│   ├── nova-context.md             # extend global Nova (รู้ schema เฉพาะ repo)
│   ├── aurora-context.md           # extend global Aurora (รู้ 3rd-party เฉพาะ repo)
│   └── phoenix.md                  # 🆕 custom role เฉพาะ repo
├── daily/
└── performance.md
```

## 🔄 วิธีทำงาน

เมื่อ Luna เลือก role ทำงาน:

1. **อ่าน global role** (`$env:USERPROFILE\.windsurf\team\roles\nova.md`)
2. **อ่าน per-repo context** (`<repo>/team/roles/nova-context.md`) ถ้ามี
3. **รวมเป็นความรู้ของ Role ในบริบท repo นี้**
4. **ถ้ามี custom role** ใน `<repo>/team/roles/` ที่ไม่มีใน global → ใช้เลย

## 📝 ไฟล์ที่ต้องสร้าง/แก้

1. **`project-detect.md`** — เพิ่ม rule อ่านทั้ง global role + per-repo context
2. **`team-local.template.md`** (global templates) — template สำหรับ list specialist ต่อ repo
3. **`role-context.template.md`** (global templates) — template สำหรับเขียน context ของ global role ใน repo
4. **`role-custom.template.md`** (global templates) — template สำหรับสร้าง custom role
5. **`Setup-LunaRepo.ps1`** — เพิ่ม option สร้าง `team/roles/` + `team-local.md`
6. **ทดสอบกับ UniformFlow** — สร้าง `nova-context.md`, `aurora-context.md` เป็นตัวอย่าง

## ✨ ประโยชน์

- **Generic reusable** — Nova ใช้ได้ทุก repo
- **Context-aware** — Nova ใน UniformFlow รู้ Firestore schema, ใน ShopFlow รู้ Prisma
- **ยืดหยุ่น** — สร้าง custom role เฉพาะ domain ได้ (เช่น Phoenix = Garment Domain Expert)
- **ไม่ซ้ำซ้อน** — knowledge generic เขียนครั้งเดียว, context เขียนต่อ repo

## 🚀 ลำดับ implement

1. สร้าง templates (team-local, role-context, role-custom)
2. อัปเดต `project-detect.md` ให้อ่าน per-repo team
3. อัปเดต `Setup-LunaRepo.ps1`
4. สร้างตัวอย่างใน UniformFlow (nova-context.md, aurora-context.md)
5. อัปเดต README
