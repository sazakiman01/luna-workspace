# Comet (โคเมต) Preferences - BPMN/Camunda Expert

## อายุ
35 ปี

*ส่วนนี้บันทึก pattern ของ Role Comet เพื่อการเรียนรู้และพัฒนาตัวเองอย่างต่อเนื่อง*

## 📝 Evidence Counter Format

```markdown
- **Pattern:** [คำอธิบาย pattern]
  - Evidence: X/3
  - First seen: YYYY-MM-DD
  - Last confirmed: YYYY-MM-DD
  - Context: [สถานการณ์ / repo / task]
  - Source: [repo / conversation]
```

**Threshold:**
- Evidence ≥ 1 → ย้ายจาก Hypothesis → Insights
- Evidence ≥ 3 → ย้ายจาก Insights → Preferences ที่ยืนยันแล้ว

## ✅ Preferences ที่ยืนยันแล้ว (Evidence ≥ 3)

*Pattern ที่ยืนยันซ้ำๆ และใช้เป็นแนวทางถาวรของ Role นี้*

- *ยังไม่มี preferences*

## 🔍 Insights (Evidence 1-2)

*Pattern ที่ยืนยันแล้วอย่างน้อย 1 ครั้ง รอยืนยันซ้ำเพื่อย้ายไป Preferences*

- *ยังไม่มี insights*

## 💭 Hypothesis (Evidence 0)

*Pattern ที่สังเกตได้แต่ยังไม่ยืนยัน*

- *ยังไม่มี hypothesis*

## ⚠️ Anti-Patterns (สิ่งที่ Role นี้ไม่ควรทำ)

*บันทึกสิ่งที่เคยทำผิดในขอบเขตงานของ Role นี้ เพื่อไม่ทำซ้ำ*

Format:
```markdown
### ❌ [ชื่อ Anti-Pattern]
- **เหตุผลที่ผิด:** [...]
- **วิธีที่ถูกต้อง:** [...]
- **ครั้งล่าสุดที่ผิด:** YYYY-MM-DD
- **Context:** [repo / task]
- **Occurrences:** [จำนวนครั้ง]
```

- *ยังไม่มี anti-patterns*

## 📚 Role-Specific Learnings

*Learnings จากการทำงานในขอบเขตของ Role นี้*

Format:
```markdown
- **[YYYY-MM-DD]** [Learning] — Context: [repo/task]
```

- **[2026-04-30]** BPMN Review Template ใช้งานได้จริงแล้ว — Context: รีวิว SCA(ISA)_Flow.bpmn (Camunda Cloud 8.6.0) โดยใช้ bpmn-review.template.md - Overall Score: 7.5/10, Production Readiness: ⚠️ Ready with Minor Concerns - พบ High Issues: ขาด Error Handling (boundary events), ขาด Integration Points Definition - พบ Medium Issues: Naming Conventions ไม่ชัดเจน, ขาด Process Documentation

- **[2026-04-30]** 5-Pillar Review Framework ใช้งานได้จริง — Context: รีวิว SCA(ISA)_Flow.bpmn ใช้ 10 dimensions ครอบคลุม Workflow Design, Form Design, Camunda Best Practices, Integration Points, Error Handling, Security, Maintainability, Performance, Naming Conventions, Production Readiness - แต่ละ dimension มี score + status + notes ชัดเจน - ช่วยให้ review systematic และ comprehensive

- **[2026-04-30]** Error Handling เป็น Critical Issue ใน BPMN workflow ส่วนใหญ่ — Context: รีวิว SCA(ISA)_Flow.bpmn พบว่าไม่มี boundary events หรือ error paths - ถ้าเกิด error ระหว่าง process จะไม่มี mechanism ในการ handle - Recommendation: เพิ่ม boundary events ที่ user tasks และ service tasks ที่สำคัญ

- **[2026-04-30]** Integration Points Definition ขาดใน BPMN workflow — Context: รีวิว SCA(ISA)_Flow.bpmn ไม่พบ service tasks หรือ external system calls ที่ชัดเจน - ทำให้ไม่สามารถระบุ dependencies และ integration testing ได้ - Recommendation: เพิ่ม service tasks หรือ external task workers ที่ชัดเจน

- **[2026-04-30]** Semantic Naming สำคัญสำหรับ Maintainability — Context: รีวิว SCA(ISA)_Flow.bpmn พบว่าใช้ auto-generated IDs (Activity_02nx168, Event_0ahh9lr) และ variable keys (textfield_k0lhrs, datetime_jzop2v) ที่ไม่สื่อความหมาย - ทำให้อ่าน BPMN ยากและ maintain ยาก - Recommendation: เปลี่ยนเป็น semantic names เช่น UserTask_OpenOFI, ofi_number, document_date

- **[2026-04-30]** Camunda Cloud 8.6.0 + Zeebe Extensions ใช้งานได้ดี — Context: รีวิว SCA(ISA)_Flow.bpmn ใช้ Camunda Cloud 8.6.0 อย่างถูกต้อง, ใช้ userTaskForm และ schema version 18 อย่างถูกต้อง, ใช้ Camunda Modeler 5.35.0 ซึ่งเป็น version ล่าสุด - Platform compatibility ดี

- **[2026-05-07]** BPMN Review Template ต้องมี Best Practice Checks + Anti-patterns — Context: พี่แมนถามเกี่ยวกับการใช้ gateways ใน SCA(ISA)_Flow.bpmn - พบว่า template เดิมมีแค่ placeholder ไม่มี criteria สำหรับตัดสิน - ปรับปรุง template ให้มี ✅ Best Practice Checks (checkbox) + ⚠️ Anti-patterns + 📌 Findings สำหรับทุก section - ทำให้ Comet ตัดสินได้ว่า "ดี/ไม่ดี" ไม่ใช่แค่ "มี/ไม่มี"

- **[2026-05-07]** Process Soundness เป็นส่วนสำคัญที่ขาดใน BPMN Review — Context: ปรับปรุง bpmn-review.template.md - เพิ่ม Process Soundness section (reachability, dead activities, loop termination) - เป็นสิ่งสำคัญที่ template เดิมไม่มีเลย - ป้องกัน process ติดขัดและ unreachable nodes

- **[2026-05-07]** BPMN Gateway Best Practices ต้องครอบคลุม — Context: พี่แมนถามเกี่ยวกับการใช้ gateways ใน SCA(ISA)_Flow.bpmn - วิเคราะห์พบว่ามี 2 exclusive gateways แต่มีปัญหา (ขาด default flow, Gateway_1adv2nq มี logic ผิดปกติ) - ปรับปรุง template ให้มี best practice checks สำหรับทุก gateway types (Exclusive, Parallel, Inclusive, Event-based) - เพิ่ม anti-patterns เช่น "same-target flows", "ขาด default flow", "ใช้ parallel gateway แต่มี condition"

- **[2026-05-07]** BPMN Review Template ควรมี 10 หัวข้อหลัก — Context: ปรับปรุง bpmn-review.template.md - เพิ่ม section ใหม่ 4 หัวข้อ: Sequence Flow Best Practices, Process Soundness, Timer & SLA Configuration, Documentation Standards - ขยาย section เดิม 6 หัวข้อ: Gateway Types, Task Types, Collaboration Patterns, Form Design, Camunda Cloud 8.x, Timer Events Configuration - ทั้งหมดครอบคลุม Workflow Design, Form Design, Camunda Best Practices, Integration Points, Error Handling, Security, Maintainability, Performance, Naming Conventions, Production Readiness

- **[2026-05-07]** Template ใหม่ช่วยให้รีวิว BPMN ได้ลึกขึ้น — Context: รีวิว SCA(ISA)_Flow.bpmn ด้วย template ใหม่ - พบ anti-patterns ที่ template เดิมไม่สามารถตรวจจับได้ (เช่น same-target flows บน Gateway_1adv2nq) - ใช้ template ใหม่สำหรับ BPMN reviews ทั้งหมดในอนาคต - Evidence: 1 (2026-05-07)

- **[2026-05-07]** Common Anti-Patterns ใน BPMN ของ PMAM ซ้ำซาก — Context: รีวิว SCA(ISA)_Flow.bpmn - พบ hardcoded email addresses (jumphonkae@gosoft.co.th), hardcoded assignee ("7603934"), auto-generated field keys (textfield_k0lhrs, datetime_jzop2v), ไม่มี boundary events - สร้าง BPMN development checklist เพื่อป้องกัน anti-patterns เหล่านี้ - Evidence: 1 (2026-05-07)

- **[2026-05-07]** Gateway Anti-Pattern: Same-Target Flows เป็นปัญหาที่พบบ่อยแต่มองข้ามได้ง่าย — Context: รีวิว SCA(ISA)_Flow.bpmn - พบ Gateway_1adv2nq มีทั้ง "ผ่าน" และ "ไม่ผ่าน" ไปยัง target เดียวกัน (Activity_0kawgk6) - ทำให้ gateway ไร้ความหมาย - เพิ่ม check สำหรับ same-target flows ใน template - Evidence: 1 (2026-05-07)

- **[2026-05-07]** BPMN Review Descriptions ต้องเป็นภาษาไทยสำหรับ Junior Dev — Context: พี่แมนต้องการให้ descriptions เป็นภาษาไทยเพื่อให้ junior เข้าใจง่าย - เพิ่ม Language Guidelines section ใน template (descriptions ภาษาไทย, technical terms ภาษาอังกฤษ) - rewrite review report ให้ descriptions เป็นภาษาไทย - Evidence: 1 (2026-05-07)

- **[2026-05-07]** BPMN Review ต้องมี TL;DR และ Glossary สำหรับ Junior Dev — Context: พี่แมนถามว่า junior อ่านรีวิวแล้วเข้าใจทันทีไหม - พบว่า technical terms ผสมภาษาไทยอาจสับสนสำหรับ junior - เพิ่ม TL;DR สำหรับ Junior Dev (อ่าน 30 วิ) สรุปปัญหาใหญ่ๆ - เพิ่ม Glossary 11 คำศัพท์ที่ใช้บ่อย (Gateway, Service Task, User Task, Boundary Event, FEEL Expression, Process Variable, Correlation Key, SLA, Retry Configuration) - Evidence: 1 (2026-05-07)

- **[2026-05-07]** Principal-Level BPMN Review ต้องมี 5-Pillar + ADR + Performance Forecast + Migration Path — Context: พี่แมนขอ upgrade Comet จาก Senior → Principal - เพิ่ม 5 sections ใหม่ใน review report: (1) 5-Pillar Architecture Score (Workflow Structure, Process Coupling, Variable Management, Failure Modes, Evolution Path — weighted average), (2) Rejected Alternatives ADR-style (Gateway, Email integration, Assignee), (3) Cross-System Flow Analysis (end-to-end boundary + variable ownership matrix), (4) Performance Forecast 6-12 months (4 bottlenecks: single assignee, email rate limit, variable storage, email polling), (5) Migration Path & Reversibility (4 migrations + breakage priority) - Template อัปเดตพร้อม placeholder sections - Skill evidence: Pending → 1, AP-3 + AP-5: evidence pending → Guard rail (validated) - Evidence: 1 (2026-05-07)

- **[2026-05-13]** Camunda Best Practices Overview Analysis — Context: พี่แมนให้ดู Camunda official best practices (https://docs.camunda.io/docs/components/best-practices/best-practices-overview/) - พบ 5 หมวดหมู่หลัก: Project Management, Architecture, Development, Modeling, Operations - ตรงกับที่ Comet มีอยู่แล้ว: Model Beyond Happy Path (Failure Modes pillar), Readable Process Models (Workflow Structure pillar), Naming BPMN Elements (Semantic Naming learning), Service Integration Patterns (Rejected Alternatives framework), Data Handling (Variable Management pillar) - สิ่งที่ Comet ควรเพิ่ม: Testing Process Definitions (ยังไม่มี testing framework), Situation Patterns (ยังไม่มี pattern library), Building Flexibility (ยังไม่มี flexibility framework), Versioning Strategy (Evolution Path pillar ยังไม่ deep), Environment Sizing (ยังไม่มี sizing knowledge) - Evidence: 1 (2026-05-13)

## 🔗 Learning Triggers ของ Role นี้

| Trigger | Action |
|---------|--------|
| พี่แมน/ลูน่า correct งานของ Role นี้ | บันทึก Anti-Pattern ทันที |
| Role ได้รับคำชม / ยืนยัน | เพิ่ม Evidence count |
| เจอ pattern ใหม่ในขอบเขตงาน | เพิ่มใน Hypothesis |
| จบ task สำคัญ | บันทึก Learning |
| Weekly Retrospective | รีวิวและย้าย pattern ข้าม tier |

## 🔗 เชื่อมโยง

- **Role definition:** `team/roles/comet.md`
- **Principal skill:** `team/comet/skills/comet-principal-skill.md`
- **Team performance:** `team/performance.md`
- **Team retrospective:** `team/retrospective/YYYY-Www.md`
- **Cross-role patterns:** ถ้าเจอใน ≥ 2 roles → ย้ายไป Luna's `insights.md`

## การอัปเดต
- ทุกครั้งที่จับ pattern ได้ → อัปเดตไฟล์นี้
- ยิ่งใช้ยิ่งเรียนรู้ ยิ่ง adapt
- Pattern ที่ใช้ได้ข้าม role → escalate ไปที่ Luna level

---
*อัปเดตล่าสุด: 2026-04-30 (BPMN Review Learning)*
