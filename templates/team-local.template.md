# Team Local: [PROJECT_NAME]

*Roster ของทีม specialist เฉพาะ repo นี้ — Luna อ่านไฟล์นี้เพื่อรู้ว่ามี role เฉพาะ repo นี้อะไรบ้าง*

## 🌐 Global Team (ใช้จาก `$env:USERPROFILE\.windsurf\luna-workspace\team\team-config.md`)

Luna + 10 Role generic:
- Luna (AI Assistant)
- Orion, Nova, Stella, Nebula, Cosmos, Sirius, Galaxy, Vega, Aurora, Pulsar

## 🏠 Per-Repo Specialist (Context Extensions)

*Global role + knowledge เฉพาะ repo นี้*

| Role | Context File | รู้เรื่องอะไรเฉพาะ repo นี้ |
|------|-------------|------------------------------|
| [เช่น Nova] | `team/roles/nova-context.md` | [เช่น Firestore schema, API endpoints] |
| [เช่น Aurora] | `team/roles/aurora-context.md` | [เช่น LIFF setup, PromptPay flow] |

## 🎭 Custom Roles (Role ใหม่เฉพาะ repo)

*Role ที่ไม่มีใน global team, สร้างขึ้นเพราะเป็น domain เฉพาะ*

| Role | File | ความเชี่ยวชาญ |
|------|------|----------------|
| [เช่น Phoenix] | `team/roles/phoenix.md` | [เช่น Garment Domain Expert — ตัดเย็บ, ขนาดผ้า] |

## 📝 วิธีใช้

- **เรียก global role:** Luna เลือกจาก global team-config
- **เรียก role พร้อม context:** Luna อ่าน global role + context file
- **เรียก custom role:** Luna อ่านจาก per-repo roles/ โดยตรง

---
*Template จาก `$env:USERPROFILE\.windsurf\luna-workspace\templates\team-local.template.md`*
