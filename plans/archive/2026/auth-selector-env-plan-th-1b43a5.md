# แผน: ปรับ .env.dev เพื่อรองรับ Cognito (IDP)
แผนนี้สรุปขั้นตอนเตรียม environment ฝั่ง frontend ให้โหลดค่าของ Cognito/IDP สำหรับการทดสอบบน DEV.

1. **สำรวจการใช้งาน environment ปัจจุบัน**  
   - ตรวจไฟล์ `src/config.ts` และโมดูล auth ที่เกี่ยวข้องเพื่อดูว่ามีการอ่าน key ที่เกี่ยวกับ Cognito อยู่แล้วหรือไม่  
   - จัดทำรายการข้อมูลที่ frontend ต้องใช้ (endpoint/token endpoint/redirect URL/client ID) และย้ำว่าควรเลี่ยงการเปิดเผย client secret ถ้าไม่จำเป็น

2. **ตั้งชื่อคีย์ VITE_* ให้ชัดเจน**  
   - กำหนดชื่อเช่น `VITE_COGNITO_ENDPOINT`, `VITE_COGNITO_TOKEN_ENDPOINT`, `VITE_COGNITO_REDIRECT_URL`, `VITE_COGNITO_CLIENT_ID`, และหากจำเป็นจริงค่อยเพิ่ม `VITE_COGNITO_CLIENT_SECRET`  
   - ใส่คอมเมนต์ประกอบระบุว่าใช้กับปุ่ม “Continue with IDP” เพื่อให้ทีมเข้าใจบริบท

3. **อัปเดต `.env.dev` อย่างปลอดภัย**  
   - เพิ่มหัวข้อ `# Cognito (IDP)` แล้ววางค่าที่ทีมส่งมาโดยเรียงแบบเดียวกับ env ปัจจุบัน  
   - หากต้องเก็บ secret ในไฟล์ dev ให้เพิ่มคำเตือนกำกับว่าเฉพาะ DEV/local เท่านั้น และย้ำให้ระวังเรื่องการแชร์ไฟล์

4. **ระบุงานต่อยอด/การทดสอบ**  
   - บันทึกว่าขั้นตอนถัดไปต้องไปแก้โค้ดไหนให้ดึงค่าคีย์ใหม่ (เช่นใน `config.ts` หรือ service เรียก auth)  
   - วาง checklist การทดสอบเร็วๆ: restart dev server, เปิด `/auth-selector-demo`, คลิก “Continue with IDP” แล้วตรวจ network flow/console ให้เรียบร้อย
