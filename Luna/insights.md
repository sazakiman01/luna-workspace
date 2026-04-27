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
- *ยังไม่มี insights*

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

- *ยังไม่มี learnings*

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
