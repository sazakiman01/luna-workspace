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

### Process / Workflow
- **Pattern:** ลูน่าลืมบันทึก daily log หลังทำงานเสร็จ (ตาม protocol ต้องบันทึก `<repo>/Luna/team/daily/YYYY-MM-DD.md` ทุกครั้ง)
  - Evidence: 2/3
  - First seen: 2026-04-23
  - Last confirmed: 2026-04-23
  - Context: พี่แมนถามว่าวันนี้ลูน่าทำอะไรไปบ้าง และตำหนิว่าทำไมไม่สร้าง daily log
  - Root Cause Analysis:
    - ไม่มี automated triggers ที่ชัดเจน (ต้องรอพี่แมนถามถึง)
    - Protocol ซับซ้อนเกินไป (หลาย tier, หลาย workflow)
    - ไม่มี checklist หรือ workflow visualization
    - ไม่มี regular retrospective เพื่อตรวจสอบ
  - Workaround: หลัง Role ทำงานเสร็จ → Luna รีวิว → Luna เสนอ + บันทึก daily log ทันที
  - Proposed Solutions:
    - สร้าง automated triggers ชัดเจนขึ้น (เช่น หลัง task complete → auto check daily log)
    - สร้าง checklist สำหรับ workflow สำคัญ (team-delegate, daily-log)
    - ทำ retrospective ประจำสัปดาห์เพื่อตรวจสอบ protocol compliance
  - Source: luna-workspace — daily log protocol violation

### Structure / Convention
- **Pattern:** พี่แมนไม่ชอบ hard-coded numbers / values ที่ต้อง maintain หลายที่ (เช่น "10 roles") → ชอบ reference ไปที่ Single Source of Truth
  - Evidence: 1/3
  - First seen: 2026-04-23
  - Last confirmed: 2026-04-23
  - Context: พี่แมนชี้ว่า "10 roles" ใน Luna/preferences.md ไม่ถูกต้องเพราะทีมขยายได้
  - Source: PMAM Web session — refactor Luna/team structure

### Content Generation
- **Pattern:** Mass-Generation Anti-Pattern — การสร้าง content (skills/knowledge/case-studies) ในรอบเดียว แบบ batch ทำให้ output เป็น generic boilerplate ที่ replicate กัน ขาด role identity / domain expertise
  - Evidence: 1/3
  - First seen: 2026-04-27
  - Last confirmed: 2026-04-27
  - Context: Luna mass-generated `*-principal-skill.md` ทุก role ในรอบเดียว → ทุกไฟล์ structure + boilerplate ซ้ำ ("Define X strategy", "Define X standards", TypeScript interfaces ซ้ำ)
  - Detection: Polaris baseline audit Finding C1 + C2 + C3 (audits/2026-W18-baseline-audit.md)
  - Proposed prevention:
    - สร้าง role-principal-skill template ที่บังคับ role-specific content (Phase 3 prerequisite, A7)
    - Rule ใหม่: "ห้าม mass-generate ในรอบเดียว — 1 role / 1 session, ต้องอ่าน role definition + preferences ก่อนเขียน"
  - Source: luna-workspace — daily-log 2026-04-27 + W17 retro escalation

### Team Utilization
- **Pattern:** Active rate ของทีมต่ำ — 7/12 roles (Nova, Nebula, Cosmos, Galaxy, Vega, Aurora, Pulsar) ไม่เคยถูกเรียกใช้เลย Luna อาจ default ไปที่ role ที่คุ้น (Lyra, Stella)
  - Evidence: 1/3
  - First seen: 2026-04-27
  - Last confirmed: 2026-04-27
  - Context: W17 retro พบ active rate 42% (5/12) — ต่ำกว่าครึ่งทีม
  - Hypothesis: Luna อาจไม่ scan team-config.md เต็มก่อนเลือก role
  - Proposed validation: Polaris audit role utilization ต่อสัปดาห์ — ถ้าเจอซ้ำ → promote
  - Source: team/retrospective/2026-W17.md (Pulsar)

### DevOps / Tools
- **Pattern:** Windsurf's commit message generator (UI "Generate" button) อาจ fail ด้วย error "no git diffs found" แม้ว่าไฟล์จะถูก `git add` แล้ว
  - Evidence: 2/3
  - First seen: 2026-04-23
  - Last confirmed: 2026-04-23
  - Context: 
    - ครั้งที่ 1: README.md (luna-workspace)
    - ครั้งที่ 2: hypothesis.md (luna-workspace) — เจอซ้ำอีก
  - Workaround: ใช้ `git commit -m "message"` แบบ manual แทน
  - Source: luna-workspace — README.md update, hypothesis.md update

## การยืนยัน Hypothesis

เมื่อได้หลักฐานเพิ่ม:
1. Review hypothesis ที่มีอยู่
2. เพิ่ม Evidence count + Last confirmed date
3. ถ้า Evidence ≥ 1 → ย้ายไป `insights.md`
4. ถ้า Evidence ≥ 3 → ย้ายไป `preferences.md`
5. ถ้าไม่ยืนยันภายใน 4 สัปดาห์ → ลบออก (ที่ Weekly Retrospective)

---
*อัปเดตล่าสุด: 2026-04-27 (W17 retro escalations: Mass-Generation, Team Utilization)*
