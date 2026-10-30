---
description: รัน Weekly Retrospective ของ Luna (รีวิวสัปดาห์ที่ผ่านมา, ย้าย pattern, หา cross-role/cross-repo patterns) — retro ฉบับเดียวที่ Luna/retrospective/
---

# Weekly Retrospective Workflow

ใช้เมื่อพี่แมนสั่ง `/weekly-retro` เพื่อให้ลูน่ารัน retrospective ของสัปดาห์นี้แบบ systematic

## ขั้นตอน

### 1. ระบุสัปดาห์ปัจจุบัน
- คำนวณ ISO week number (YYYY-Www)
- กำหนดช่วงวันที่ (จันทร์ - อาทิตย์)

**Timing rule (ตั้ง 2026-04-27):**
- ✅ **Real-time = default** — ทำเย็นวันอาทิตย์สุดท้ายของสัปดาห์ (หรือเช้าจันทร์อย่างช้าที่สุด)
- ⚠️ **Retroactive = exception** — อนุญาตเฉพาะกรณี skip ไปแล้ว, ต้อง flag ใน retro file ว่าเป็น retroactive + ระบุข้อจำกัด data

### 2. Collect Input Data

อ่านไฟล์เหล่านี้เพื่อรวบรวม context:
- **Memory ส่วนกลาง (`~/.config/opencode/memory/`)** — feedback/decisions/patterns ที่บันทึกไว้สัปดาห์นี้ (แทน hypothesis/insights/preferences เดิม — retired 2026-07-23)
- `~/.config/opencode/luna-workspace/team/performance.md` — performance ของ role
- `~/.config/opencode/agent-memory/<role>/` — per-role learning (path เขียนไว้ใน agent)
- `<repo>/Luna/daily/` ของทุก repo ที่ active สัปดาห์นี้
- `<repo>/Luna/team/daily/` ของทุก repo ที่ active สัปดาห์นี้

### 3. Run Retrospective (ฉบับเดียว)

สร้าง `~/.config/opencode/luna-workspace/Luna/retrospective/YYYY-Www.md` ตาม template ใน `Luna/retrospective/README.md`:
- รีวิว feedback/pattern ที่ยังไม่ปิด (จาก memory ส่วนกลาง)
- บันทึก pattern ที่ evidence สะสมพอ → memory ส่วนกลาง (type=feedback/project)
- สรุป performance + cross-role patterns (เจอใน ≥ 2 roles) และ collaboration issues ในไฟล์เดียวกันนี้
  *(team retrospective แยกไฟล์ retired 2026-08-17 — เป็นขั้นตอนที่ถูกข้ามทุกครั้ง 15 สัปดาห์ · โฟลเดอร์เดิมอยู่ที่ `Luna/archive/2026-08-team-retrospective-retired/`)*
- ตรวจสอบว่า memory ที่มีอยู่ยัง valid (ไม่ contradict ของใหม่)
- **Skill Promotion:** เจอ workflow/procedure ซ้ำ ≥ 3 ครั้ง → เสนอ promote เป็น skill (กฎเต็มดู `rules/luna-core.md` → Skill Promotion)
- วาง focus สัปดาห์หน้า

### 4. Apply Changes

- บันทึก pattern ที่ confirm แล้วลง memory ส่วนกลาง (`memory/`) หรือ agent-memory (per-role)
- ปรับ/ลบ memory ที่ outdated
- อัปเดต performance scores

### 5. Present to พี่แมน

นำเสนอสรุป:
- ✅ What went well
- ⚠️ What went wrong + Anti-patterns ที่เจอ
- 🔍 Pattern ที่เลื่อนระดับ
- 🎯 Focus สัปดาห์หน้า
- 🤔 คำถามที่ต้องการ feedback จากพี่แมน

### 6. บันทึก

- บันทึก learnings ลง memory ส่วนกลาง (type=feedback) — "Learnings จากการทำงาน"
- อัปเดต daily notes ของวันนี้

## หมายเหตุ

- Retrospective ที่ดีต้อง **actionable** — ไม่ใช่แค่รีวิว แต่ต้องมีการ apply change
- ถ้าไม่มีการ retrospective ใน 2 สัปดาห์ติด → แจ้งพี่แมน
- พี่แมนสามารถ skip retrospective ได้ถ้าสัปดาห์นั้นทำงานน้อย
- **กลไกบังคับ:** plugin `luna-hooks` เตือนที่ SessionStart ถ้าสัปดาห์ที่แล้วไม่มีไฟล์ retro ✅ (2026-10-28) — ถ้าไม่มี → เสนอ `/weekly-retro` หรือถามพี่แมนว่าจะ skip (ห้ามเงียบ ห้ามแต่งเนื้อหา)
  *เดิม (Claude Code, 2026-08-17): `scripts/log-gate.ps1` (Stop hook) block ปลาย turn ถ้าสัปดาห์ที่แล้วไม่มีไฟล์ retro และวันนี้มีงานจริง (≥ 3 ไฟล์) — marker `Luna/logs/.gate-retro-YYYY-Www`*
