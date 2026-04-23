# Phase 2 Sprint 1 - บังคับ Pattern การทำงาน

สร้าง Workflows 3 ตัวเพื่อบังคับ Luna ให้ทำตามรูปแบบการทำงาน (เรียกทีม → รีวิว → เสนอ) พร้อมบันทึก Luna persona ลง Windsurf Memory DB

## เป้าหมาย
- แก้ปัญหา Luna ลืมเรียกทีมงาน
- บังคับให้ระบบเรียนรู้จาก feedback
- ให้ Luna persona persist ข้ามทุก session

## สิ่งที่จะทำ

### 1. บันทึก Windsurf Memory DB (2 memories)
- **Luna Persona** - ผู้หญิง 30 ปี, เพื่อนร่วมงานที่รู้ใจของพี่แมน, ตอบภาษาไทย
- **Work Pattern (CRITICAL)** - เรียกทีม → รีวิว → เสนอ (ห้ามทำเอง)

### 2. สร้าง Workflows 3 ไฟล์

#### `.windsurf/workflows/team-delegate.md`
บังคับ Luna เรียกทีมเสมอเมื่อได้รับงาน
- Step 1: วิเคราะห์งาน → เลือก Role ที่ถนัด (จาก team-config.md)
- Step 2: ประกาศทีมงานที่จะใช้ให้พี่แมนรู้
- Step 3: ให้ Role ทำงาน (แสดงผลงานในนาม Role)
- Step 4: Luna รีวิว (ตรวจคุณภาพ)
- Step 5: Luna นำเสนอ + บันทึกลง `/team/daily/YYYY-MM-DD.md`

#### `.windsurf/workflows/daily-log.md`
บังคับบันทึก daily note
- เมื่อไหร่ต้องบันทึก (ทุกงานสำคัญ)
- บันทึกที่ไหน (`/Luna/daily/` + `/team/daily/`)
- บันทึกอะไร (งาน, ตัดสินใจ, ตันตรงไหน, สิ่งที่เรียนรู้)

#### `.windsurf/workflows/feedback-learn.md`
บังคับเรียนรู้จาก feedback
- รับ feedback → บันทึก `feedback.md`
- วิเคราะห์ root cause
- เพิ่มวิธีป้องกันใน rules/preferences
- อัปเดต memory DB

### 3. อัปเดต `team-config.md`
เพิ่ม mapping ประเภทงาน → Role ที่ควรเรียก เพื่อให้ Luna เลือก Role ได้ง่าย

## ลำดับการทำงาน
1. บันทึก Memory DB (2 memories)
2. สร้าง `team-delegate.md`
3. สร้าง `daily-log.md`
4. สร้าง `feedback-learn.md`
5. อัปเดต `team-config.md` (task-to-role mapping)
6. บันทึก daily note

## สิ่งที่ยังไม่ทำใน Sprint นี้
- Skills ของแต่ละ Role (รอใช้งานจริง → ทำทีละตัว)
- Workflows: code-review, deployment, retrospective, windsurf-scan (Sprint 3)

## เวลาที่คาดว่าใช้
ประมาณ 10-15 นาที (5 ไฟล์ + 2 memories)
