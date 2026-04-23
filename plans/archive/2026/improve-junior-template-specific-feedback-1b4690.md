# แผนปรับปรุง Junior Report Template ให้เจาะจงมากขึ้น

## สรุปแผน
ปรับปรุง junior report template ให้ไม่แจ้ง "Not Reviewed" แบบคลุมเคลือ แต่ให้ตรวจสอบและแจ้งผลลัพธ์จริง หรือบอกสาเหตุที่ไม่ได้ตรวจอย่างชัดเจน

## ปัญหาปัจจุบัน
**ตัวอย่างที่ทำให้ Junior งง:**
```
### 5️⃣ Accessibility (การเข้าถึง)
**Status:** ⚠️ Not Reviewed
- ยังไม่ได้ตรวจสอบ ARIA labels, keyboard navigation
```

**ปัญหา:**
- ไม่บอกว่าทำไมไม่ได้ตรวจ
- ไม่บอกว่าควรตรวจอย่างไร
- ทำให้ Junior ไม่รู้ว่าต้องทำอะไรต่อ

## สิ่งที่ต้องปรับ

### 1. แก้ไข "Not Reviewed" ให้เจาะจง
**ปัจจุบัน:**
```
**Status:** ⚠️ Not Reviewed
- ยังไม่ได้ตรวจสอบ ARIA labels, keyboard navigation
```

**ใหม่ (มี 3 รูปแบบ):**

**รูปแบบ A: ตรวจแล้วแต่มีปัญหา**
```
**Status:** ❌ มีปัญหา
- **ไม่มี ARIA labels:** ปุ่มและฟอร์มไม่มี aria-label
- **ไม่มี keyboard navigation:** ใช้ mouse ได้อย่างเดียว
- **แก้ยังไง:** เพิ่ม aria-label และ keyboard event handlers
```

**รูปแบบ B: ตรวจแล้วแต่ไม่มีปัญหา**
```
**Status:** ✅ ดีแล้ว
- มี ARIA labels ครบถ้วน
- รองรับ keyboard navigation ได้ดี
- ผ่าน accessibility test
```

**รูปแบบ C: ไม่สามารถตรวจได้ (พร้อมเหตุผล)**
```
**Status:** ⚠️ จำเป็นต้องตรวจด้วยตนเอง
- **ทำไมไม่ตรวจได้:** ต้องทดสอบกับ screen reader จริง
- **วิธีตรวจ:** ใช้ axe-devtools extension หรือ screen reader
- **ควรตรวจ:** ทุก component ที่ user ใช้งาน
```

### 2. เพิ่มส่วน "วิธีตรวจสอบ" สำหรับแต่ละมิติ
**ตัวอย่างสำหรับ Accessibility:**
```
### 🔍 วิธีตรวจสอบ Accessibility
1. **ติดตั้ง axe-devtools:** Chrome extension
2. **รัน automatic test:** axe-devtools จะบอกปัญหา
3. **ทดสอบ keyboard:** Tab ไปรอบๆ หน้าเว็บ
4. **ทดสอบ screen reader:** ใช้ VoiceOver หรือ NVDA
```

### 3. อัปเดต Template ให้มีตัวอย่างที่ชัดเจน
**เพิ่ม section ใหม่ใน template:**
```
## 🔍 วิธีตรวจสอบแต่ละมิติ (สำหรับ Junior)

### Accessibility ตรวจยังไง?
1. ติดตั้ง axe-devtools extension
2. เปิด console แล้วรัน: axe.run()
3. ทดสอบ keyboard navigation (Tab, Enter, Space)
4. ตรวจสอบ color contrast

### Performance ตรวจยังไง?
1. เปิด DevTools → Performance tab
2. บันทึกการทำงาน 5 วินาที
3. ดู Lighthouse score
4. ตรวจสอบ bundle size ที่ bundlephobia.com
```

### 4. ปรับรูปแบบการแจ้งสถานะ
**Status ใหม่ให้เจาะจงมากขึ้น:**
- ✅ **ดีแล้ว** - ไม่ต้องทำอะไร
- ⚠️ **มีเรื่องเล็กน้อย** - ควรแก้ถ้ามีเวลา
- ❌ **มีปัญหา** - ต้องแก้
- 🔧 **ต้องตรวจเพิ่ม** - ต้องตรวจด้วยตนเอง

## ขั้นตอนการทำงาน

1. แก้ไข `assets/review-report-template-junior-th.md`
2. เพิ่มส่วน "วิธีตรวจสอบแต่ละมิติ"
3. ปรับรูปแบบการแจ้ง "Not Reviewed"
4. เพิ่มตัวอย่างที่ชัดเจน
5. ทดสอบ template ใหม่

## ผลลัพธ์ที่คาดหวัง

**ก่อนปรับ:** Junior งง ไม่รู้ว่าต้องทำอะไรกับ "Not Reviewed"
**หลังปรับ:** Junior รู้ว่า:
- มีปัญหาอะไรบ้าง
- แก้ยังไง
- ตรวจยังไงถ้าต้องตรวจเอง
- ทำอะไรต่อไป
