# Firebase Planner Debug Plan

แก้ไขปัญหาที่ข้อมูล High-level Planner ไม่ถูกบันทึกลง Firestore ถึงแม้จะไม่มี error ใน UI

## ปัญหาที่สังเกต
1. UI ไม่แสดง error แต่ข้อมูลไม่ปรากฏใน Firestore
2. มีการเรียก `savePlannerState(state)` ใน useEffect แต่อาจมีปัญหาในการทำงาน
3. ต้องตรวจสอบว่าข้อมูลจริงๆ ถูกส่งไป Firestore หรือไม่

## ขั้นตอนแก้ไข
1. **เพิ่ม logging ใน plannerService.js** - เพื่อตรวจสอบว่าข้อมูลถูกส่งไป Firestore จริงหรือไม่
2. **เพิ่ม logging ใน StandalonePlanner.jsx** - เพื่อดูว่า state ถูกเปลี่ยนแปลงและส่งไปบันทึกหรือไม่
3. **ตรวจสอบ Firestore permissions** - ยืนยันว่า rules อนุญาตให้เขียนข้อมูลได้
4. **ทดสอบการเขียนข้อมูลโดยตรง** - สร้าง script ทดสอบเพื่อยืนยันว่าสามารถเขียนได้จริง
5. **ตรวจสอบ state updates** - ดูว่ามีการเรียก `savePlannerState` เมื่อ add project หรือไม่

## ไฟล์ที่ต้องแก้ไข
- `src/services/plannerService.js` - เพิ่ม console.log เพื่อ debug
- `src/features/planner/StandalonePlanner.jsx` - เพิ่ม logging ใน persist function
- `firestore.rules` - ตรวจสอบ permissions (ถ้าจำเป็น)

## ผลลัพธ์ที่คาดหวัง
- ทราบสาเหตุที่แท้จริงว่าทำไมข้อมูลไม่ถูกบันทึก
- สามารถบันทึกข้อมูลจาก High-level Planner ลง Firestore ได้จริง
