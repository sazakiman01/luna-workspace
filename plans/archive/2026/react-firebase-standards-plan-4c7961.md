# ตรวจสอบ React Firebase Standards
แผนนี้สรุปขั้นตอนเพื่อยืนยันว่ามีไฟล์ `.windsurf/rules/react-firebase-standards.md` อยู่แล้วหรือยัง และเตรียมสร้างไฟล์ใหม่หากไม่พบ

1. ใช้เครื่องมือค้นหาไฟล์ (`find_by_name`) ตรวจสอบเส้นทาง `.windsurf/rules/` เพื่อยืนยันการมีอยู่ของ `react-firebase-standards.md` รวมถึงดูไฟล์ที่ใกล้เคียงเผื่อมีชื่ออื่น
2. ถ้าไม่พบไฟล์ ให้รวบรวมข้อมูลจาก `.gitignore`, `.windsurfrules`, และโครงสร้างโปรเจกต์ (ภายใน `src/` และคำแนะนำ tech stack) เพื่อกำหนดหัวข้อที่จะต้องอยู่ในมาตรฐาน React + Firebase
3. สร้างไฟล์ `.windsurf/rules/react-firebase-standards.md` พร้อมโครงสร้างหัวข้อ เช่น Project setup, Coding conventions, Firebase usage, Performance/Cost tips, และ Deployment notes โดยอ้างอิงสิ่งที่รวบรวมมา
4. ทบทวนไฟล์ใหม่เพื่อความครบถ้วนและสอดคล้องกับกฎใน `.windsurfrules`, จากนั้นสรุปให้ผู้ใช้ตรวจ
