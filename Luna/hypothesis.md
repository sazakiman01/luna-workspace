# Luna Hypothesis - Pattern ที่ยังไม่ชัดเจน

*ส่วนนี้บันทึก pattern ที่สังเกตได้แต่ยังไม่ชัดเจน รอหลักฐานเพิ่ม*

## 📝 Format (Evidence Counter)

```markdown
- **Pattern:** [คำอธิบาย pattern]
  - Evidence: X/3
  - First seen: YYYY-MM-DD
  - Last confirmed: YYYY-MM-DD
  - Context: [สถานการณ์ที่เจอ]
  - Source: [repo / conversation]
```

**Threshold:**
- Evidence ≥ 1 → ย้ายไป `insights.md`
- Evidence ≥ 3 → ย้ายไป `preferences.md`

## Hypothesis ที่สังเกตได้

### การทำงาน
- *ยังไม่มี hypothesis*

### การสื่อสาร
- *ยังไม่มี hypothesis*

### การจัดการ
- *ยังไม่มี hypothesis*

### การตัดสินใจ
- ~~**Pattern:** ลูน่าไม่ควรสมมติว่า "ทำไม่ได้" โดยไม่ลองทดสอบก่อน~~ **→ PROMOTED to preferences.md (Evidence 3/3) on 2026-04-23**
- ~~**Pattern:** ลูน่าเป็น interface เดียว — ห้ามทำ domain งานเอง~~ **→ PROMOTED to preferences.md (Evidence 3/3) on 2026-04-23**

### Structure / Convention
- **Pattern:** พี่แมนไม่ชอบ hard-coded numbers / values ที่ต้อง maintain หลายที่ (เช่น "10 roles") → ชอบ reference ไปที่ Single Source of Truth
  - Evidence: 1/3
  - First seen: 2026-04-23
  - Last confirmed: 2026-04-23
  - Context: พี่แมนชี้ว่า "10 roles" ใน Luna/preferences.md ไม่ถูกต้องเพราะทีมขยายได้
  - Source: PMAM Web session — refactor Luna/team structure

### DevOps / Tools
- **Pattern:** Windsurf's commit message generator (UI "Generate" button) อาจ fail ด้วย error "no git diffs found" แม้ว่าไฟล์จะถูก `git add` แล้ว
  - Evidence: 1/3
  - First seen: 2026-04-23
  - Last confirmed: 2026-04-23
  - Context: พี่แมนลอง commit README.md ผ่าน Windsurf UI แต่ได้ error แม้ว่า git status แสดง staged changes
  - Workaround: ใช้ `git commit -m "message"` แบบ manual แทน
  - Source: luna-workspace — README.md update

## การยืนยัน Hypothesis

เมื่อได้หลักฐานเพิ่ม:
1. Review hypothesis ที่มีอยู่
2. เพิ่ม Evidence count + Last confirmed date
3. ถ้า Evidence ≥ 1 → ย้ายไป `insights.md`
4. ถ้า Evidence ≥ 3 → ย้ายไป `preferences.md`
5. ถ้าไม่ยืนยันภายใน 4 สัปดาห์ → ลบออก (ที่ Weekly Retrospective)

---
*อัปเดตล่าสุด: 2026-04-23*
