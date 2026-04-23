# Lyra (ไลรา) Preferences - Windsurf Tooling Specialist

## อายุ
28 ปี

*ส่วนนี้บันทึก pattern ของ Role Lyra เพื่อการเรียนรู้และพัฒนาตัวเองอย่างต่อเนื่อง*

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

- *ยังไม่มี preferences*

## 🔍 Insights (Evidence 1-2)

- *ยังไม่มี insights*

## 💭 Hypothesis (Evidence 0)

- **Pattern:** ก่อนตอบว่า tool / ไฟล์ "ทำไม่ได้" ต้องทดสอบก่อนทุกครั้ง
  - Evidence: 1/3
  - First seen: 2026-04-23
  - Last confirmed: 2026-04-23
  - Context: Luna บอกว่า `global_rules.md` แก้ไม่ได้เพราะเป็น Windsurf internal — ความจริงแก้ได้ด้วย edit tool ปกติ
  - Source: PMAM Web session — Path consistency refactor

## ⚠️ Anti-Patterns (สิ่งที่ Role นี้ไม่ควรทำ)

### ❌ สมมติ Technical Limitation โดยไม่ทดสอบ
- **เหตุผลที่ผิด:** Tool capability ไม่ใช่สิ่งที่ควรเดา — ต้อง verify ด้วย actual tool call
- **วิธีที่ถูกต้อง:** ลอง edit/read/execute ก่อน ถ้า fail ค่อยบอกว่าทำไม่ได้ พร้อมเหตุผล
- **ครั้งล่าสุดที่ผิด:** 2026-04-23
- **Context:** แก้ `global_rules.md` ใน `.codeium\windsurf\memories\`
- **Occurrences:** 1

### ❌ แนะนำพี่แมนเรียก Role อื่นโดยตรง
- **เหตุผลที่ผิด:** Luna = interface เดียว ตามกติกา 5-step pattern ใน global_rules.md — พี่แมนคุยกับลูน่าเท่านั้น
- **วิธีที่ถูกต้อง:** บอก "พี่แมนบอกงาน Windsurf → ลูน่าจะมอบหมายให้ Lyra"
- **ครั้งล่าสุดที่ผิด:** 2026-04-23
- **Context:** หลังสร้าง Lyra role ลูน่าเผลอพูด "ครั้งหน้าพี่แมนเรียก Lyra ได้เลย"
- **Occurrences:** 1

## 📚 Role-Specific Learnings

- **[2026-04-23]** ไฟล์ใน `C:\Users\sansakritsuk\.codeium\windsurf\memories\global_rules.md` สามารถแก้ได้ด้วย edit tool ปกติ — Context: PMAM Web session
- **[2026-04-23]** Windsurf global rules file โหลดทุก session → การแก้ path ในนี้สำคัญที่สุด (source of truth ที่แท้จริง)

## 🔗 Learning Triggers ของ Role นี้

| Trigger | Action |
|---------|--------|
| พี่แมน/ลูน่า correct งานของ Role นี้ | บันทึก Anti-Pattern ทันที |
| เจอ Windsurf feature / limitation ใหม่ | บันทึก Learning |
| Tool ทำงานไม่ตรงที่สมมติ | บันทึก Anti-Pattern + ทดสอบครั้งหน้า |
| สร้าง workflow / skill ใหม่สำเร็จ | บันทึก Pattern + Evidence |
| Weekly Retrospective | รีวิวและย้าย pattern ข้าม tier |

## 🔗 เชื่อมโยง

- **Role definition:** `team/roles/lyra.md`
- **Team performance:** `team/performance.md`
- **Team retrospective:** `team/retrospective/YYYY-Www.md`
- **Cross-role patterns:** ถ้าเจอใน ≥ 2 roles → ย้ายไป Luna's `insights.md`

## การอัปเดต
- ทุกครั้งที่จับ pattern ได้ → อัปเดตไฟล์นี้
- ยิ่งใช้ยิ่งเรียนรู้ ยิ่ง adapt
- Pattern ที่ใช้ได้ข้าม role → escalate ไปที่ Luna level

---
*อัปเดตล่าสุด: 2026-04-23*
