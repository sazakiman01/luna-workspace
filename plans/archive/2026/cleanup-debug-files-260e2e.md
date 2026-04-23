# Plan: ลบไฟล์ Debug และ Test ออกจาก Git Tracking

จัดการไฟล์ debug และ test scripts ที่ไม่ควรอยู่ใน git repository เพื่อให้ repository สะอาดและเหมาะสมกับ production

## ขั้นตอนการดำเนินการ

### 1. เพิ่ม patterns เข้า .gitignore
เพิ่ม patterns ต่อไปนี้ที่ท้ายไฟล์ .gitignore:
```
# Debug & Test Scripts
check_firestore*.js
debug_planner.html
test-skill-updates.js

# ESLint Output
eslint_out.json

# Build Logs
build.log
```

### 2. ลบไฟล์ออกจาก git tracking
ใช้คำสั่ง `git rm --cached` เพื่อลบไฟล์เหล่านี้ออกจาก git tracking (แต่ไม่ลบไฟล์จริง):
- check_firestore.js
- check_firestore_simple.js
- debug_planner.html
- test-skill-updates.js
- eslint_out.json

### 3. Commit การเปลี่ยนแปลง
Commit การเปลี่่งแปลง .gitignore และการลบไฟล์ออกจาก git tracking
