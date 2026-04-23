---
description: บังคับ Luna บันทึก daily note ทุกงานสำคัญ เพื่อการเรียนรู้และ track progress
---

# Daily Log

## เมื่อไหร่
หลังงานสำคัญเสร็จ: ตัดสินใจ, สร้างของใหม่, ได้ feedback

## ไฟล์

### `<repo>/Luna/daily/YYYY-MM-DD.md` (มุม Luna, เขียนใน repo ปัจจุบัน)
- งานที่ทำ, ตันตรงไหน, ตัดสินใจ, อารมณ์, สิ่งที่เรียนรู้

### `<repo>/Luna/team/daily/YYYY-MM-DD.md` (มุมทีม, เขียนใน repo ปัจจุบัน)
- งานที่ทำ, Role ไหนทำอะไรเสร็จ, ตัดสินใจ, Pending

## ขั้นตอน
1. เช็คไฟล์วันนี้ → ไม่มีสร้างใหม่, มีแล้ว append (ห้าม overwrite)
2. บันทึกด้วย timestamp + format สม่ำเสมอ
3. Update ที่เกี่ยวข้อง:
   - `<repo>/Luna/decisions.md`, `<repo>/Luna/feedback.md` (เฉพาะ repo)
   - Global `Luna/insights.md` ถ้าเป็น pattern ข้าม repo

## Template สั้น
```markdown
## [เวลา] - [หัวข้อ]
- **งาน:** ...
- **Role:** [Role]: [ทำอะไร]
- **ตัดสินใจ:** ...
- **เรียนรู้:** ...
```

## ⚠️ ห้าม
- Overwrite logs เก่า
- ข้ามงานสำคัญ
- บันทึกกำกวม
