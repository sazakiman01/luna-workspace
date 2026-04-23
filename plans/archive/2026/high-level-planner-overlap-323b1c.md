# UX แก้ Block ทับกันใน Lane
แผนนี้อธิบายแนวทาง UX/UI เพื่อให้ block ที่มีช่วงเวลาเดียวกันใน lane/track ไม่ทับกันและยังอ่านง่ายบน High-level planner.

## เป้าหมายหลัก
- ป้องกัน block ที่เริ่ม-จบวันเดียวกันใน lane เดียวจากการซ้อนทับจนอ่านไม่ได้
- ให้ user เห็นจำนวน block และบริบท lane เดียวกันอย่างชัดเจน
- รองรับ interaction ทั้งการ hover/drag และ mobile responsiveness

## แนวทางออกแบบ
1. **Collision Detection Layer**
   - ใช้ util ใหม่ (เช่น `groupBlocksByOverlap`) เพื่อคำนวณ cluster ของ block ที่วันที่ทับซ้อนกันใน lane เดียวกัน
   - คืนข้อมูล row index/stack order เพื่อใช้กำหนดตำแหน่งใน UI
2. **Stacked Lane Layout**
   - ปรับความสูง lane เป็น dynamic (เช่น 20px * จำนวน stack) แล้ว render block แต่ละก้อนด้วย `top` offset ตาม row index
   - เพิ่ม auto-padding ด้านล่าง lane + smooth transition เพื่อยังรองรับ drag & drop
3. **Overlap Indicator & Interaction**
   - แสดง pill counter (เช่น `+2 overlaps`) เมื่อจำนวน block ใน cluster > 1 และย้าย counter ไปมุมขวา
   - Hover/Focus cluster แล้ว highlight blocks ทั้งชุด + เปิด popover รายละเอียดอย่างย่อ (ชื่อ, วันที่)
   - บน mobile ใช้ tap เพื่อ toggle popover และรองรับ horizontal scroll เหมือนเดิม
4. **Accessibility & Visual Cues**
   - ใช้สี status เดิมแต่เพิ่ม stroke สี lane เพื่อช่วยแยกชั้น
   - เพิ่มเส้น guide บางๆ ระหว่าง row เพื่อให้แยกชั้นง่ายโดยไม่รกสายตา
5. **Testing Checklist**
   - Case block เดี่ยว, หลาย block เริ่มวันเดียวกัน, block overlap บางส่วน, drag-block ระหว่าง lane
   - ตรวจสอบการ export (ข้อมูลเดิมไม่เปลี่ยน) และ responsive width < 1024px

## ผลลัพธ์ที่คาดหวัง
- Lane ทุกอันอ่านง่ายแม้มีหลาย phase ซ้อนกัน
- ผู้ใช้เห็นทันทีว่ามีงานชนกันและคลิกดูรายละเอียดได้ไม่ต้องเปิด drawer
- Drag/drop และ auto-highlight ใช้งานได้ต่อเนื่องโดยไม่กระทบโครงสร้างข้อมูลเดิม
