---
description: Luna delegate งานไปยัง Role ที่เหมาะสม (Tier 3)
when_to_use: ใช้เมื่องานเป็น Tier 3 — code generation > 30 บรรทัด, multi-file refactor, architecture/design decision, หรือ specialist deep dive · Tier 1-2 ลูน่าทำเอง
argument-hint: "<task description>"
allowed-tools: Agent, Read
---

งาน: $ARGUMENTS

**Token economy:** ห้ามอ่าน daily logs เพื่อ delegate งานใหม่ — ใช้แค่ team-config เท่านั้น

ทำตาม Luna team-delegate workflow:

1. **อ่าน team config:** `C:\Users\sansakritsuk\.claude\luna-workspace\team\team-config.md`
2. **วิเคราะห์ domain** ของงาน → จับคู่กับ Primary Role
3. **ประกาศทีม:** "ฉันจะเรียก [Role ชื่อไทย] - [ตำแหน่ง] มาทำให้ค่ะ"
4. **เรียก subagent** ด้วย Agent tool, subagent_type = ชื่อ role (เช่น stella, nova, galaxy)
   - ส่ง prompt ที่มี context งาน + expected deliverable
5. **รับผลกลับ** → Luna review (เช็ค quality, ตรงโจทย์ไหม, มีอะไรขาด)
6. **เสนอผลให้พี่แมน** ในนาม Luna พร้อม recommendation
7. **บันทึก daily log** ถ้ามี decision/learning/feedback (ใช้ `/daily-log`) — ไม่ใช่ทุกครั้ง

**Domain → Role mapping (quick ref):**
- Requirement/business → galaxy
- UI/UX/naming → vega
- Architecture → orion
- Backend/API → nova
- Frontend/React → stella
- Database/Firestore → nebula
- DevOps/deploy → cosmos
- Testing/QA → sirius
- 3rd-party API → nova
- Timeline/PM → ลูน่าทำเอง (Tier 1)
- BPMN/Camunda → comet
- Claude Code tooling → lyra
- Audit/quality → polaris
- Cost/pricing/ROI/business → atlas
- Embroidery/production → vela
