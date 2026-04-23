# High-level Planner Table View
สรุป: จะเพิ่มโหมดการแสดงผลแบบ Table ให้ High-level planner โดยนำข้อมูลโปรเจคและบล็อกมาแสดงเป็นตารางคล้าย Excel เห็นทีละโปรเจคพร้อมรายละเอียดช่วงงานหลักๆ

1. **สำรวจข้อมูลและโครงสร้างที่จำเป็น** – อ่าน `StandalonePlanner.jsx` เพื่อดู state (`projects`, `blocks`, `ui.zoom`) และจุดที่คุมปุ่มสลับมุมมอง บันทึกว่าควรเพิ่มค่าใหม่ใน `VIEW_OPTIONS` และ reducer อย่างไรโดยไม่กระทบโหมดอื่น
2. **ออกแบบ schema สำหรับ table view** – นิยามฟังก์ชัน memoized ที่รวมข้อมูลต่อโปรเจค (เช่น owner, goal) พร้อม block ต่างๆ (title, lane, start/end, status) รองรับทั้งกรณีมี/ไม่มี block และเคารพตัวกรอง `filterProjectId`
3. **สร้าง UI Table Section** – วางคอมโพเนนต์ใหม่ใกล้บริเวณปุ่มสลับมุมมองเพื่อแสดงการ์ดทีละโปรเจค ภายในมี header สรุปโปรเจคและตารางรายละเอียด (Project name, Task/Phase, Lane, Start, End, Status/Badges) ใช้สไตล์ Tailwind ให้ feel แบบ Excel ตามตัวอย่าง
4. **ผูกการสลับมุมมองและ behavior เสริม** – เพิ่มปุ่ม "Table" ในสวิตช์มุมมอง, ซ่อน timeline grid เดิมเมื่ออยู่ใน table mode, รองรับ empty state (ไม่มีโปรเจคหรือไม่มี block), พิจารณา sorting/formatting วันที่และเน้น color/status badges ให้สแกนง่าย
