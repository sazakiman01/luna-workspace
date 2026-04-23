# แผนการผนวก SharePoint กับระบบโปรเจ็กต์

แผนนี้มีจุดมุ่งหมายเพื่อเพิ่มฟีเจอร์การเชื่อมโยงเอกสาร SharePoint กับแต่ละโปรเจ็กต์ในระบบ Delivery Hub

## คำถามที่ต้องชี้แจงก่อน

### 1. ลักษณะของ SharePoint ที่ใช้
- เป็น SharePoint Online (Office 365) หรือ SharePoint On-Premise?
- มีการใช้ SharePoint Sites แยกตามโปรเจ็กต์หรือเป็น Site รวม?
- มีการใช้ Document Libraries หรือ Lists ในการเก็บเอกสาร?

### 2. ประเภทของเอกสาร/ลิงก์ที่ต้องการเชื่อมโยง
- เอกสารโปรเจ็กต์ (Project Documents)
- รายงานความคืบหน้า (Progress Reports)
- สัญญา/เอกสารทางการเงิน (Contracts/Financials)
- ภาพถ่ายการประชุม (Meeting Photos)
- Deliverables และ Output files

### 3. วิธีการเข้าถึง
- ต้องการแค่ลิงก์ไปยัง SharePoint URL หรือต้องการ embed/preview?
- ต้องการ authentication ผ่าน Microsoft Graph API หรือใช้ลิงก์ตรงๆ?
- มีการจำกัดสิทธิ์การเข้าถึงตามบทบาทผู้ใช้หรือไม่?

## แนวทางการออกแบบ (ระดับสูง)

### 1. การเพิ่ม Field ใน Project Schema
```javascript
// ใน project document
{
  // ... fields ที่มีอยู่แล้ว
  sharepointLinks: [
    {
      id: "unique-id",
      title: "เอกสารโปรเจ็กต์หลัก",
      url: "https://company.sharepoint.com/sites/project123/Shared%20Documents",
      type: "documentLibrary", // documentLibrary | folder | file | list
      category: "projectDocs", // projectDocs | reports | contracts | deliverables
      icon: "folder", // lucide icon name
      isPublic: false,
      createdBy: "user-id",
      createdAt: "2026-03-26T10:00:00Z"
    }
  ]
}
```

### 2. UI Components ที่ต้องพัฒนา
- **SharepointLinkCard** - การ์ดแสดงลิงก์ SharePoint
- **SharepointLinkModal** - Modal สำหรับเพิ่ม/แก้ไขลิงก์
- **SharepointPreview** - Component preview ไฟล์ (ถ้าจะทำ)
- **SharepointLinkSection** - ส่วนแสดงใน Project Card

### 3. ตำแหน่งที่จะแสดงใน UI
- **Project Card** (ใน Delivery Hub > Overview) - แสดง icon + จำนวนลิงก์
- **Project Detail Modal** - แสดงรายการลิงก์แบบเต็ม
- **Project Edit Modal** - ฟอร์มเพิ่ม/แก้ไขลิงก์

### 4. ฟีเจอร์ที่ควรมี
- เพิ่ม/ลบ/แก้ไขลิงก์ SharePoint
- จัดหมวดหมู่ลิงก์ (Project Docs, Reports, Contracts, etc.)
- แสดง icon ตามประเภทไฟล์/โฟลเดอร์
- เช็คสถานะลิงก์ (valid/invalid)
- Copy link ไปยัง clipboard
- Open in new tab
- Permissions (Public/Team only)

## ขั้นตอนการพัฒนาที่เสนอ

### Phase 1: Database & Backend
1. เพิ่ม field `sharepointLinks` ใน project schema
2. อัปเดต projectService.js ให้รองรับ field ใหม่
3. สร้าง helper functions สำหรับจัดการลิงก์

### Phase 2: UI Components
1. สร้าง SharepointLinkCard component
2. สร้าง SharepointLinkModal component  
3. อัปเดต ProjectList.jsx ให้แสดงลิงก์
4. อัปเดต NewProjectModal.jsx ให้รองรับการเพิ่มลิงก์

### Phase 3: Integration & Polish
1. เชื่อมโยงกับ Delivery Hub
2. เพิ่ม animations และ interactions
3. ทดสอบและแก้ไขข้อผิดพลาด

## คำถามเพิ่มเติมสำหรับผู้ใช้
1. ต้องการให้สามารถ upload ไฟล์ตรงจากระบบไปยัง SharePoint ได้หรือไม่?
2. ต้องการฟีเจอร์ search ใน SharePoint จากในระบบหรือไม่?
3. มีความต้องการดึงข้อมูล metadata จาก SharePoint มาแสดงในระบบหรือไม่?
