# Workflow: Dynamic Role Creation (สร้างทีมงานใหม่)

*Luna เสนอ → พี่แมน approve → Luna สร้างตาม Claude Code spec*

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
- **Model tier** (opus = คิดหนัก / sonnet = implement / inherit)
- **Overlap check** กับ role เดิม

### 3. Approve (พี่แมน)
พี่แมน ✅ หรือ ❌ พร้อม feedback — ถ้า ❌ Luna ปรับหรือยกเลิก

### 4. Create (Luna) — ตาม Claude Code spec
สร้าง `.claude/agents/<name>.md` ตาม template ด้านล่าง

### 5. Register (Luna)
- เพิ่มแถวใน `team-config.md` (domain → role mapping)
- เพิ่มแถวใน `CLAUDE.md` team table
- บันทึก decision log
- (option) สร้าง `luna-workspace/team/roles/<name>.md` สำหรับ deep persona

---

## 📐 Agent File Template (ตาม spec — compliant)

```markdown
---
name: <lowercase-name>
description: <Role ไทย (ชื่อ, อายุ)> — <domain keywords สำหรับ auto-delegate>
model: <opus | sonnet | inherit>
effort: <high (opus) | medium (sonnet) — ไม่ตั้งถ้า inherit>
color: <purple|blue|cyan|green|yellow|orange|pink|red>
tools: <allowlist — อย่าใส่ Agent (subagent เรียกไม่ได้)>
memory: user
# skills: <checklist-skill>   # (option) preload checklist เต็มเข้า context
---

คุณคือ **<Name> (<ชื่อไทย>, <อายุ>)** — <ตำแหน่ง> เน้น <จุดเด่น 2-3 อย่าง>

ตอบไทย, นำเสนอเป็น <Name>, รายงานกลับ Luna เมื่อเสร็จ — <deliverable>

**🧠 Memory (เรียนรู้ต่อเนื่อง):**
- ก่อนเริ่มงาน: ทบทวน memory ตัวเอง — ใช้ pattern ที่เคยเจอ
- หลังจบงานสำคัญ: บันทึก decision + เหตุผล, pattern, anti-pattern ลง memory

**Load on demand:** `luna-workspace/team/roles/<name>.md`
```

### กฎ frontmatter (สำคัญ — จาก Claude spec)
- `name`: ต้องไม่ซ้ำ, lowercase + hyphen เท่านั้น
- `tools`: **ห้ามใส่ `Agent`** — subagent spawn subagent ไม่ได้ (no-op)
- `tools`: ใส่เฉพาะที่จำเป็น (read-only role = `Read, Grep, Glob, WebFetch`)
- `memory: user` — เปิด persistent learning (auto-enable Read/Write/Edit สำหรับ memory)
- `effort:` ต้องตรงกับตาราง Model + Effort ใน CLAUDE.md (มีผลจริงตั้งแต่ v2.1.267)
- `skills:` ใช้ preload checklist ได้ (subagent mode) — แต่ teammate mode ไม่ apply `skills:` · ไม่ใส่ `mcpServers:` ถ้าไม่จำเป็น

---

## ✅ Verification หลังสร้าง
1. `name` ไม่ซ้ำกับ role เดิม
2. ทดสอบ delegate: เรียก role ใหม่ผ่าน Agent tool → ตอบถูก persona
3. team-config + CLAUDE.md อัพเดตตรงกัน
