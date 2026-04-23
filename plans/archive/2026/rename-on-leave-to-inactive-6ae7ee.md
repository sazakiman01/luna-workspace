# เปลี่ยน "On Leave" → "Inactive" สำหรับ soft-deleted members

เปลี่ยนคำที่แสดงใน UI จาก "On Leave" เป็น "Inactive" ทุกจุดที่หมายถึงพนักงานที่ออกจากบริษัทแล้ว (status: 'inactive') เพื่อไม่ให้สับสนกับการลางานจริง

## ไฟล์ที่ต้องแก้ไข

### 1. `src/features/members/MemberList.jsx`
- บรรทัด 355: `on leave` → `inactive`
- บรรทัด 382: `On Leave` → `Inactive` (ปุ่ม View/Hide)
- บรรทัด 506: หัวข้อ section `ON LEAVE` → `INACTIVE`
- บรรทัด 523: badge `ON LEAVE` → `INACTIVE`
- บรรทัด 321: title ปุ่ม `Set on Leave` → `Set Inactive`
- เปลี่ยนไอคอนจาก `PauseCircle` → `UserX` (เหมาะกับคนออก) เฉพาะ badge ใน inactive section
- เปลี่ยนสี accent จาก amber → slate/gray (ดูเป็น inactive มากกว่า leave)

### 2. `src/features/members/SuspendUserModal.jsx`
- บรรทัด 65: หัวข้อ `Temporary Leave` → `Set Inactive`
- บรรทัด 66: คำอธิบาย เหมือนเดิม "Member data is fully preserved"
- บรรทัด 104: `During leave:` → `While inactive:`
- บรรทัด 212: ปุ่ม `Set on Leave` → `Set Inactive`
- บรรทัด 207: loading text `Suspending...` → `Setting inactive...`

### 3. `src/App.jsx`
- บรรทัด 450: alert `Failed to set member on leave` → `Failed to set member inactive`

### 4. `src/features/auth/AuthContext.jsx`
- บรรทัด 133-134: ข้อความ login block `You are currently on leave` → `Your account is inactive`

## ไม่แก้
- **`TodayStatusGrid.jsx`** — comment "On Leave Card" หมายถึงการลางานจริง (leaves) ไม่เกี่ยวกับ inactive members
- **`WorkloadView.jsx`** — comment "only warn if not on leave" หมายถึงลางานจริง
- **Database field `status: 'inactive'`** — ไม่เปลี่ยน ถูกต้องอยู่แล้ว
- **`memberService.js`** — comment อาจอัปเดตเล็กน้อยให้สอดคล้อง

## สรุปสิ่งที่เปลี่ยน
| เดิม | ใหม่ |
|------|------|
| On Leave / on leave | Inactive / inactive |
| Temporary Leave | Set Inactive |
| During leave | While inactive |
| You are currently on leave | Your account is inactive |
| PauseCircle (inactive section) | UserX |
