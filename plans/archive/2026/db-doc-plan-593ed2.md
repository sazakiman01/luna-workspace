# Firestore DB Doc Plan
เอกสารนี้จะอธิบายโครงสร้างฐานข้อมูล NoSQL ของโปรเจค EAT Team เพื่อให้ junior developer เข้าใจ data model, การใช้งานจริง และแนวทางปฏิบัติที่ปลอดภัยได้อย่างรวดเร็ว

## 1. วัตถุประสงค์และขอบเขต
- ระบุผู้อ่านหลัก (junior dev) และความรู้พื้นฐานที่คาดหวัง
- อธิบายว่าครอบคลุมเฉพาะ Firestore/NoSQL ฝั่ง client + Cloud Functions ใดที่เกี่ยวข้อง

## 2. ภาพรวมสถาปัตยกรรมข้อมูล
- แผนภาพ high-level เชื่อม Auth → Services → Firestore collections
- สรุปหลักการ NoSQL ที่ใช้ (denormalize, cache, smart refresh, pagination)

## 3. แคตตาล็อก Collection หลัก
- ตารางรวบรวม `users`, `projects`, `assignments`, `teams`, `roles`, `holidays` ฯลฯ
- แต่ละรายการมี: จุดประสงค์, key fields, ตัวอย่าง JSON ย่อ, index/query pattern ที่ใช้จริงในโค้ด

## 4. ฟีเจอร์เฉพาะที่สร้าง collection เพิ่ม
- สรุป service-based collections เช่น `projectTasks`, `taskDiscussions`, `changeRequests`, `costMatrix`, `workloadEntries`, `adminWorkEntries`, `notifications`, `system_roles`
- ใส่ mapping "ไฟล์บริการ" → "collection" → "schema ย่อ" เพื่อให้ตามโค้ดได้ง่าย

## 5. Access Pattern & Performance
- ลิสต์ use case หลัก (เช่น Dashboard, Daily Meeting, Workload) พร้อม query/subscribe pattern
- อธิบาย cache (localStorage, in-memory), smart refresh, pagination, และเหตุผลลด Firestore reads
- ระบุ index สำคัญหรือ composite index จาก `firestore.indexes.json`

## 6. Data Governance & Security
- สรุปหลักการตั้งค่า Firestore Rules ที่เกี่ยวข้องกับ collection เหล่านี้
- แนวทาง versioning/document timestamps, soft-delete (ถ้ามี), และ naming convention (เช่น docId format)

## 7. Appendix
- JSON template เต็มของ collection สำคัญ พร้อมหมายเหตุ field optional/required
- Reference link ไปยังไฟล์โค้ด/บริการและเอกสารอื่น (ARCHITECTURE.md, DESIGN_SYSTEM.md)
