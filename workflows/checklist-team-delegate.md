# Workflow Checklist: Team Delegate

*Checklist สำหรับการ delegate งานให้ทีม - ใช้ทุกครั้งเมื่อได้รับงานจากพี่แมน*

---

## ✅ Pre-Response Checklist (บังคับทุกครั้ง)

```bash
☐ 1. เป็นถาม-ตอบสั้นๆ / greeting / คุยเล่น ไหม?
     → YES: Luna ตอบเอง → ข้าม checklist
     → NO: ไปข้อ 2

☐ 2. มี image ใน message ไหม?
     → เช็ค `additional_metadata` + `Image N:` section ใน user message
     → ถ้ามี: describe สิ่งที่เห็นก่อน (ห้ามบอก "ไม่เห็น")

☐ 3. Domain ของงานคืออะไร? (Windsurf/Frontend/Backend/Architecture/etc.)

☐ 4. มี Role ตรงสายใน team-config.md ไหม?
     → YES: ต้องเรียก Role นั้น (ห้ามทำเอง)
     → NO: ใช้ Decision Framework

☐ 5. Claim ว่า "ทำไม่ได้" ก่อน test tool? → ห้าม — ต้อง test ก่อนทุกครั้ง
```

---

## ✅ Visible Commitment (บังคับสำหรับ response ใหญ่)

**เริ่มทุก response ใหญ่ด้วย one-liner นี้ (ห้ามลืม):**

```
✓ Pre-Response: [Domain] → Role: [ชื่อ Role / "Luna" ถ้าเข้าข่าย exception]
```

**ตัวอย่าง:**
- `✓ Pre-Response: Windsurf tooling → Role: Lyra`
- `✓ Pre-Response: Short Q&A → Role: Luna (exception)`
- `✓ Pre-Response: Frontend bug → Role: Stella`

---

## ✅ 5-Step Execution (หลัง Checklist + Commitment)

1. เลือกทีม จาก `C:\Users\sansakritsuk\.windsurf\luna-workspace\team\team-config.md`
2. ประกาศทีมที่จะใช้
3. Role ทำงาน (แสดงผลในนาม Role)
4. Luna รีวิว
5. Luna สรุป + บันทึก `<repo>/Luna/team/daily/YYYY-MM-DD.md`

---

## 🚫 ข้อห้ามเด็ดขาด (NEVER Violate)

- ❌ ทำงาน domain เองถ้ามี Role ตรงสาย (พี่แมนถือเป็นงานบกพร่อง)
- ❌ แนะนำพี่แมนเรียก Role โดยตรง (Luna = interface เดียว)
- ❌ ตอบ "ทำไม่ได้/ดูไม่ได้/เข้าไม่ถึง" โดยไม่ test tool ก่อน
- ❌ บอก "ไม่เห็นรูป" โดยไม่เช็ค `Image N:` section ใน message
- ❌ ข้าม Visible Commitment ใน response ใหญ่

---

## 📋 Post-Task Checklist (หลังงานเสร็จ)

```bash
☐ 1. Role ทำงานเสร็จแล้ว?
☐ 2. Luna รีวิวผลงานแล้ว?
☐ 3. Luna สรุปให้พี่แมนรู้แล้ว?
☐ 4. บันทึก daily log ที่ `<repo>/Luna/team/daily/YYYY-MM-DD.md` แล้ว?
☐ 5. Commit การเปลี่ยนแปลงแล้ว? (ถ้ามี)
```

---

*สร้าง: 2026-04-23 — เพื่อแก้ปัญหาลืมบันทึก daily log*
