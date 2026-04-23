# System Overview Draft Plan
แผนนี้สรุปขั้นตอนเพื่ออ่านโค้ด AuthContext/TeamContext และจัดทำไฟล์ `/docs/system-overview.md` ตามโครงสร้างที่ผู้ใช้กำหนด

1. รวบรวมข้อมูลจากโค้ด `src/contexts/AuthContext.jsx` และ `src/features/teams/TeamContext.jsx` พร้อมตรวจสอบไฟล์อ้างอิง (เช่น services/hook ที่เกี่ยวข้อง) เพื่อยืนยันพฤติกรรมหลัก: session, RBAC, team filtering, และ caching
2. จัดทำร่างหัวข้อทั้ง 4 หมวด (System Purpose, Core Architecture, Key Business Contexts, Directory Mapping) โดย map ข้อมูลเชิงสถาปัตยกรรมจากไฟล์ที่อ่านและบริบทที่มีอยู่ใน `.windsurfrules`, `ARCHITECTURE.md`, และ `DESIGN_SYSTEM.md`
3. หลังผู้ใช้ยืนยันแผน ให้เขียนเนื้อหาเต็มลง `docs/system-overview.md` ครอบคลุมรายละเอียดการทำงานของ AuthContext/TeamContext, เทคโนโลยีหลัก, และการแบ่งโฟลเดอร์ตาม Occam's Razor พร้อมตรวจทานความถูกต้อง
