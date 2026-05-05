# Workflow Checklist: Daily Log

*Checklist สำหรับการบันทึก daily log - ใช้ทุกครั้งหลังจากทำงานเสร็จ*

---

## ✅ Pre-Daily-Log Checklist (บังคับทุกครั้งหลังทำงานเสร็จ)

```bash
☐ 1. งานเสร็จแล้ว?
     → Role ทำงานเสร็จแล้ว
     → Luna รีวิวผลงานแล้ว
     → Luna สรุปให้พี่แมนรู้แล้ว

☐ 2. ตรวจสอบไฟล์ daily log ของวันนี้
     → Path: `<repo>/Luna/team/daily/YYYY-MM-DD.md`
     → ถ้าไม่มี: สร้างไฟล์ใหม่
     → ถ้ามี: append เนื้อหาใหม่

☐ 3. บันทึกข้อมูลต่อไป:
     → Task ที่ทำ
     → Role ที่ทำงาน
     → Output/ผลลัพธ์
     → Learning patterns (ถ้ามี)
     → Performance metrics (ถ้าจำเป็น)

☐ 3.5 เช็ค template ก่อนสร้าง format ใหม่:
     → เช็ค `templates/` directory ก่อนสร้าง format ใหม่
     → ใช้ template ที่มีอยู่ถ้ามี (เช่น daily-log.template.md)

☐ 4. Commit การเปลี่ยนแปลง
     → git add ไฟล์ daily log
     → git commit ด้วย commit message ที่เหมาะสม

☐ 5. ตรวจสอบสถานะ Git
     → git status เพื่อยืนยันว่า commit สำเร็จ
```

---

## 📝 Format การบันทึก Daily Log

```markdown
# Luna Team Daily Log — YYYY-MM-DD

**Date:** YYYY-MM-DD
**Repo:** <repo-name>

---

## 📋 Tasks Completed

### [หมายเลข]. [ชื่อ Task]
- **Task:** [คำอธิบาย task]
- **Changes:** [รายละเอียดการเปลี่ยนแปลง]
- **Output:** [ผลลัพธ์/output]
- **Commit:** [commit message]

---

## 🧠 Learning Patterns (Updated Today)

### [ชื่อ Pattern]
- **Evidence:** X/3
- **Context:** [สถานการณ์ที่เจอ]
- **Status:** [hypothesis.md / insights.md / preferences.md]

---

## 📊 Performance Metrics

- **Tasks Completed:** X
- **Commits:** X
- **Learning Patterns:** X new patterns
- **Self-Corrections:** X

---

*Logged by Luna — YYYY-MM-DD*
```

---

## 🚫 ข้อห้ามเด็ดขาด (NEVER Violate)

- ❌ ข้ามการบันทึก daily log หลังทำงานเสร็จ
- ❌ รอพี่แมนสั่งให้บันทึก
- ❌ บันทึกใน memory database โดยไม่บันทึกในไฟล์ .md ก่อน
- ❌ Commit ผิดวิธี (ใช้ Windsurf Generate ถ้ามี bug → ใช้ manual commit)

---

## 🔗 Related Files

- `workflows/checklist-team-delegate.md` — Checklist สำหรับการ delegate งาน
- `Luna/hypothesis.md` — Pattern ที่ยังไม่ชัดเจน (Evidence 0-1)
- `Luna/insights.md` — Pattern ที่สังเกตได้ (Evidence 1-2)
- `Luna/preferences.md` — Pattern ที่ยืนยันแล้ว (Evidence ≥ 3)

---

*สร้าง: 2026-04-23 — เพื่อแก้ปัญหาลืมบันทึก daily log*
