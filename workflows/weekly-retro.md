---
description: รัน Weekly Retrospective ของ Luna + Team (รีวิวสัปดาห์ที่ผ่านมา, ย้าย pattern, หา cross-role/cross-repo patterns)
---

# Weekly Retrospective Workflow

ใช้เมื่อพี่แมนสั่ง `/weekly-retro` เพื่อให้ลูน่ารัน retrospective ของสัปดาห์นี้แบบ systematic

## ขั้นตอน

### 1. ระบุสัปดาห์ปัจจุบัน
- คำนวณ ISO week number (YYYY-Www)
- กำหนดช่วงวันที่ (จันทร์ - อาทิตย์)

### 2. Collect Input Data

อ่านไฟล์เหล่านี้เพื่อรวบรวม context:
- `C:\Users\sansakritsuk\.windsurf\luna-workspace\Luna\hypothesis.md` — hypothesis ที่ค้าง
- `C:\Users\sansakritsuk\.windsurf\luna-workspace\Luna\insights.md` — insights ที่มี evidence
- `C:\Users\sansakritsuk\.windsurf\luna-workspace\Luna\preferences.md` — preferences ปัจจุบัน
- `C:\Users\sansakritsuk\.windsurf\luna-workspace\team\performance.md` — performance ของ role
- `C:\Users\sansakritsuk\.windsurf\luna-workspace\team\preferences\*.md` — per-role learning
- `<repo>/Luna/daily/` ของทุก repo ที่ active สัปดาห์นี้
- `<repo>/Luna/team/daily/` ของทุก repo ที่ active สัปดาห์นี้

### 3. Run Team Retrospective (ก่อน)

สร้าง `C:\Users\sansakritsuk\.windsurf\luna-workspace\team\retrospective\YYYY-Www.md` ตาม template ใน `team/retrospective/README.md`:
- สรุป performance ของทุก role ที่ active
- ระบุ cross-role patterns (เจอใน ≥ 2 roles)
- บันทึก collaboration issues
- เตรียม escalation list → Luna level

### 4. Run Luna Retrospective (หลัง)

สร้าง `C:\Users\sansakritsuk\.windsurf\luna-workspace\Luna\retrospective\YYYY-Www.md` ตาม template ใน `Luna/retrospective/README.md`:
- รีวิว hypothesis ที่ยังค้าง (ลบถ้า > 4 สัปดาห์)
- ย้าย pattern ข้าม tier ตาม Evidence threshold
- รับ escalation จาก team retrospective
- ตรวจสอบ preferences ว่ายัง valid
- วาง focus สัปดาห์หน้า

### 5. Apply Changes

- ย้าย hypothesis → insights (Evidence ≥ 1)
- ย้าย insights → preferences (Evidence ≥ 3)
- ลบ stale hypothesis
- อัปเดต performance scores

### 6. Present to พี่แมน

นำเสนอสรุป:
- ✅ What went well
- ⚠️ What went wrong + Anti-patterns ที่เจอ
- 🔍 Pattern ที่เลื่อนระดับ
- 🎯 Focus สัปดาห์หน้า
- 🤔 คำถามที่ต้องการ feedback จากพี่แมน

### 7. บันทึก

- บันทึก learnings ใน `Luna/insights.md` "Learnings จากการทำงาน"
- อัปเดต daily notes ของวันนี้

## หมายเหตุ

- Retrospective ที่ดีต้อง **actionable** — ไม่ใช่แค่รีวิว แต่ต้องมีการ apply change
- ถ้าไม่มีการ retrospective ใน 2 สัปดาห์ติด → แจ้งพี่แมน
- พี่แมนสามารถ skip retrospective ได้ถ้าสัปดาห์นั้นทำงานน้อย
