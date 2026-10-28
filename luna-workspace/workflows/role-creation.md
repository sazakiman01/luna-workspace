# Workflow: Dynamic Role Creation (สร้างทีมงานใหม่)

*Luna เสนอ → พี่แมน approve → Luna สร้างตาม spec agent ของ opencode v2 (เดิม: Claude Code spec — ย้าย 2026-10-28)*

---

## 🎯 หลักการ (อ่านก่อนเสมอ)

1. **ใช้ existing role ก่อนเสมอ** — role ปัจจุบันครอบคลุมงานส่วนใหญ่ (ดู `team/team-config.md`) อย่ารีบสร้างใหม่
2. **สร้างใหม่เฉพาะเมื่อมี gap จริง** — งานที่ไม่มี role ไหนรับผิดชอบได้ดี และเกิดซ้ำ ≥ 2-3 ครั้ง
3. **Luna ไม่สร้างเอง** — ต้องเสนอพี่แมนและได้ approve ก่อนเสมอ (ป้องกัน role spam)

---

## 🔍 เมื่อไหร่ควรพิจารณาสร้าง role ใหม่

| สัญญาณ | ตัวอย่าง |
|--------|---------|
| งานซ้ำที่ไม่มี role ตรง | พี่แมนขอ "data science / ML model" บ่อย — ไม่มี role ไหนเชี่ยวชาญ |
| Domain ใหม่ของธุรกิจ | เปิดธุรกิจปัก → ต้องการ "Embroidery Production Specialist" |
| role เดิมรับภาระเกิน | nova ทำทั้ง backend + DevOps + integration → ควรแยก |

**ไม่ควรสร้างถ้า:** งานเกิดครั้งเดียว / existing role ทำได้ (แค่ต้อง load skill เพิ่ม) / overlap กับ role เดิม > 60%

---

## 📋 Flow 5 ขั้น

### 1. Detect (Luna)
Luna สังเกต gap → ตรวจ `team-config.md` ว่ามี role ครอบคลุมไหม → ถ้าไม่มี ไปขั้น 2

### 2. Propose (Luna → พี่แมน)
Luna เสนอพร้อมข้อมูล:
- **ชื่อ role** (celestial theme + ชื่อไทย + อายุ + ตำแหน่ง)
- **เหตุผล** ที่ existing role ไม่พอ
- **Domain + tools** ที่ต้องการ
- **Model tier** (`gosoft/gothink2` = คิดหนัก / `gosoft/godev1` = implement / inherit)
- **Overlap check** กับ role เดิม

### 3. Approve (พี่แมน)
พี่แมน ✅ หรือ ❌ พร้อม feedback — ถ้า ❌ Luna ปรับหรือยกเลิก

### 4. Create (Luna) — ตาม spec agent ของ opencode v2
สร้าง `~/.config/opencode/agents/<name>.md` ตาม template ด้านล่าง (ไฟล์คุมพฤติกรรม agent → ทำใน main session · ให้ Lyra/Sirius ตรวจ permission)

### 5. Register (Luna)
- เพิ่มแถวใน `team-config.md` (domain → role mapping)
- เพิ่มแถวใน `AGENTS.md` team table + ตาราง Model
- บันทึก decision log
- (option) สร้าง `luna-workspace/team/roles/<name>.md` สำหรับ deep persona

---

## 📐 Agent File Template (opencode v2 — อิงจาก `agents/*.md` ที่ใช้อยู่)

```markdown
---
description: <Role ไทย (ชื่อ, อายุ)> — <domain keywords สำหรับเลือก role>
mode: subagent
model: gosoft/<gothink2 | godev1>   # ไม่ใส่ = inherit
color: '<#RRGGBB>'
permissions:
  - action: subagent
    resource: '*'
    effect: deny
  # (option) read-only role: deny edit '*' แล้ว allow edit '*.config*opencode*agent-memory*<name>*'
  # (option) checklist: allow skill '<checklist-skill>'
---

คุณคือ **<Name> (<ชื่อไทย>, <อายุ>)** — <ตำแหน่ง> เน้น <จุดเด่น 2-3 อย่าง>

ตอบไทย, นำเสนอเป็น <Name>, รายงานกลับ Luna เมื่อเสร็จ — <deliverable>

**🧠 Memory (เรียนรู้ต่อเนื่อง):**
- **เริ่มงาน:** อ่าน `C:/Users/sansakritsuk/.config/opencode/agent-memory/<name>/MEMORY.md` ก่อน (ถ้ามี) แล้วเปิดไฟล์ที่เกี่ยวข้องตามดัชนี
- **บันทึก:** เขียนลง `C:/Users/sansakritsuk/.config/opencode/agent-memory/<name>/` — 1 ไฟล์ต่อ 1 เรื่อง + เพิ่มบรรทัดชี้ใน `MEMORY.md` ของตัวเอง

**Load on demand:** `luna-workspace/team/roles/<name>.md`
```

### กฎ frontmatter (opencode v2)
- ชื่อ role = ชื่อไฟล์ (`<name>.md`) — ต้องไม่ซ้ำ, lowercase + hyphen
- ใช้เฉพาะ key `description` / `mode` / `model` / `color` (hex) / `permissions` — ไม่มี `name:`, `tools:`, `effort:`, `memory:`, `skills:` แบบ Claude Code
- `permissions`: deny `subagent` เสมอ (subagent ไม่ spawn ต่อ) · ชื่อ action ต้องถูก (`shell` / `subagent` ไม่ใช่ bash/task — ผิดแล้วไม่มีผลเงียบๆ) · pattern บน Windows ห้ามมี `/` หรือ `\` ใช้ `*name*`
- checklist: allow `skill` ใน `permissions` + สั่งใน body ให้โหลดด้วย skill tool (แทน `skills:` preload)
- `model:` ต้องตรงกับตาราง Model ใน AGENTS.md · สลับภายหลังด้วย `luna-workspace/scripts/set-role-model.ps1`
- *เดิม (Claude Code): `name` / `tools` (ห้าม `Agent`) / `memory: user` / `effort:` / `skills:`*

---

## ✅ Verification หลังสร้าง
1. ชื่อไฟล์ไม่ซ้ำกับ role เดิม
2. `opencode-cli debug agents` เห็น role ใหม่ + permission ถูก แล้วทดสอบ delegate ผ่าน task tool → ตอบถูก persona
3. team-config + AGENTS.md อัพเดตตรงกัน
