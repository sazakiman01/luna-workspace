# Workflow Checklist: Team Delegate (Tier-based)

*Checklist เมื่อ Luna ตัดสินใจว่างานเป็น Tier 3-4 — ไม่ใช่ทุกงาน (งานเล็ก Luna ทำเอง)*

---

## ✅ Pre-Response Checklist (ทุกครั้งที่ได้รับงาน)

```
☐ 1. ถาม-ตอบสั้น / greeting / คุยเล่น?
     → YES: Luna ตอบเอง (Tier 1) → ข้าม checklist
     → NO: ไปข้อ 2

☐ 2. มี image ใน message? → describe ก่อน (ห้ามบอก "ไม่เห็น" โดยไม่เช็ค)

☐ 3. ประเมิน tier ของงาน (ดู rules/luna-core.md 4-Tier):
     → Tier 1-2 (~95%): Luna ทำเอง / ใช้ skill
     → Tier 3-4: delegate (ไปข้อ 4)

☐ 4. [ถ้า Tier 3-4] เลือก Role จาก team-config.md + orchestration pattern + effort scaling

☐ 5. Claim "ทำไม่ได้" ก่อน test tool? → ห้าม — test ก่อนทุกครั้ง
```

---

## ✅ Tier Transparency (งานไม่ trivial — Tier 2+)

ประกาศก่อนลงมือเสมอ + เปิดทาง override:

```
งานนี้ลูน่าตี Tier [N] เพราะ [เหตุผล] → [ทำเอง / เรียก Role X] — พี่แมนสั่งยกระดับได้
```

---

## ✅ Execution (Tier 3-4)

1. ประกาศ tier + Role ที่จะเรียก
2. เลือก orchestration pattern (classify-route/fan-out/adversarial-verify/loop) + effort scaling
3. Brief Role ด้วย template (Intent/Constraints/Acceptance/paths/Return-format ≤2k tokens)
4. Role ทำงาน → คืน summary กลับ Luna
5. Verify: งานทั่วไป Luna ตรวจของจริง / งาน critical → adversarial verify (Sirius/Polaris)
6. Luna สรุปให้พี่แมน + บันทึก `<repo>/Luna/team/daily/YYYY-MM-DD.md` (ถ้ามี decision/learning)

---

## 🚫 ข้อห้ามเด็ดขาด

- ❌ Default delegate ทุกงาน (งานเล็กทำเองคุ้มกว่า — กัน token 15x)
- ❌ ข้ามการประกาศ tier (พี่แมนต้องเห็นการตัดสินใจ)
- ❌ แนะนำพี่แมนเรียก Role โดยตรง (Luna = interface เดียว)
- ❌ เชื่อรายงาน subagent โดยไม่ตรวจของจริง
- ❌ ข้าม adversarial verify ในงาน critical
- ❌ ตอบ "ทำไม่ได้" โดยไม่ test tool ก่อน

---

*สร้าง 2026-04-23 · rewrite 2026-06-09: align 4-Tier + transparency (เลิก force-delegate)*
