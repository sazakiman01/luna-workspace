# Windsurf Skill Plan
Plan to define a reusable Thai-language Windsurf skill that guides code-review agents using the new `/code-review` documentation without touching existing source code.

## Steps
1. วิเคราะห์สเปก Windsurf Skills และเนื้อหาใน `/code-review` เพื่อสกัดสิ่งที่ skill ต้องรู้
2. ออกแบบโครงสร้าง `SKILL.md` (frontmatter, instructions, scope, supporting paths) ให้ agent ใช้ได้ข้ามโปรเจกต์
3. วางรายการ supporting files/ลิงก์ (workflow, checklist, templates) ที่ skill จะอ้างอิง พร้อมวิธีอัปเดตในอนาคต

## Outputs
- ชื่อ skill (ไทย, ใช้ slug ตัวพิมพ์เล็ก/ขีดกลางตามข้อกำหนด)
- เนื้อหา `SKILL.md` พร้อมคำสั่ง usage steps สำหรับ Windsurf agents
- รายการ supporting resources ที่ผูกกับโฟลเดอร์ `code-review`

หลังได้รับอนุมัติ จะเริ่มสร้างโฟลเดอร์ skill และไฟล์ `SKILL.md` ให้พร้อมใช้งานใน repo อื่น ๆ
