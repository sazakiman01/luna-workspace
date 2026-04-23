# แผนแก้ไข AuthStatusNotice และ AuthProviderCard
แผนนี้สรุปขั้นตอนเพื่อป้องกัน `<p>` ว่างจาก AuthStatusNotice และเพิ่มตัวบ่งชี้สถานะโหลดให้ AuthProviderCard โดยไม่กระทบ UX เดิมของหน้าล็อกอิน.

## Scope
- ปรับ `AuthStatusNotice` ให้คืนค่า `null` เมื่อข้อความว่าง/มีแต่ช่องว่าง พร้อมรักษา `aria-live` สำหรับกรณีมีข้อความ
- ปรับ `AuthProviderCard` ให้มีตัวบ่งชี้สถานะโหลด (เช่น spinner + sr-only text) รวมถึงรักษาการจัดวางและการเข้าถึง

## Execution Steps
1. **Guard empty message ใน AuthStatusNotice**
   - อ่านการใช้งานทั้งหมด (เริ่มจาก `src/pages/AuthSelector/index.tsx`) เพื่อยืนยันว่าไม่มีเคสต้องการข้อความว่าง
   - เพิ่ม early return `null` เมื่อ `!message.trim()` และเก็บ className logic เดิมไว้ในบริบทที่ยังมีข้อความ
   - (ถ้ามี test) ปรับ snapshot/หน่วยทดสอบให้สอดคล้องกับพฤติกรรมใหม่

2. **เพิ่ม Loading Indicator ใน AuthProviderCard**
   - ระบุรูปแบบตัวบ่งชี้ (เช่น icon หมุนขนาดเล็กหรือ skeleton bubble) ที่ไม่รบกวน layout ปัจจุบัน
   - เมื่อ `isLoading` เป็น true: แสดง indicator คู่กับ action icon หรือแทน action icon, ปรับ `aria-live`/`aria-label` ให้บอกสถานะชัดเจน และคง `aria-busy`/`disabled`
   - ทวนสอบ visual state สำหรับ `isSelected + isLoading` ซ้อนกันเพื่อให้สีเส้นขอบ/เงายังคงถูกต้อง

## Validation
- ทดสอบ manual flow บนหน้า AuthSelector: เลือกทั้ง Cognito/Eko แล้วสังเกตข้อความสถานะและตัวบ่งชี้โหลด
- เช็ก Lighthouse/axe เฉพาะส่วนเพื่อยืนยันว่าไม่มี live-region ซ้ำซ้อนและปุ่มยังมี focus outline
- รัน unit tests (ถ้ามี) หรืออย่างน้อย `npm run test -- --runTestsByPath src/components/auth` เพื่อมั่นใจว่า snapshot ไม่พัง
