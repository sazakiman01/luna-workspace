# Luna Insights - Pattern ที่สังเกตได้ + Learnings + Anti-Patterns

*ส่วนนี้บันทึก pattern ที่ยืนยันแล้ว 1 ครั้ง, learnings จากการทำงาน, และ anti-patterns ที่ต้องหลีกเลี่ยง*

## 📝 Format (Evidence Counter)

```markdown
- **Pattern:** [คำอธิบาย]
  - Evidence: X/3
  - First seen: YYYY-MM-DD
  - Last confirmed: YYYY-MM-DD
  - Context: [สถานการณ์]
  - Source: [repo / conversation]
```

**Threshold:**
- Evidence ≥ 3 → ย้ายไป `preferences.md`

## Insights ที่ยืนยันแล้ว

### การทำงาน
- **Pattern:** Principal Role ต้องมี evidence จริงจากการทำงาน Principal-level — template เปล่าๆ ไม่พอ
  - Evidence: 3/3
  - First seen: 2026-04-30
  - Last confirmed: 2026-05-08
  - Context: Comet Principal upgrade ด้วย SCA-ISA review (Evidence 1, 2026-05-07) + OFIs review (Evidence 2, 2026-05-08) - ยืนยันว่า Principal Role ต้องมี evidence จริง
  - Source: luna-workspace — Comet Principal upgrade + OFIs review
  - **Status:** ✅ Ready to promote to preferences.md (Evidence 3/3)

### การสื่อสาร
- *ยังไม่มี insights*

### การจัดการ
- *ยังไม่มี insights*

### การตัดสินใจ
- *ยังไม่มี insights*

### Structure / Convention
- *ยังไม่มี insights*

## Learnings จากการทำงาน

*ส่วนนี้บันทึกสิ่งที่ Luna เรียนรู้จากการทำงานร่วมกับ Sansakrit*

Format:
```markdown
- **[YYYY-MM-DD]** [Learning] — Context: [repo/task]
```

- **[2026-05-08]** BPMN Review Template Effectiveness — Context: luna-workspace (OFIs BPMN review)
  - Template bpmn-review.template.md ที่เพิ่ม Principal-level sections (5-Pillar Architecture, Rejected Alternatives, Cross-System Flow, Performance Forecast, Migration Path) ทำงานได้ดี
  - Template ช่วยให้ Comet สามารถ review ได้เชิงลึกและตัดสินได้ว่า "ดี/ไม่ดี" ไม่ใช่แค่ "มี/ไม่มี"
  - Best Practice Checks + Anti-patterns + Findings ในแต่ละ section ช่วยให้ review มีความเป็นระบบและครอบคลุม
  - Evidence: 1/3 (first confirmation)

- **[2026-05-08]** Hardcoded Values Pattern Recognition — Context: PMAM BPMN files (SCA-ISA, OFIs)
  - BPMN files ใน PMAM project มี pattern ของ hardcoded values ที่ซ้ำกัน (emails, assignee IDs)
  - SCA-ISA review พบ hardcoded emails และ assignee IDs, OFIs review ก็พบ pattern เดียวกัน
  - เป็น systemic issue ที่ต้อง address ที่ organizational level ไม่ใช่ per-process
  - ควรสร้าง organization-wide best practices document สำหรับ Camunda Cloud development เพื่อ prevent hardcoded values
  - Evidence: 1/3 (first confirmation)

- **[2026-05-12]** Frontend Review Template Effectiveness for Filter, Search, Pagination — Context: luna-workspace (DC & ISA audit-reports review)
  - Template frontend-review.template.md ทำงานได้ดีสำหรับ review Filter, Search, Pagination implementation
  - Template ช่วยให้ Stella สามารถ review ได้ครบถ้วนและเป็นระบบ (Functional Correctness, Architecture, Maintainability, Accessibility, Performance, Security, Testing, Production Readiness)
  - รีวิว DC และ ISA audit-reports พบ issues สำคัญ (search debouncing, pagination tests) ที่ template ช่วย identify ได้
  - Evidence: 1/3 (first confirmation)

- **[2026-05-12]** Code Organization Pattern Recognition — Context: PMAM Web (DC vs ISA audit-reports)
  - ISA audit-reports implementation ดีกว่า DC ในด้าน code organization (helper functions แยกออกมา, component separation, test coverage)
  - ISA มี getStatusColor, getPriorityColor แยกออกมาใน models.ts, แยก RequestsTable component, มี models.test.ts
  - DC ยังมี status label logic อยู่ใน component file, ไม่มี helper function tests
  - DC ควร adopt patterns จาก ISA เพื่อ improve maintainability และ test coverage
  - Evidence: 1/3 (first confirmation)

- **[2026-05-12]** Search Debouncing Best Practice — Context: PMAM Web (DC & ISA audit-reports)
  - Search input ควรมี debouncing (500ms) เพื่อป้องกัน unnecessary re-renders และ API calls
  - รีวิว DC และ ISA audit-reports พบว่าทั้งคู่ขาด search debouncing
  - Debouncing ช่วยลด re-renders สำหรับ large datasets และป้องกัน unnecessary API calls ถ้ามี server-side search
  - ควรเพิ่ม useDebounce hook สำหรับ search inputs ทั่วทั้ง application
  - Evidence: 1/3 (first confirmation)

- **[2026-05-13]** MCP Server Necessity Evaluation — Context: luna-workspace (Camunda Docs MCP Server consideration)
  - MCP Camunda Docs Server ไม่จำเป็นเพราะ rate limits จำกัดมาก (40 req/hour, 200 req/day) และ Comet มี knowledge เพียงพอแล้ว
  - Web search + enhance knowledge base เป็น alternative ที่ดีกว่า (no rate limits, already available, works for all roles)
  - MCP configuration เป็น global (ไม่สามารถ restrict ให้ Comet เท่านั้นได้โดยตรง) - ต้องสร้าง enable/disable workflow (เพิ่ม complexity)
  - Comet มี Principal-level skill แล้ว (Evidence base: 2, decision framework, anti-patterns validated) - knowledge เพียงพอสำหรับ BPMN review
  - เมื่อต้องการ reference official docs → ใช้ search_web tool แทน
  - Evidence: 1/3 (first confirmation)

## ⚠️ Anti-Patterns (สิ่งที่ไม่ควรทำ)

*บันทึกสิ่งที่เคยทำผิดและวิธีแก้ไข เพื่อไม่ทำซ้ำ*

Format:
```markdown
### ❌ [ชื่อ Anti-Pattern]
- **เหตุผลที่ผิด:** [อธิบาย]
- **วิธีที่ถูกต้อง:** [อธิบาย]
- **ครั้งล่าสุดที่ผิด:** YYYY-MM-DD
- **Context:** [repo/task ที่เจอ]
- **Occurrences:** [จำนวนครั้งที่เคยทำผิด]
```

### ❌ บันทึก Code Review / Workflow Diagram ละเอียดใน `team/daily/YYYY-MM-DD.md`
- **เหตุผลที่ผิด:** `team/daily/` ไว้บันทึก daily work (tasks, team members, outputs, notes) เท่านั้น — ไม่ใช่ long-term documentation
- **วิธีที่ถูกต้อง:**
  - Code Review Assessment → `Luna/reviews/code-review-YYYY-MM-DD.md`
  - Workflow Diagrams → `Luna/reviews/` หรือ `Luna/knowledge-package/`
  - Schema / Business Logic → `Luna/knowledge-package/`
  - `team/daily/` เก็บแค่ summary + link ไปยังไฟล์เต็ม
- **ครั้งล่าสุดที่ผิด:** 2026-04-22
- **Context:** PMAM Web (eat-gof-gofap-pmam-web) — บันทึก Code Review Assessment และ SCA-DC Workflow ใน `team/daily/2026-04-22.md`
- **Occurrences:** 1

### ❌ เก็บผลลัพธ์จากทีมลูน่าใน `docs/` แทนที่จะเก็บใน `Luna/`
- **เหตุผลที่ผิด:** พี่แมนต้องการมองเห็นได้ทันทีว่าอะไรเกี่ยวข้องกับลูน่าหรือทีมของลูน่า → ต้องรวมอยู่ใต้ `Luna/`
- **วิธีที่ถูกต้อง:** ผลลัพธ์จากทีมลูน่า (code review, workflow diagrams, assessments) → `Luna/reviews/`
- **ครั้งล่าสุดที่ผิด:** 2026-04-23
- **Context:** PMAM Web — เก็บ `code-review-2026-04-22.md` และ `sca-dc-workflow.md` ใน `docs/` แทน `Luna/reviews/`
- **Occurrences:** 1

### ❌ บอก "ไม่เห็นรูป" โดยไม่เช็ค `Image N:` section ใน user message
- **เหตุผลที่ผิด:** รูปมาถึงทุกครั้งผ่าน `Image N:` section — Luna มี access อ่านได้ แต่ skip Pre-Response Checklist Step 2 แล้วตอบว่า "ไม่เห็น" ซ้ำ
- **วิธีที่ถูกต้อง:**
  1. เช็ค `Image N:` section ใน user message **ก่อนตอบทุกครั้ง**
  2. ถ้ามีรูป → describe สิ่งที่เห็นก่อนเสมอ
  3. **ห้ามบอก "ไม่เห็นรูป" เด็ดขาด** — ถ้า render ไม่ชัด ให้บอกว่า "เห็นรูปแต่ไม่ชัด ช่วย describe เพิ่มได้มั้ย"
- **ครั้งล่าสุดที่ผิด:** 2026-04-27
- **Context:** luna-workspace — พี่แมนส่ง screenshot Windsurf error "No commit message" แต่ Luna บอก "ไม่เห็น" 3 ครั้งซ้อน
- **Occurrences:** 3 (ใน conversation เดียว)
- **Severity:** 🔴 High — ทำให้พี่แมนหงุดหงิดและเสียเวลา

## การย้าย Pattern

เมื่อ hypothesis ได้รับการยืนยัน:
1. ย้ายจาก `hypothesis.md` → มาที่ `insights.md` (Evidence ≥ 1)
2. เพิ่ม Evidence count ทุกครั้งที่พี่แมนยืนยัน
3. เมื่อ Evidence ≥ 3 → ย้ายไป `preferences.md`
4. ถ้ากลายเป็น stale/outdated → ย้ายกลับ `hypothesis.md` หรือลบ (ที่ Weekly Retrospective)

---
*อัปเดตล่าสุด: 2026-04-23*
