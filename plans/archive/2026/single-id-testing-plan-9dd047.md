# แผนทดสอบ Admin Work ด้วยบัญชีเดียวบน localhost
สรุป: ใช้ session/โปรไฟล์ browser แยกและ Dev Impersonation Panel เพื่อจำลองหลายผู้ใช้แม้มีบัญชีจริงเพียงบัญชีเดียว

1. จัดเตรียม Dev Impersonation Panel
   - เปิดโหมด dev (localhost) แล้วตรวจว่า DevImpersonationPanel แสดงอยู่ (ปุ่มมุมขวาล่าง)
   - เตรียมรายชื่อ userId ที่ต้องการสลับ (คัดลอกจาก Firestore หรือหน้า Delivery Hub)
2. เปิดหลาย session บนเครื่องเดียว
   - เปิด Chrome ปกติ + Chrome Guest หรือ Chrome + Edge เพื่อให้ได้ 2 session ที่ไม่แชร์ localStorage
   - ในแต่ละ session ล็อกอินด้วยบัญชีจริงเดียวกัน แล้วเปิด Delivery Hub → Workload
3. จำลอง user อื่นด้วย Impersonation
   - ใน session A เลือก userId แรกจาก Dev Impersonation Panel (เช่นพนักงาน A)
   - ใน session B เลือก userId อื่น (เช่นพนักงาน B) หรือแม้แต่ user เดียวกันเพื่อทดสอบ conflict
4. ทดสอบ flow บันทึกปกติ
   - ให้ session A กรอกข้อมูลและบันทึก ตรวจสอบว่าหน้า workload และ Firestore อัปเดต
   - Session B refresh/โหลดใหม่เพื่อยืนยันว่าเห็นข้อมูลตรงกัน
5. ทดสอบกรณี conflict
   - ให้ session B เปลี่ยนค่า cell เดียวกับ session A แล้วบันทึกก่อน
   - กลับมาที่ session A พยายามบันทึก จะต้องขึ้น error กันชนและให้ refresh
6. ตรวจสอบหลังทดสอบ
   - ใช้ Dev Impersonation Panel กลับมาเป็นตัวเอง/clear state
   - ตรวจสอบ Firestore หรือใช้ script dedupe เพื่อตรวจว่าไม่มีข้อมูลซ้ำ
