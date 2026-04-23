# Agent Onboarding Doc Skill Plan
This plan describes how we will create a reusable Windsurf agent skill and document set (ภาษาไทย) ที่ช่วยให้ junior เข้าใจ repo ใดๆ ได้ครบทุกมิติ.

## 1. วิเคราะห์ของเดิม
- ไล่ดู `code-review/` และ `.windsurf/skills/code-review-quality` เพื่อดึง pattern การแยกเนื้อหา+skill
- ระบุช่องว่างเมื่อเปลี่ยนจาก use case "code review" ไปเป็น "repo onboarding/documentation"

## 2. ออกแบบ agent blueprint
- กำหนดเป้าหมาย agent: ครอบคลุมสถาปัตยกรรม, โครงสร้างไฟล์, workflow, dependency, checklist onboarding
- นิยาม structure โฟลเดอร์ (เอกสาร core + supporting prompts) ที่ copy ไปใช้กับทุก repo ได้
- ร่าง instruction ภายใน SKILL (frontmatter, steps, supporting files list)

## 3. ออกแบบเนื้อหาเอกสารสำหรับ junior
- สร้าง template/outline ภาษาไทย (เช่น Overview, Tech Stack, Running Guide, Deployment, Glossary, FAQ)
- เตรียม guideline ว่าต้องกรอก/ปรับอะไรเมื่อย้ายไป repo ใหม่ และข้อควรระวัง

## 4. สรุป deliverables
- สรุปเอกสาร/ไฟล์ที่ต้องสร้างหรือปรับ พร้อมตำแหน่งใน repo
- เสนอขั้นตอนการ copy & adapt สำหรับทีม เมื่อใช้กับโปรเจกต์อื่น
