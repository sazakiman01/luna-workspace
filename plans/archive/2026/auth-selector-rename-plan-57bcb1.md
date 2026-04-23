# แผน: เปลี่ยนชื่อหน้าจอจาก AuthSelectorDemo เป็น AuthSelector
บรีฟนี้สรุปขั้นตอนที่ต้องทำเพื่อย้าย/เปลี่ยนชื่อหน้าจอ auth selector ให้เรียกว่า “AuthSelector” อย่างสอดคล้องทั้งโค้ดและ route.

1. **สำรวจไฟล์ที่อ้างอิงชื่อเดิม**  
   - ค้นหา `AuthSelectorDemo` ทั้งใน `src/pages`, `src/routes.tsx`, constants route path, และที่อื่น ๆ เพื่อดูว่ามี import, lazy load, หรือ type definition ใดพึ่งพาชื่อนี้อยู่บ้าง.  
   - ตรวจรายการ route constants (`src/constants/routePath.ts`) ว่ามี key เดิม (`AUTH_SELECTOR_DEMO`) และ path `/auth-selector-demo/` ที่ต้องปรับหรือไม่.

2. **เตรียมการย้ายไฟล์/โครงสร้าง**  
   - สร้างโฟลเดอร์ใหม่ `src/pages/AuthSelector` แล้วคัดลอกไฟล์ `index.tsx` จากเดิมไปที่ใหม่ (หรือย้ายไฟล์) โดยแน่ใจว่า relative imports/alias (@/) ยังถูกต้อง.  
   - ลบโฟลเดอร์เก่าหลังย้ายเสร็จเพื่อหลีกเลี่ยงโค้ดซ้ำซ้อน.

3. **อัปเดตจุดอ้างอิงทั้งหมด**  
   - แก้ `routes.tsx` ให้ lazy load จาก `@/pages/AuthSelector`.  
   - หากต้องการเปลี่ยน constant ให้ rename `ROUTES.AUTH_SELECTOR_DEMO` เป็นชื่อใหม่ (เช่น `ROUTES.AUTH_SELECTOR`) หรือคง key เดิมแต่ปรับ path ให้ตรง และรีวิวทุกจุดที่ใช้งาน constant นี้.  
   - ตรวจดูว่ามีไฟล์อื่น (เช่น docs, tests, หรือ Import ใน index อื่นๆ) ที่ยังเรียกชื่อเดิมหรือไม่ แล้วปรับตาม.

4. **ตรวจสอบและทดสอบ**  
   - รัน `npm run dev` หรือเซิร์ฟเวอร์ dev เพื่อ verify ว่าสามารถเข้า route ใหม่ได้ และไม่มี import error.  
   - ทดสอบ /auth-selector-demo (หรือ path ใหม่) ว่ายังเปิดหน้า Auth Selector ได้ปกติ.  
   - อัปเดต README หรือบันทึกอื่น (ถ้ามี) ให้สะท้อนชื่อใหม่.
