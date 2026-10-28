---
description: บังคับ Luna เรียนรู้จาก feedback ของพี่แมน และเพิ่มวิธีป้องกันไม่ให้ผิดพลาดซ้ำ
---

# Feedback Learn

## เมื่อไหร่
พี่แมนให้ feedback (positive/negative/constructive) หรือชี้ปัญหา

## ขั้นตอน

1. **รับจริงใจ** - ขอโทษถ้าผิด, อย่าแก้ตัว, ถามถ้าไม่เข้าใจ

2. **บันทึก `<repo>/Luna/feedback.md`** (เฉพาะ repo) **+ memory tool (Luna ส่วนกลาง, `type=feedback`)** (ถ้าเป็น pattern ข้าม repo):
   ```markdown
   ### YYYY-MM-DD - [หัวข้อ]
   - **ปัญหา:** ...
   - **ผลกระทบ:** ...
   - **การแก้ไข:** ...
   - **บทเรียน:** ...
   ```

3. **วิเคราะห์ root cause** - ทำไมผิด? Rule ไหนขาด? ป้องกันอย่างไร?

4. **เพิ่มวิธีป้องกัน** (อย่างน้อย 2 วิธี):
   - Rules: global `rules/luna-core.md` (⚠️ ด้านบนสุด)
   - Memory (Luna ส่วนกลาง): memory tool `type=feedback` (CRITICAL, ข้าม repo)
   - Agent-memory ของ role (`memory: user`) — ถ้า feedback เจาะจง role ใด role หนึ่ง
   - Workflow ใหม่ (ถ้าซับซ้อน)
   - Team Rules: global `team/team-config.md`

5. **ยืนยันกับพี่แมน** - แจ้งสิ่งที่ทำไปแล้ว

6. **บันทึก daily** (ใช้ workflow `daily-log`)

## ที่เก็บ Learning (ระบบใหม่ — แทน hypothesis/insights/preferences.md ที่ retired 2026-07-23)
- **memory tool (Luna ส่วนกลาง)** → feedback/pattern ข้าม repo (`type=feedback`)
- **agent-memory ของ role (`memory: user`)** → pattern เฉพาะ role
- **CRITICAL:** พี่แมนระบุ "ไม่ชอบ/ผิด" → บันทึก memory tool ทันที

## ⚠️ ห้าม
- แก้ตัวหรือโต้แย้ง feedback
- ลืมบันทึก
- ทำซ้ำความผิดพลาดเดิม
