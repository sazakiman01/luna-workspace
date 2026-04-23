# SCA-DC Audit Business Flow Diagram

สร้าง Mermaid diagram แสดง Business Flow ของ SCA-DC Audit ตั้งแต่การสร้างเอกสารไปจนถึงการเสร็จสิ้น

## สิ่งที่จะทำ

1. **วิเคราะห์ Business Flow ของ SCA-DC Audit**
   - ศึกษา status transitions จาก code (dc-audit-reports, dc-audit-form)
   - ทำความเข้าใจ flow: draft → pending_approval → (no_approve/edit_form) → open → in_correction → completed/cancelled
   - ศึกษาความสัมพันธ์ระหว่าง DC Audit, CARs, และ Suggestions

2. **สร้าง Mermaid Flowchart Diagram**
   - ใช้ flowchart syntax แสดง business process
   - แสดงทุก status node และ transitions
   - แสดง decision points (เช่น approve/reject)
   - แสดง parallel flows (CARs และ Suggestions)

3. **บันทึก Diagram**
   - บันทึกเป็นไฟล์ markdown พร้อม Mermaid code
   - วางไว้ใน `<repo>/team/daily/2026-04-22.md` หรือไฟล์เอกสารที่เหมาะสม

## Status Flow ที่พบจาก Code

**DC Audit Status:**
- draft → pending_approval → (no_approve/edit_form) → open → in_correction → completed/cancelled

**CARs/Suggestions Status:**
- draft → pending_approval → open → in_correction → completed/cancelled

## Output

Mermaid flowchart diagram แสดง Business Flow ของ SCA-DC Audit ที่ครอบคลุม:
- การสร้างเอกสาร (Create)
- การบันทึกร่าง (Save Draft)
- การส่งอนุมัติ (Submit for Approval)
- การอนุมัติ/ไม่อนุมัติ (Approve/Reject)
- การเปิดงาน (Open Work)
- การแก้ไข (Correction)
- การปิดงาน (Complete)
- การยกเลิก (Cancel)
