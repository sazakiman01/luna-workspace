# แผนการเพิ่ม SharePoint Links ในโปรเจ็กต์

แผนนี้มีจุดมุ่งหมายเพื่อเพิ่มฟีเจอร์การแปะลิงก์ SharePoint โฟลเดอร์ในแต่ละโปรเจ็กต์ เพื่อให้ทีมเข้าถึงเอกสารได้ง่าย

## ความต้องการที่ชัดเจน
- แปะลิงก์โฟลเดอร์ SharePoint ของแต่ละโปรเจ็กต์
- ทีมสามารถกดลิงก์เพื่อไปยัง SharePoint ได้ง่ายๆ
- ไม่ต้องการฟีเจอร์ซับซ้อน (ไม่ต้อง upload, search, preview)

## แนวทางการออกแบบ

### 1. Database Schema
เพิ่ม field `sharepointFolderUrl` ใน project document:
```javascript
{
  // ... fields ที่มีอยู่แล้ว
  name: "โปรเจ็กต์ A",
  description: "...",
  sharepointFolderUrl: "https://company.sharepoint.com/sites/projects/ProjectA/Shared%20Documents",
  // ... fields อื่นๆ
}
```

### 2. UI Components

#### 2.1 Project Card (ใน Delivery Hub)
- เพิ่ม SharePoint icon ในการ์ดโปรเจ็กต์
- แสดงถ้ามี `sharepointFolderUrl`
- คลิกเพื่อเปิดลิงก์ใน new tab

#### 2.2 Project Edit Modal  
- เพิ่ม input field สำหรับใส่ SharePoint URL
- มี validation สำหรับ URL format
- มีปุ่ม "Test Link" เพื่อทดสอบลิงก์

### 3. ตำแหน่งที่แสดงผล

#### ใน Project Card:
```
[Project Name]     [Status] [Progress]
[Description...]   [Budget]

[SharePoint] [Edit] [Delete]  <-- เพิ่ม SharePoint icon ที่นี่
```

#### ใน Project Modal:
```
Basic Information
├─ Project Name: [input]
├─ Description: [textarea]
├─ SharePoint URL: [input] [Test Link]  <-- เพิ่มที่นี่
└─ ...
```

### 4. Features ที่จะ implement
1. **Add SharePoint URL** - ใน NewProjectModal และ EditProjectModal
2. **Display SharePoint Link** - ใน Project Card
3. **Open in New Tab** - เมื่อคลิก SharePoint icon
4. **URL Validation** - ตรวจสอบว่าเป็น SharePoint URL ที่ถูกต้อง
5. **Optional: Link Status** - ตรวจสอบว่าลิงก์ยังใช้ได้อยู่หรือไม่

## ขั้นตอนการพัฒนา

### Phase 1: Database & Service
1. อัปเดต projectService.js ให้รองรับ `sharepointFolderUrl`
2. เพิ่ม validation สำหรับ URL format
3. อัปเดต addProject/updateProject functions

### Phase 2: UI Implementation
1. แก้ไข NewProjectModal.jsx - เพิ่ม SharePoint URL input
2. แก้ไข ProjectList.jsx - เพิ่ม SharePoint icon ใน project card
3. เพิ่ม click handler สำหรับเปิดลิงก์
4. เพิ่ม styling และ animations

### Phase 3: Polish & Testing
1. ทดสอบการเพิ่ม/แก้ไขลิงก์
2. ทดสอบการเปิดลิงก์
3. เพิ่ม error handling
4. ทดสอบ responsive design

## Design Details

### SharePoint Icon Position
- อยู่ใน action buttons ของ project card
- ใช้ lucide-react icon `ExternalLink` หรือ `FolderOpen`
- มี tooltip "เปิด SharePoint"

### URL Input Design
```
SharePoint Folder URL
[https://company.sharepoint.com/...] [Test Link]
🔗 ใส่ลิงก์โฟลเดอร์ SharePoint ของโปรเจ็กต์นี้
```

### Validation Rules
- ต้องเป็น valid URL
- ควรมีคำว่า "sharepoint.com" ใน URL (optional)
- แสดง error message ถ้า URL ไม่ถูกต้อง

## ความเรียบง่ายของโซลูชัน
- ไม่ต้องการ Microsoft Graph API
- ไม่ต้องการ authentication ซับซ้อน  
- ใช้ลิงก์ตรงไปยัง SharePoint เท่านั้น
- ทีมสามารถคลิกเพื่อเปิดได้ทันที
- ไม่ต้องการ preview หรือ embed

ที่เหมาะสมกับความต้องการ "แค่ให้ทีมกดลิงก์ไปง่ายๆ" พอดี
