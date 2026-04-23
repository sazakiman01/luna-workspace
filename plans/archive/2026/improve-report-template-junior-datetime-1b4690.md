# แผนปรับปรุง Report Template ให้ Junior เข้าใจง่าย + DateTime Format

## สรุปแผน
ปรับปรุง frontend-repo-review skill โดยสร้าง report template ใหม่ที่เข้าใจง่ายสำหรับ junior developers และเปลี่ยนการตั้งชื่อไฟล์จาก date เป็น datetime เพื่อรองรับการรันหลายครั้งต่อวัน

## สิ่งที่ต้องปรับ

### 1. สร้าง Report Template ใหม่สำหรับ Junior
**ไฟล์ใหม่:** `assets/review-report-template-junior-th.md`

**คุณสมบัติ:**
- ภาษาง่าย ไม่ใช้ศัพท์เทคนิคซับซ้อน
- แบ่งเป็น 3 ระดับความรุนแรง: อันตรายสูงสุด, น่ากังวล, แนะนำ
- มีตัวอย่างโค้ดง่ายๆ
- Action plan ทีละขั้นตอนชัดๆ
- ใช้ emoji ช่วยให้อ่านง่าย

**โครงสร้างใหม่:**
```markdown
# รายงานรีวิวโค้ด (ฉบับ Junior)

## 🚨 อันตรายสูงสุด (ต้องแก้ก่อนขึ้น production)
### ปัญหาที่ 1: ไม่มี Test
- **ทำไมอันตราย:** ไม่รู้ว่าโค้ดพังไหม
- **แก้ยังไง:** ...
- **ตัวอย่างโค้ด:** ...

## ⚠️ น่ากังวล (ควรแก้เร็วๆ)
...

## ✅ ทำได้ดีแล้ว
...

## 📋 แผนการแก้ไข (ทีละขั้น)
### Week 1: แก้อันตรายสุดๆ
1. ...
2. ...

### Week 2: ...
```

### 2. ปรับ DateTime Format ในการตั้งชื่อไฟล์
**ปัจจุบัน:**
- `pr-{PR_NUMBER}-{DATE}.md` → `pr-123-2026-03-27.md`
- `audit-{DATE}.md` → `audit-2026-03-27.md`

**ใหม่:**
- `pr-{PR_NUMBER}-{DATETIME}.md` → `pr-123-2026-03-27-14-30.md`
- `audit-{DATETIME}.md` → `audit-2026-03-27-14-30.md`

**รูปแบบ DateTime:** `YYYY-MM-DD-HH-MM` (24 ชั่วโมง)

### 3. อัปเดต SKILL.md
**แก้ไขส่วนที่ 6) สร้างและเก็บไฟล์ report:**
```markdown
**ตำแหน่งที่แนะนำสำหรับเก็บ report:**
- **PR Review (Junior):** `.windsurf/reviews/pr-{PR_NUMBER}-{DATETIME}-junior.md`
- **PR Review (Standard):** `.windsurf/reviews/pr-{PR_NUMBER}-{DATETIME}.md`
- **Full Repo Audit:** `.windsurf/reviews/audit-{DATETIME}.md`
- **Release Review:** `.windsurf/reviews/release-{VERSION}-{DATETIME}.md`

**รูปแบบ DateTime:** YYYY-MM-DD-HH-MM (ตัวอย่าง: 2026-03-27-14-30)
```

### 4. เพิ่มตัวเลือกให้ผู้ใช้เลือก Template
**เมื่อเรียกใช้ skill:**
- ถ้าเป็น junior → ใช้ template-junior
- ถ้าเป็น senior/tech lead → ใช้ template ปกติ

**วิธีตรวจสอบ:**
- ดูจากประเภทการรีวิว (PR review vs full audit)
- ดูจากขนาด repo/ความซับซ้อน
- สามารถถามผู้ใช้ตรงๆ ได้

## ขั้นตอนการทำงาน

1. สร้างไฟล์ `assets/review-report-template-junior-th.md` ใหม่
2. อัปเดต `SKILL.md` ให้รองรับ datetime format
3. แก้ไข logic ในการตั้งชื่อไฟล์ report
4. เพิ่มตัวเลือกให้เลือกระหว่าง junior/standard template
5. ทดสอบการสร้าง report ใหม่

## ผลลัพธ์ที่คาดหวัง

**ก่อนปรับ:**
- Report ซับซ้อน Junior อ่านไม่รู้เรื่อง
- ชื่อไฟล์ซ้ำกันถ้ารันหลายครั้ง/วัน

**หลังปรับ:**
- Junior อ่านเข้าใจง่าย มี action plan ชัดเจน
- ไม่มีปัญหาชื่อไฟล์ซ้ำ
- มี template ให้เลือกตามความเหมาะสม
- เพิ่มประสิทธิภาพการทำงานในทีม
