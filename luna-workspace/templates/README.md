# Templates — สำหรับ Setup Repo ใหม่

*Templates ใช้สร้างไฟล์เริ่มต้นในแต่ละ repo*

---

## 📁 Available Templates

| ไฟล์ | ใช้เมื่อไหร่ | Copy ไปที่ไหน |
|------|-------------|----------------|
| `Setup-LunaRepo.ps1` | Setup repo ใหม่ทั้งหมด (อัตโนมัติ) | run `& .\Setup-LunaRepo.ps1 -RepoPath "D:\..."` |
| `project-context.template.md` | Repo ใหม่ต้องระบุ tech stack | `<repo>/.opencode/project-context.md` |
| `role-context.template.md` | Extend global role ด้วย domain knowledge | `<repo>/Luna/team/roles/<role>-context.md` |
| `role-custom.template.md` | สร้าง custom role ใหม่เฉพาะ repo | `<repo>/Luna/team/roles/<role>.md` |
| `team-local.template.md` | List ทีม specialist ของ repo | `<repo>/Luna/team/team-local.md` |

---

## 🚀 Quick Start: Setup Repo ใหม่

```powershell
& "$env:USERPROFILE\.config\opencode\luna-workspace\templates\Setup-LunaRepo.ps1" -RepoPath "D:\coding\MyNewRepo"
```

Script จะสร้างให้อัตโนมัติ:
- ✅ `<repo>/.opencode/` + `project-context.md`
- ✅ `<repo>/Luna/team/daily/`, `Luna/retrospective/`
- ✅ `<repo>/Luna/decisions.md`, `feedback.md`
- ✅ `<repo>/Luna/team/performance.md`, `team-local.md`

---

## 📝 Manual Setup

ถ้าไม่อยากใช้ script → copy templates ตามตารางข้างบน และแก้ placeholder

---

## ✏️ แก้ Template

เมื่อแก้ template → ใช้ได้กับ repo ใหม่เท่านั้น (repo เก่าไม่ auto-update)

ถ้าต้องการ apply กับ repo เก่า:
1. Diff template กับไฟล์ใน repo
2. Apply diff manually

---

## 🔗 เกี่ยวข้องกับ

- `README.md` (root) — วิธีใช้ Setup script
- `team/onboarding-template.md` — template สำหรับสร้าง global role ใหม่
