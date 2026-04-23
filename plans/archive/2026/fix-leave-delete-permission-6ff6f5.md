# Fix Leave Delete Permission Issue

## สาเหตุ
ปุญหาการลบข้อมูลในระบบ Leave Management สำหรับผู้ใช้ระดับ assist เกิดจากการไม่มีการตรวจสอบสิทธิ์ก่อนแสดงปุ่มลบ ตามระบบ permission ที่กำหนดไว้:

- Permission ที่ต้องการ: `leaves.manage` (ต้องการ member level ขึ้นไป + isServiceLead)
- Assist level (level 40) ไม่มีสิทธิ์ตามที่กำหนดใน roles.js
- Lead สามารถลบได้เพราะมี isServiceLead flag

## การแก้ไข
1. **เพิ่ม PermissionGate** ใน LeaveRecordList.jsx ครอบปุ่มลบ
2. **เพิ่ม error handling** แสดงข้อความเมื่อไม่มีสิทธิ์
3. **ทดสอบ** กับผู้ใช้ระดับต่างๆ

## ไฟล์ที่ต้องแก้ไข
- `src/features/daily/components/LeaveRecordList.jsx`
- อาจต้องแก้ไข `LeaveManagementModal.jsx` หากต้องการแสดงข้อความเตือน
