---
name: weekly-retro
description: Weekly retrospective — สรุปงาน, learnings, และ growth ของทีม 7 วันที่ผ่านมา — ใช้เย็นวันอาทิตย์/เช้าวันจันทร์ หรือเมื่อ SessionStart เตือนว่ายังไม่มี retro ของสัปดาห์ที่แล้ว
---

ทำ weekly retrospective:

1. **อ่าน workflow:** `~/.config/opencode/luna-workspace/workflows/weekly-retro.md`
2. **รวบรวมหลักฐาน 7 วันล่าสุด:**
   - `~/.config/opencode/luna-workspace/Luna/logs/worklog-*.tsv` — บันทึกอัตโนมัติว่าแตะไฟล์อะไรวันไหน (แหล่งหลัก — ไม่ต้องเดา)
   - `~/.config/opencode/luna-workspace/Luna/team/daily/*.md` (ไม่ recurse)
   - `<repo>/Luna/team/daily/*.md` (ถ้าอยู่ใน repo, ไม่ recurse)
   - **ห้าม glob `**/*.md`** — จะดึง `_archived/` มาด้วย (token waste)
   - ถ้าต้องข้อมูลเก่า > 14 วัน: อ่าน `_archived/INDEX.md` ก่อน แล้วเลือกไฟล์เฉพาะที่จำเป็น
3. **วิเคราะห์:**
   - งานที่ทำสำเร็จ (count + impact)
   - Roles ที่ทำงานบ่อย / น้อย / ไม่ถูกเรียกเลย
   - Pattern ที่ repeat → ถ้าคุ้มค่าจำข้ามสัปดาห์ ให้บันทึกเป็น memory (Luna ส่วนกลาง หรือ `agent-memory/<role>/`)
   - Blockers ที่เจอบ่อย
   - Feedback จากพี่แมน
   - **Compliance rate** — เทียบวันที่มี worklog กับวันที่มี daily log · นับ `.gate-<date>` marker ที่ลงท้าย `declined`
     (`.gate-retro-YYYY-Www` = marker ของ retro gate คนละตัว ไม่ต้องนับรวม)
4. **เขียน retro report ฉบับเดียว** ที่ `luna-workspace/Luna/retrospective/YYYY-Www.md`
   (เช่น `2026-W32.md` — ต้องตรงกับที่ `scripts/session-reminders.ps1` + `scripts/log-gate.ps1` ตรวจ
   ไม่งั้น reminder เตือนไม่หยุด และ retro gate จะ block ปลาย turn ต่อไปอีกสัปดาห์)
5. **Escalate ถ้าขาด ≥ 2 สัปดาห์ติด** — บอกพี่แมนตรงๆ ในแชท อย่าเขียนไว้ในไฟล์เฉยๆ
6. **สรุปให้พี่แมน:** highlights + recommendations

> ระบบ promote evidence (hypothesis → insights → preferences) **retired 2026-07-23** — learning ไปอยู่ที่ native memory แทน
