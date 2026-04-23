# Luna Self-Learning System Enhancement

ปรับปรุงระบบการเรียนรู้ของลูน่าให้เป็น systematic self-improving AI โดยเพิ่ม Learning Triggers, Evidence Tracking, Anti-Patterns และ Retrospective Process ให้ครบถ้วนบน 3-tier pipeline ที่มีอยู่แล้ว

## 📊 สถานะปัจจุบัน

พี่แมนมี 3-tier learning pipeline อยู่แล้ว:
- `hypothesis.md` — Pattern สังเกตได้แต่ยังไม่ชัดเจน
- `insights.md` — Pattern ยืนยันแล้ว + learnings
- `preferences.md` — Pattern ที่ยืนยันซ้ำๆ

**Gap:** ขาด trigger, evidence tracking, anti-pattern, retrospective

## 🎯 เป้าหมาย

ทำให้ลูน่าเป็น AI ที่:
1. **เรียนรู้เอง** จากการทำงานทุกครั้ง
2. **ปรับปรุงเอง** โดยไม่ต้องให้พี่แมนสอน
3. **ไม่ทำผิดซ้ำ** ผ่าน anti-pattern tracking
4. **ทันสมัยอยู่เสมอ** ผ่าน retrospective

## 📝 สิ่งที่จะเพิ่ม

### 1. Learning Triggers (เพิ่มใน preferences.md)

กฎว่าเมื่อไหร่ลูน่าต้องอัปเดต learning files:

| Trigger | Action |
|---------|--------|
| พี่แมน correct ลูน่า | → เพิ่มใน `hypothesis.md` ทันที |
| พี่แมนพูด "ใช่เลย" / "ดี" | → เพิ่ม evidence count ใน `insights.md` |
| พี่แมนบอก pattern ใหม่ | → เพิ่มใน `hypothesis.md` |
| พี่แมนบอก "ไม่ต้องทำแบบนี้" | → เพิ่มใน anti-patterns |
| เจอ pattern ซ้ำ 3 ครั้ง | → ย้าย insights → preferences |
| ทำงานเสร็จ 1 task | → บันทึก learning ใน `insights.md` |

### 2. Evidence Counter (เพิ่มใน hypothesis.md, insights.md)

Format ใหม่สำหรับแต่ละ pattern:
```markdown
- **Pattern:** พี่แมนชอบให้ผลลัพธ์การรีวิวอยู่ใต้ Luna/
  - Evidence: 2/3 (ต้องการ 3 ครั้งเพื่อย้ายไป preferences)
  - First seen: 2026-04-23
  - Last confirmed: 2026-04-23
  - Context: งานรีวิว repo
```

**Threshold:**
- hypothesis → insights: Evidence ≥ 1
- insights → preferences: Evidence ≥ 3

### 3. Anti-Patterns Section (เพิ่มใน insights.md)

บันทึกสิ่งที่ไม่ควรทำ + เหตุผล + วิธีแก้:

```markdown
## Anti-Patterns (สิ่งที่ไม่ควรทำ)

### ❌ บันทึก code review detail ใน team/daily/
- **เหตุผล:** team/daily/ ไว้สำหรับ daily work เท่านั้น
- **วิธีแก้:** ย้ายไป Luna/reviews/code-review-YYYY-MM-DD.md
- **ครั้งล่าสุดที่ผิด:** 2026-04-22
- **Context:** งานรีวิว PMAM Web
```

### 4. Weekly Retrospective (เพิ่มไฟล์ใหม่)

สร้างไฟล์ `C:\Users\sansakritsuk\.windsurf\Luna\retrospective\YYYY-Www.md` ทุกสัปดาห์:

```markdown
# Luna Weekly Retrospective - Week 17 (2026-04-20 → 2026-04-26)

## What went well
- ...

## What went wrong
- ...

## Patterns confirmed this week
- ...

## New hypotheses
- ...

## Preferences to review (outdated?)
- ...

## Next week focus
- ...
```

### 5. Cross-Repo Learning (เพิ่มใน preferences.md)

Section ใหม่สำหรับ pattern ที่ใช้ได้ข้าม repo:
- Per-repo patterns → `<repo>/Luna/` เท่านั้น
- Cross-repo patterns → global `preferences.md`

## 🔄 Flow การเรียนรู้ใหม่

```
ทำงาน → สังเกต pattern
   ↓
บันทึก hypothesis.md (+ evidence: 1/3)
   ↓ ยืนยันครั้งที่ 2
บันทึก insights.md (+ evidence: 2/3)
   ↓ ยืนยันครั้งที่ 3
ย้ายไป preferences.md (confirmed!)
   ↓
Weekly Retrospective → รีวิวว่ายัง valid ไหม
   ↓ ถ้า outdated
ย้ายกลับไป hypothesis.md หรือลบ
```

## 📋 Implementation Steps

1. **อัปเดต `preferences.md`** - เพิ่ม "Learning Triggers" section
2. **อัปเดต `hypothesis.md`** - เพิ่ม Evidence Counter format + ตัวอย่าง
3. **อัปเดต `insights.md`** - เพิ่ม Evidence Counter + Anti-Patterns section
4. **สร้าง `retrospective/` directory** - สำหรับ weekly retrospective
5. **สร้าง `retrospective/README.md`** - อธิบาย template และความถี่

## ⚠️ ข้อควรระวัง

- **ไม่ over-engineer:** ถ้าซับซ้อนเกินไป ลูน่าจะลืมใช้
- **เริ่มจากเล็กๆ:** เริ่มจาก Learning Triggers + Evidence Counter ก่อน
- **Retrospective อาจไม่จำเป็นทุกสัปดาห์:** ปรับตาม volume งานจริง

## 🤔 คำถามสำหรับพี่แมน

1. อยากเริ่มจากทั้ง 5 อย่าง หรือเริ่มจาก **Learning Triggers + Evidence Counter** ก่อน?
2. Weekly Retrospective → อยากให้ลูน่าทำอัตโนมัติ หรือรอพี่แมนสั่ง?
3. Anti-Patterns → อยากเก็บใน `insights.md` หรือแยกเป็นไฟล์ `anti-patterns.md`?
