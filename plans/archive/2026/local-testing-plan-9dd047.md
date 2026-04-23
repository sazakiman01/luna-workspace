# แผนทดสอบ Admin Work บนเครื่องเดียว
สรุป: ตั้งค่าการทดสอบด้วยหลาย session บนคอมเดียวเพื่อจำลองหลายคนแก้ Admin Work พร้อมกันแล้วตรวจสอบกลไกกันชน

1. เตรียมข้อมูลและสิทธิ์ผู้ใช้
   - ตรวจสอบว่าบัญชี Firebase มีสิทธิ์ admin/workload ครบ และมี users target ที่ต้องการทดสอบ
   - หากต้องการ mock leaves/holidays ให้เตรียมข้อมูลไว้ล่วงหน้า (ใช้ Firestore console)
2. จำลองหลาย session บนคอมเดียว
   - เปิด browser 2 profile (เช่น Chrome profile vs Guest หรือ Chrome + Edge) แล้ว login คนละ user หรือ user เดียวกันแต่คนละ session
   - เปิด Delivery Hub → แท็บ Workload แล้วเลือกผู้ใช้คนเดียวกันใน modal ทั้งสองฝั่ง
3. ทดสอบกรณีไม่ชนกัน
   - ให้ session A กรอก cell วันจันทร์ category A แล้วกด Save (มั่นใจว่าอีก session ยังไม่แก้)
   - Refresh session B ดึงข้อมูลล่าสุด → ยืนยันว่าข้อมูลอัปเดตตาม A
4. ทดสอบ conflict detection
   - ให้ session A กรอก cell เดิม (เช่น dev-coaching วันอังคาร) แล้ว Save
   - ระหว่างที่ A ยังไม่บันทึก ให้ session B เปลี่ยนค่า cell เดียวกันและ Save ก่อน
   - กลับมาที่ A แล้วพยายาม Save ค่าที่กรอก จะต้องเห็น error แจ้งว่ามีคนอื่นแก้ไขพร้อมแนะนำให้ Refresh
5. ตรวจสอบ cleanup script
   - รัน `node scripts/dedupe_admin_work.mjs <เดือนที่ทดสอบ>` บน terminal เพื่อดูว่ามี duplicates หรือไม่ (โหมด read-only)
   - ถ้าต้องการจำลองกรณีพบข้อมูลซ้ำ ให้คัดลอก document ใน Firestore หรือเพิ่มด้วย API แล้วรัน script อีกครั้ง
6. Checklist หลังทดสอบ
   - ไม่มี error ใน console ของทั้งสอง session
   - กลไก conflict แจ้งเตือนถูก และไม่บันทึกทับกัน
   - ข้อมูลหลังทดสอบไม่มี entries ซ้ำ (ใช้ script หรือ Firestore console ตรวจ)
