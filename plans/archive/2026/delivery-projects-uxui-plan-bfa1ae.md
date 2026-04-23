# ลดความลายตาในแท็บ Projects
แผนนี้สรุปการรีวิวและปรับ UX/UI ของแท็บ Projects ให้ใช้งานสบายตา อ่านง่าย และลดความเครียดโดยไม่ลดข้อมูลสำคัญ.

## 1) ขอบเขตและไฟล์ที่เกี่ยวข้อง
- `src/features/projects/ProjectList.jsx` — ตัวการหลักของ visual noise (pills, filter bar, cards/list rows, badges, alerts, timeline)
- `src/features/delivery/HelpCard.jsx` — กล่องคำแนะนำบนแท็บ Projects (มีข้อความ/สีเยอะ)
- `src/features/delivery/DeliveryHub.jsx` — header + tabs + spacing รอบแท็บ

## 2) การวิเคราะห์จุดที่ “ลายตา” (จากโค้ดปัจจุบัน)
- **ความหนาแน่นขององค์ประกอบ**: มี chips เยอะมาก (pills) + search/filter + sort + view toggle อยู่บรรทัดเดียวกัน
- **สี/สัญญาณเตือนเยอะในแต่ละการ์ด**: มี badge หลายตัว + alert chips + rings + timeline ในการ์ดเดียว
- **ตัวอักษรขนาดเล็ก/ตัวหนาเยอะ**: ใช้ bold และ uppercase หลายส่วนพร้อมกัน ทำให้รู้สึกแข็ง/เครียด
- **ข้อมูลสำคัญกับรองไม่แยกชั้น**: ส่วน “รายละเอียด/เตือน” ปรากฏพร้อมกันทุกการ์ด ทำให้การสแกนลำบาก
- **HelpCard มี content เยอะ** ในหน้าเดียวกับ cards ทำให้ scroll ดูหนัก

## 3) แนวทางลด Visual Noise (หลักคิด)
- **ลดจำนวนองค์ประกอบในมุมมองแรก (first scan)**: ให้เห็นชื่อโปรเจค + สถานะ + owner + งบ + วันสำคัญก่อน
- **ใช้ progressive disclosure**: ข้อมูลรอง/เตือน/รายละเอียดให้ซ่อนไว้ (เช่น แสดงเมื่อ hover/expanded)
- **จำกัดสี warning**: ใช้สีเตือนเฉพาะกรณีเกินงบ/เลยกำหนดจริง ๆ (ลด amber/yellow ที่กระจาย)
- **เพิ่ม whitespace + ลดตัวหนา**: ใช้ regular weights สำหรับ secondary info, เพิ่ม spacing ระหว่าง group
- **ลด text noise**: ชื่อ filter/pill ให้สั้นขึ้น, ใช้ icon เป็นเสริมไม่ใช่หลัก

## 4) แผนปรับ UI เป็นขั้นตอน (ไม่แก้โครงใหญ่ก่อน)
### Phase A — Quick Wins (ลดลายตาแบบไม่เปลี่ยนโครง)
1) **ลดจำนวน pills ที่แสดง** (รวม alerts เป็นหมวดเดียว หรือใช้ dropdown)
2) **ลดระดับสี/animation ของ alerts** (ตัด pulse และใช้สีอ่อนในสถานะ “ใกล้ถึง”)
3) **จัด filter bar เป็น 2 แถว** บนจอเล็ก/ปกติ: search+status / sort+view toggle
4) **ปรับ typography**: ลด uppercase/track-wider ใน text ที่ไม่ใช่หัวข้อ
5) **HelpCard**: ทำเป็น collapsible หรือย่อเหลือ 2–3 bullet แล้วมี “ดูเพิ่มเติม”

### Phase B — Structural Improvements (ลดความหนาแน่นของการ์ด)
1) **Card layout แบ่งเป็น 2 ชั้น**: Primary info (ชื่อ+สถานะ+owner+งบ), Secondary info (milestone+alerts) ซ่อนได้
2) **Alert chips**: แสดงเฉพาะ 1–2 ตัวที่สำคัญสุด (priority-based)
3) **Milestone timeline**: แสดงเมื่อ hover หรือ expanded เท่านั้น
4) **Compact mode**: เปิดเป็นค่า default หรือทำ “Focus mode” ให้เป็นมุมมองโล่ง

### Phase C — Optional Enhancements
- เพิ่ม “Summary strip” สั้น ๆ แทน pills จำนวนมาก
- เพิ่ม “Active filters summary” เพื่อให้ผู้ใช้เห็นเงื่อนไขที่ใช้

## 5) ไฟล์/จุดที่จะปรับ (เป้าหมายชัดเจน)
- `ProjectList.jsx`
  - Pills section (ลดจำนวน/เปลี่ยนเป็น dropdown หรือ collapsible)
  - Search & Filter bar (จัด layout ใหม่ + spacing)
  - Card view (ลด alert chips + ลด font-weight + spacing)
  - MilestoneTimeline (แสดงเฉพาะเมื่อ hover/expanded)
- `HelpCard.jsx`
  - ทำ collapsible หรือ short mode
- `DeliveryHub.jsx`
  - ตรวจ spacing header กับ tab content เพื่อลดความหนาแน่น

## 6) ความเสี่ยง/สิ่งที่ต้องระวัง
- ลดข้อมูลมากเกินไปจนทีม Lead มองไม่เห็น warning สำคัญ
- เปลี่ยน layout มากเกินไปอาจกระทบ workflow เดิม

## 7) เกณฑ์สำเร็จ (Definition of Done)
- ผู้ใช้สามารถสแกนโปรเจคหลักได้เร็วขึ้น (มองชื่อ+สถานะ+งบ+กำหนดส่งใน 1–2 วินาที)
- จำนวน element ต่อการ์ดลดลงอย่างชัดเจน
- สีเตือนถูกใช้เฉพาะเคส critical เท่านั้น
