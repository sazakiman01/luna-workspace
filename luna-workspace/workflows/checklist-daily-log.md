# Workflow Checklist: Decision Log

*Checklist สำหรับการบันทึก decision log — บันทึกเฉพาะ decisions/learnings/feedback*

---

## ✅ เกณฑ์การบันทึก (บังคับเฉพาะเมื่อมีสิ่งต่อไปนี้)

```
D1 — Decision ที่กระทบทีม/โครงสร้าง/tech stack
D2 — Learning ใหม่ (ค้นพบ limitation, pattern ที่ดีกว่า, ข้อเท็จจริงสำคัญ)
D3 — Feedback จากพี่แมน (correct, redirect, approve สิ่งสำคัญ)
D4 — จบ Tier 3-4 task ที่มี output/decision สำคัญ
```

ถ้าไม่มีสักอย่างข้างบน → ไม่ต้องบันทึก (ลด noise)

---

## 📝 Steps การบันทึก

```
1. ตรวจสอบว่ามี D1-D4 ไหม
   → ไม่มี: ข้ามได้เลย
   → มี: ไปข้อ 2

2. เปิด/สร้างไฟล์
   → Path: <repo>/Luna/team/daily/YYYY-MM-DD.md
   → ถ้าไม่มี: สร้างใหม่จาก template (luna-workspace/templates/daily-log.template.md)
   → ถ้ามี: append เนื้อหาใหม่

3. บันทึกเฉพาะ:
   → Decisions (อะไร + เหตุผล + ผลกระทบ)
   → Learnings (สิ่งที่ค้นพบ + context)
   → Feedback จากพี่แมน

4. Feedback จากพี่แมน → บันทึก auto memory ด้วย (type=feedback)
```

---

## 🚫 ห้ามบันทึก (Activity Log)

- ❌ "เรียก [Role] review [งาน]"
- ❌ "อ่านไฟล์ X / เขียนไฟล์ Y"
- ❌ "ทำ task Z เสร็จแล้ว"
- ❌ Performance metrics (tasks completed, commits count)

---

## ✅ ตัวอย่างที่ถูกต้อง

```markdown
## Decisions
### ใช้ Zustand แทน Redux
- **Decision:** เปลี่ยน state management จาก Redux เป็น Zustand
- **เหตุผล:** bundle size เล็กกว่า 40%, boilerplate น้อยกว่า, ทีมเรียนรู้เร็วกว่า
- **ผลกระทบ:** ต้อง migrate 3 store files

## Learnings
### LIFF iframe limitation
- **เรียนรู้:** LIFF iframe ไม่รองรับ postMessage cross-origin บน iOS Safari
- **Context:** ระหว่างทำ LINE integration feature
- **Action:** ใช้ LIFF.shareTargetPicker แทน

## Feedback จากพี่แมน
### ห้าม commit โดยไม่ถาม
- **Feedback:** พี่แมน correct ว่าห้าม commit โดยไม่ถามก่อน
- **Action:** บันทึก auto memory type=feedback แล้ว
```

---

## 🔗 Related Files

- `luna-workspace/templates/daily-log.template.md` — Decision log template
- `luna-workspace/rules/luna-core.md` — Decision log rules + criteria
- `luna-workspace/workflows/team-delegate.md` — Delegation workflow

---

*อัปเดต 2026-05-25: Phase 1 — เปลี่ยนจาก activity log เป็น decision log*
