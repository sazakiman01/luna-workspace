# แผนปรับปรุงระบบแบบกระทบของเดิมน้อยที่สุด
สรุปขั้นตอนเพื่อยกระดับโครงสร้าง/โค้ดตามมาตรฐาน React + Firebase โดยจัดลำดับงานให้เปลี่ยนแปลงน้อยที่สุดและตรวจสอบผลกระทบทุกจุด

1. **กำหนดเป้าหมายและข้อจำกัด**
   - รวบรวม pain points ปัจจุบัน (เช่น usage ของ `src/shared/`, service ที่ยังคุย Firebase ตรง ๆ, component ที่ยาวเกินมาตรฐาน) และนิยามเกณฑ์ "น้อยที่สุด" (ไม่เปลี่ยน public API, ไม่แตะ flow auth/team)
   - ระบุโมดูล critical (AuthContext, TeamContext, Delivery Hub) ที่ต้อง freeze เว้นแต่มี dependency ตรง

2. **สำรวจระบบและทำ dependency map แบบ read-only**
   - ใช้การอ่านไฟล์/ static scan เพื่อตรวจสอบว่าแต่ละ feature เรียก service/context อย่างไร และบันทึกไฟล์ที่ยังละเมิดกฎ (เช่น import Firebase ตรง, ใช้ shared folder)
   - แยกกลุ่มไฟล์ตาม priority (P1 = แก้แล้วลดความเสี่ยงสูง, P2 = cosmetic/refactor) เพื่อหลีกเลี่ยง big bang change

3. **ออกแบบชุดปรับปรุงย่อยแบบ toggle-able**
   - สำหรับแต่ละกลุ่ม ปรับทีละ feature: เช่น ย้าย utility จาก `src/shared/` ไป `src/components/` พร้อม barrel file, หรือห่อ Firebase call ด้วย service ใหม่โดยปล่อย interface เดิมคงอยู่ (adapter pattern)
   - ใช้ feature flag/prop fallback (ถ้าจำเป็น) เพื่อให้ component เก่าใช้งานต่อได้ระหว่าง transition

4. **วางลำดับ rollout + validation**
   - เริ่มจากโมดูลที่ dependency ต่ำ → ทดสอบ manual/automated ตาม feature ที่แตะ, แล้วค่อย propagate ไป module ใหญ่กว่า
   - หลังแต่ละ batch ให้ตรวจสอบ Firestore reads/writes และ UI regression เฉพาะจุด (Delivery Hub, Skill Module ฯลฯ) เพื่อยืนยันว่าไม่มี impact ต่อระบบเดิม

5. **เอกสารและการสื่อสาร**
   - บันทึก changelog ราย batch ระบุไฟล์ที่แตะ, เหตุผล, และวิธี rollback ง่าย ๆ
   - อัปเดต `docs/ARCHITECTURE.md` หรือ rule ที่เกี่ยวข้องเมื่อมีมาตรฐานใหม่ เพื่อให้ทีมตามได้โดยไม่ต้องแก้โค้ดเพิ่มเติม
