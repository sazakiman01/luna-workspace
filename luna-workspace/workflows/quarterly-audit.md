# Quarterly Audit Workflow

*รัน Polaris audit ทุก 3 เดือน เพื่อ distill patterns + update skill folders*

---

## เหตุผล

On-demand audit เปลืองมาก — quarterly ประหยัดกว่าและ batch decision ได้ดีกว่า

## Trigger

ปลายเดือน 3, 6, 9, 12 ของแต่ละปี (มีนาคม, มิถุนายน, กันยายน, ธันวาคม)
หรือเมื่อพี่แมนสั่ง `/luna-audit` ด้วยตนเอง

## ขั้นตอน

### 1. รวบรวม Input
- อ่าน decision logs 3 เดือนล่าสุดจาก `<repo>/Luna/team/daily/`
- อ่าน role skill files ปัจจุบัน (`luna-workspace/team/*/skills/`)
- รวบรวม feedback entries จาก memory ส่วนกลาง `~/.config/opencode/memory/` (`type=feedback`)

### 2. Polaris Distill
- Spawn Polaris ผ่าน task tool
- Polaris วิเคราะห์: patterns ที่ซ้ำ >= 3 ครั้ง, skill gaps, stale rules
- Output: รายการ skill candidates + rules ที่ควรอัปเดต

### 3. Luna Review
- Luna review output ของ Polaris
- ตัด duplicates, ตรวจ relevance
- Draft proposal สำหรับพี่แมน

### 4. พี่แมน Approve
- Luna นำเสนอ diff สรุป: skill ใหม่ N อัน, rule อัปเดต M อัน
- พี่แมน approve/reject แต่ละรายการ

### 5. Apply Changes
- Luna (หรือ role ที่เกี่ยวข้อง) เขียน skill files ที่ได้รับ approve
- Update role files ถ้ามี rule เปลี่ยน
- บันทึก audit output

## Output

`luna-workspace/Luna/audits/YYYY-QN-audit.md`

ตัวอย่าง: `2026-Q2-audit.md`, `2026-Q3-audit.md`

## เกณฑ์ Skill ที่ผ่าน

- ใช้ pattern ซ้ำ >= 3 ครั้ง **หรือ** พี่แมน approve โดยตรง
- ไม่ซ้ำกับ skill ที่มีอยู่แล้ว
- มีตัวอย่าง code / decision จริงจากงาน

---
*สร้าง 2026-05-25: Phase 3*
