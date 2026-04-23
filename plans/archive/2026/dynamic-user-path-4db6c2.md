# แก้ Script ให้รองรับ User ต่างกัน

แก้ `Setup-LunaRepo.ps1` ให้ใช้ dynamic path แทน hard-code username เพื่อให้ใช้ได้บนเครื่องที่มี user ต่างกัน

## สิ่งที่ต้องแก้

**1. `Setup-LunaRepo.ps1`**
- เปลี่ยน `$GlobalRoot = "C:\Users\sansakritsuk\.windsurf"` → `$GlobalRoot = "$env:USERPROFILE\.windsurf"`
- เพิ่ม validation ว่า global folder มีอยู่จริง

**2. `README.md`**
- อัปเดตคำอธิบายวิธี copy ไปเครื่องอื่น
- เพิ่มหมายเหตุว่า script ใช้ dynamic path แล้ว ไม่ต้องแก้อะไร
