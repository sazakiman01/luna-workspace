---
description: สร้าง daily log entry ตาม Luna template (Luna/team/daily/YYYY-MM-DD.md)
when_to_use: ใช้เมื่อ session มี decision / learning / feedback ที่ควรจำข้ามวัน — ห้ามใช้จดกิจกรรมเฉยๆ
allowed-tools: Read, Write, Edit, Glob
---

ทำตามขั้นตอนนี้:

0. **เช็คก่อนว่าควรจดไหม** — จดเฉพาะเมื่อมี decision ที่กระทบทีม/โครงสร้าง/tech stack, learning ใหม่, หรือ feedback จากพี่แมน · **ห้ามจด activity** ถ้าไม่มีสักข้อ ให้บอกพี่แมนตรงๆ ว่าวันนี้ไม่มีอะไรต้องบันทึก
1. อ่าน template: `C:\Users\sansakritsuk\.claude\luna-workspace\templates\daily-log.template.md`
   ดูหลักฐานว่าวันนี้แตะอะไรบ้างจาก `luna-workspace\Luna\logs\worklog-YYYY-MM-DD.tsv` (บันทึกอัตโนมัติ)
2. หา repo ปัจจุบัน — ถ้าอยู่ใน working directory ที่เป็น repo ให้ใช้ `<repo>/Luna/team/daily/YYYY-MM-DD.md`
   ถ้าไม่ใช่ repo ใช้ `C:\Users\sansakritsuk\.claude\luna-workspace\Luna\team\daily\YYYY-MM-DD.md`
3. ถ้าไฟล์วันนี้มีแล้ว → append entry ใหม่ (ไม่ overwrite)
4. ถ้ายังไม่มี → สร้างใหม่จาก template
5. กรอก:
   - **Date:** วันที่ปัจจุบัน
   - **Decisions:** การตัดสินใจสำคัญ
   - **Learnings:** สิ่งที่เรียนรู้ใหม่
   - **Next:** สิ่งที่ต้องทำต่อ
6. รายงานพี่แมนว่าบันทึกเรียบร้อยแล้ว path ไหน
