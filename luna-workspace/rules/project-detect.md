# Project Detection Rule

*สอน Luna ให้รู้บริบทของ repo ที่กำลังทำงานอยู่ และแยกการอ่าน/เขียนระหว่าง global กับ per-repo ได้ถูกต้อง*

## 🎯 หลักการ

Luna ทำงานได้หลาย repo — ทุกครั้งที่เข้าใหม่ให้:

1. **Detect repo** จาก workspace URI ที่ระบบให้มา (เช่น `d:\coding\UniformFlow`)
2. **อ่าน project context** ที่ `<repo>/.opencode/project-context.md` (ถ้ามี — opencode ไม่ auto-load, Luna เปิดอ่านเอง)
3. **เก็บ `<repo>` ไว้เป็น path prefix** สำหรับการเขียน daily/feedback/decisions

## 📖 ลำดับการอ่านไฟล์ (ตามลำดับความสำคัญ)

เมื่อต้องใช้ข้อมูลใด ให้ค้นตามลำดับนี้:

| ข้อมูล | 1. อ่านจาก | 2. Fallback |
|--------|-----------|-------------|
| Luna persona/rules | Global `rules/luna-core.md` | — |
| Role definition (generic) | Global `team/roles/[role].md` | — |
| Role context (per-repo) | `<repo>/Luna/team/roles/[role]-context.md` | ไม่บังคับ |
| Custom role (per-repo) | `<repo>/Luna/team/roles/[role].md` | — |
| Per-repo team roster | `<repo>/Luna/team/team-local.md` | ไม่บังคับ |
| Role preferences | Global `team/preferences/[role].md` | — |
| Team mapping | Global `team/team-config.md` | — |
| Project context (tech stack, naming) | `<repo>/.opencode/project-context.md` | ถามพี่แมน |
| Project knowledge (schema, business) | `<repo>/Luna/knowledge-package/` | Global `knowledge-package-generic/` |
| Luna long-term preferences | `~/.config/opencode/memory/` (MEMORY.md index) | — |
| Past decisions ของ repo | `<repo>/Luna/decisions.md` | — |
| Past feedback ของ repo | `<repo>/Luna/feedback.md` | — |
| Team performance ใน repo | `<repo>/Luna/team/performance.md` | — |

## ✍️ ลำดับการเขียนไฟล์

| ประเภท | เขียนที่ |
|--------|---------|
| Daily log | `<repo>/Luna/team/daily/YYYY-MM-DD.md` |
| Decision ของ repo | `<repo>/Luna/decisions.md` (append) |
| Feedback ของ repo | `<repo>/Luna/feedback.md` (append) |
| Retrospective | `<repo>/Luna/retrospective/` |
| Performance เฉพาะ repo | `<repo>/Luna/team/performance.md` |
| Pattern/insight ข้าม repo | `~/.config/opencode/memory/` (Luna ส่วนกลาง) |
| Pattern เฉพาะ role | `~/.config/opencode/agent-memory/<role>/` (role เขียนเอง) |

**กฎสำคัญ:**
- ❌ อย่าเขียน daily/feedback/decisions ลงใน global
- ❌ อย่าเขียน Luna persona / Role definition ลงใน repo
- ✅ ถ้าไม่มี `<repo>/.opencode/project-context.md` → แจ้งพี่แมนเพื่อสร้างก่อน (หรือ copy จาก template)

## 👥 2-Tier Team Model

Luna ใช้ทีมแบบ 2 ชั้น:

### Tier 1: Global Team (generic)
- Global roles ที่รู้งานทั่วไป — ดูรายชื่อเต็มที่ `team/team-config.md`
- อยู่ที่ `$env:USERPROFILE\.config\opencode\luna-workspace\team\roles\`
- รายชื่อล่าสุด: ดู `team/team-config.md` (แหล่งเดียว — อย่าเขียนจำนวนซ้ำที่นี่)

### Tier 2: Per-Repo Team (specific)
- **Context Extension** — extend global role ด้วย knowledge เฉพาะ repo
  - ไฟล์: `<repo>/Luna/team/roles/[role]-context.md` (เช่น `nova-context.md`)
  - Luna อ่าน global role + context file → รวมเป็นความรู้
- **Custom Role** — role ใหม่เฉพาะ repo (ไม่มีใน global)
  - ไฟล์: `<repo>/Luna/team/roles/[role].md` (เช่น `phoenix.md`)
- **อ่าน Decision Framework:** `team/decision-global-vs-per-repo.md` ก่อน hire specialist ใหม่

### เมื่อเลือก Role
1. ดู `<repo>/Luna/team/team-local.md` → รู้ว่ามี specialist เฉพาะ repo อะไรบ้าง
2. ถ้าเลือก global role → อ่าน global + `<repo>/Luna/team/roles/[role]-context.md` (ถ้ามี)
3. ถ้าเลือก custom role → อ่านจาก `<repo>/Luna/team/roles/` โดยตรง

## 🆕 เมื่อเข้า repo ใหม่ครั้งแรก

1. ตรวจว่ามี `<repo>/.opencode/project-context.md` หรือยัง
2. ถ้าไม่มี → แนะนำพี่แมนให้ copy template จาก global `templates/project-context.template.md` (หรือรัน `templates/Setup-LunaRepo.ps1`)
3. สร้างโฟลเดอร์ที่ต้องใช้: `<repo>/Luna/team/daily/`, `<repo>/Luna/reviews/`
4. เริ่มทำงานตามปกติ

## 🔍 การหา `<repo>` path

- ใช้ workspace URI จาก system (เช่น `d:\coding\UniformFlow`)
- ถ้ามีหลาย workspaces → ใช้ URI ที่ active document อยู่
- ห้าม hard-code `UniformFlow` — ใช้ `<repo>` เป็นตัวแปร

---
*สร้าง 2026-04-22*
