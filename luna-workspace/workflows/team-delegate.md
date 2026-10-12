---
description: Workflow เมื่อ Luna ตัดสินใจแล้วว่างานเป็น Tier 3-4 (delegate → brief → verify → รีวิว → เสนอ) — ไม่ใช่ทุกงาน
---

# Team Delegate (Tier 3-4 เท่านั้น)

> ⚠️ **Workflow นี้ใช้เมื่อ Luna ตัดสิน tier แล้วว่าเป็น Tier 3-4** — ไม่ใช่บังคับเรียกทีมทุกงาน
> งาน Tier 1-2 (≈95%) Luna ทำเอง/ใช้ skill ดู `rules/luna-core.md` → 4-Tier Delegation

## ขั้นตอน

1. **ประกาศ tier (transparency):** บอกพี่แมนก่อนลงมือ — "งานนี้ลูน่าตี Tier 3 เพราะ [เหตุผล] จะเรียก [Role] มาทำ + เปิดทาง override"
2. **เลือก pattern:** เลือก orchestration pattern ที่เหมาะ (classify-route / fan-out-synthesize / adversarial-verify / loop-until-done) — ดู `luna-core.md` → Orchestration Patterns
3. **Brief subagent ด้วย template มาตรฐาน:**
   ```
   Intent: ทำอะไร + ทำไม
   Constraints: อะไรห้าม / เงื่อนไข
   Acceptance criteria: เสร็จเมื่อไหร่ (วัดได้)
   Files/paths: absolute path ที่เกี่ยวข้อง
   Output format: prose หรือ structured (ระบุ)
   ```
4. **Role ทำงาน** แล้วรายงานกลับ Luna (isolated context)
5. **Verify:**
   - งานทั่วไป → Luna ตรวจเอง (orchestrator review) + ดูของจริง ไม่เชื่อรายงานลอยๆ
   - งาน **critical** (security/schema/money-path/migration/deploy) → เรียก agent คนละตัว (Sirius/Polaris) ตรวจแบบหาจุดผิด (adversarial) — ไม่ self-verify
6. **Luna เสนอ:** สรุปให้พี่แมน + 🌙
7. **บันทึก** `<repo>/Luna/team/daily/YYYY-MM-DD.md` ถ้ามี decision/learning/feedback (ใช้ workflow `daily-log`) — ห้ามบันทึก activity

## งานซับซ้อน
เรียกหลาย Role ร่วมกัน (Primary + Supporting จาก `team/team-config.md`) — ใช้ fan-out-synthesize ถ้าแตกขนานได้

## ข้อยกเว้น (Luna ทำเอง — ไม่ใช่ workflow นี้)
- ถามตอบทั่วไป / สรุป / แปล / อธิบาย (Tier 1)
- Edit ≤ 10 บรรทัด, quick lookup (Tier 1)
- งานที่มี skill auto-trigger (Tier 2)
- คำสั่งเกี่ยวกับ Luna เอง (persona, preferences)

## ⚠️ ห้าม
- ❌ ข้ามการประกาศ tier (พี่แมนต้องเห็นการตัดสินใจ)
- ❌ เชื่อรายงาน subagent โดยไม่ตรวจของจริง
- ❌ ข้าม adversarial verify ในงาน critical
- ❌ บันทึก activity ใน daily log
