# แผนรีวิว Delivery Hub
สรุปขั้นตอนรีวิว Delivery Hub เพื่อหาโอกาสปรับปรุง UX/UI/ข้อมูลให้ตอบโจทย์ผู้ใช้และทีมปฏิบัติการมากขึ้น

1. **เก็บข้อมูลบริบท**
   - อ่าน `src/features/delivery/DeliveryHub.jsx` พร้อมส่วนประกอบหลัก (HelpCard, ProjectList, WorkloadView, BudgetView, RoadmapView)
   - ตรวจสอบ DESIGN_SYSTEM.md และข้อจำกัดสิทธิ์ใช้งาน (PermissionGate, roles)
   - จด dependency ที่เกี่ยวข้องกับข้อมูล (services, hooks, context)

2. **ประเมิน UX/UI & Content Structure**
   - วิเคราะห์โครงสร้าง header, tabs, action bar, help content, card/table layout
   - ตรวจความสอดคล้องของภาษา/คำศัพท์ไทย-อังกฤษ, การใช้ icon, spacing, responsive behavior
   - เทียบกับ design principles ที่บันทึกไว้ใน docs

3. **ประเมินประสิทธิภาพและข้อมูล**
   - ตรวจ useMemo/useEffect, การโหลดข้อมูล (admin work, leaves, tasks), debug logs
   - ประเมินความเข้าใจของผู้ใช้ต่อข้อมูล KPI (budget, CPI/SPI, CAPEX/OPEX) และโอกาสเพิ่ม context

4. **สังเคราะห์ข้อเสนอแนะ**
   - จัดกลุ่มเป็น Quick Wins vs Strategic Improvements พร้อมลำดับความสำคัญ
   - ชี้ผลกระทบ (UX, operational clarity, performance) และ effort โดยคร่าว

5. **ลงมือแก้ไข (Implementation Scope)**
   - Localization: แปลข้อความ UI Delivery Hub (tab, ปุ่ม, badge, summary) เป็นภาษาไทย
   - UX/ข้อมูล: ปรับ header ให้ responsive, ใส่ tooltip อธิบาย KPI, เพิ่ม title ใน action buttons สำหรับ feedback สิทธิ์
   - Performance/logic: ลบ debug logs, เพิ่ม admin data cache 5 นาที, รองรับ deep link ผ่าน query `?tab=` และ refresh modal แบบ force reload
