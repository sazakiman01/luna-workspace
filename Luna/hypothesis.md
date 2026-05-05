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
- **Pattern:** ลูน่าต้องเช็ค team-config.md เสมอก่อนทำงาน — ห้ามทำเองโดยไม่เรียก Role ถ้ามี Role ตรงสาย
  - Evidence: 2/3
  - First seen: 2026-04-30
  - Last confirmed: 2026-04-30
  - Context: พี่แมนขอให้สร้าง template รีวิว BPMN แต่ลูน่าตอบเองว่าสามารถรีวิวได้โดยไม่เช็ค team-config.md - พี่แมนตำหนิ: "เคสนี้ลูน่าห้ามทำงานเองสิ ลืมวิธีการทำงานแล้วหรอ"
  - Root Cause: ลืม Pre-Response Checklist Step 4 (มี Role ตรงสายใน team-config.md ไหม? → YES: ต้องเรียก Role นั้น)
  - Workaround: เช็ค team-config.md → เลือก Role → เรียกใช้ Role → ทำงานในนาม Role
  - Source: luna-workspace — BPMN template creation protocol violation

### การสื่อสาร
- **Pattern:** พี่แมนพิมพ์ "สวัสดีลูน่า" เพื่อส่งสัญญาณให้ลูน่าเริ่มทำงานแบบเต็มรูปแบบ (trigger START-OF-RESPONSE PROTOCOL ทั้งหมด)
  - Evidence: 1/3
  - First seen: 2026-05-04
  - Last confirmed: 2026-05-04
  - Context: พี่แมนถามว่า "สามารถตั้งได้มั้ย ถ้าทักว่า สวัสดีลูน่า ให้ทริกเกอร์หลักการณ์ทำงานของลูน่ามาทั้งหมด เป็นการส่งสัญญาณน่ะ"
  - Trigger Action: เมื่อได้รับ "สวัสดีลูน่า" → ลูน่าจะ:
    1. เริ่ม START-OF-RESPONSE PROTOCOL ทั้งหมด (Pre-Response Checklist + Visible Commitment + 5-Step Execution)
    2. เช็คว่าเป็น Q&A สั้นๆ หรืองานใหญ่
    3. เช็คว่ามี image ใน message หรือไม่
    4. วิเคราะห์ Domain ของงาน
    5. เช็ค team-config.md เลือก Role ที่เหมาะสม
    6. แสดง Visible Commitment: `✓ Pre-Response: [Domain] → Role: [ชื่อ Role / "Luna" ถ้าเข้าข่าย exception]`
  - Purpose: เป็นการส่งสัญญาณว่าพี่แมนต้องการให้ลูน่าทำงานแบบเป็นระบบเต็มรูปแบบ
  - Source: UniformFlow — Luna trigger keyword setup

- **Pattern:** ลูน่าควรเรียกทีมงานด้วยชื่อไทยแทนชื่ออังกฤษ — พี่แมนชอบ "ลูน่า" เพราะดูน่ารักและเป็นชื่อคน
  - Evidence: 1/3
  - First seen: 2026-04-30
  - Last confirmed: 2026-04-30
  - Context: พี่แมนบอกว่า "ต่อไปลูน่าจะเรียกทีมงานเป็นชื่อไทยเนอะ" หลังจากเปลี่ยนชื่อไทยของ Role ทั้งหมด
  - Examples:
    - เรียก "อริย" แทน "Orion"
    - เรียก "วิกา" แทน "Vega"
    - เรียก "กัลยา" แทน "Galaxy"
    - เรียก "นภา" แทน "Nebula"
    - เรียก "กสิณ" แทน "Cosmos"
    - เรียก "ศิริ" แทน "Sirius"
    - เรียก "อรุณ" แทน "Aurora"
  - Source: luna-workspace — team Thai name update

### การจัดการ
- *ยังไม่มี hypothesis*

### การตัดสินใจ
- ~~**Pattern:** ลูน่าไม่ควรสมมติว่า "ทำไม่ได้" โดยไม่ลองทดสอบก่อน~~ **→ PROMOTED to preferences.md (Evidence 3/3) on 2026-04-23**
- ~~**Pattern:** ลูน่าเป็น interface เดียว — ห้ามทำ domain งานเอง~~ **→ PROMOTED to preferences.md (Evidence 3/3) on 2026-04-23**

### Process / Workflow
- **Pattern:** ลูน่าลืมบันทึก daily log หลังทำงานเสร็จ (ตาม protocol ต้องบันทึก `<repo>/Luna/team/daily/YYYY-MM-DD.md` ทุกครั้ง)
  - Evidence: 3/3 **→ PROMOTED to preferences.md on 2026-04-28**
  - First seen: 2026-04-23
  - Last confirmed: 2026-04-28
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
  - Action Taken: เพิ่ม POST-RESPONSE PROTOCOL ใน Luna/skills/luna-principal-skill.md, อัปเดต team-config.md step 6
  - Source: luna-workspace — daily log protocol violation

- **Pattern:** ลูน่าไม่เช็ค templates directory ก่อนสร้าง format ใหม่ → ทำให้สร้าง daily log ยาวเกินไป
  - Evidence: 1/3
  - First seen: 2026-04-28
  - Last confirmed: 2026-04-28
  - Context: ลูน่าสร้าง daily log แบบละเอียดมาก โดยไม่รู้ว่ามี daily-log.template.md อยู่แล้ว
  - Root Cause: ไม่มี protocol ให้เช็ค templates directory ก่อนสร้าง format ใหม่
  - Workaround: เช็ค `templates/` directory ก่อนสร้าง format ใหม่ทุกครั้ง
  - Source: luna-workspace — daily log format issue

- **Pattern:** Review report naming convention ควรระบุ Round, Date, Time ในชื่อไฟล์
  - Evidence: 1/3
  - First seen: 2026-04-29
  - Last confirmed: 2026-04-29
  - Context: พี่แมนต้องการให้ชื่อไฟล์มี Round, Date, Time สำหรับ traceability
  - Naming convention: `[repo-name]-frontend-review-r[round]-YYYY-MM-DD-HHMM.md`
  - Review Time format: เปลี่ยนจาก range เป็น start time only
  - Source: luna-workspace — review report filename standardization

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

### Role Evidence Base
- **Pattern:** Principal Role ต้องมี evidence จริงจากการทำงาน Principal-level — template เปล่าๆ ไม่พอ
  - Evidence: 2/3
  - First seen: 2026-04-30
  - Last confirmed: 2026-04-30
  - Context: Polaris audit พบว่า Comet Principal Skill ไม่มี evidence จริง (6.5/10) - Comet รีวิว BPMN workflow จริงเสร็จแล้ว (Overall Score: 7.5/10)
  - Action: Principal Role ต้องทำงานจริงก่อนจึงจะยืนยันระดับ Principal ได้
  - Source: luna-workspace — Comet BPMN review evidence

### Template / Review Pattern
- **Pattern:** Backend API review template สามารถอ้างอิงจาก frontend template ได้ แต่ต้องปรับ dimensions ให้เหมาะกับ backend concerns (Database Design, Error Handling, Security vs Accessibility, UI components)
  - Evidence: 1/3
  - First seen: 2026-04-29
  - Last confirmed: 2026-04-29
  - Context: สร้าง backend-api-review.template.md จาก frontend-review.template.md
  - Key adjustments:
    - เปลี่ยน Accessibility → Database Design
    - เปลี่ยน UI Libraries → Framework-Specific (Go/Fiber, JWT/OAuth2)
    - เพิ่ม Production Readiness Checklist ที่เหมาะกับ backend (migrations, monitoring, health checks)
  - Source: luna-workspace — backend API review template creation

### Security Review Pattern
- **Pattern:** Security review สำหรับ backend API ต้องเน้น JWT parsing, SQL injection patterns, environment variables management เป็น priority สูง
  - Evidence: 1/3
  - First seen: 2026-04-29
  - Last confirmed: 2026-04-29
  - Context: รีวิว gosoft-thailand-eat-gof-gofap-pmam-api - พบ JWT ParseUnverified issue
  - Critical findings to look for:
    - JWT token parsing without signature verification
    - SQL string concatenation (fmt.Sprintf for queries)
    - Missing .env.example (environment variables documentation)
    - Hardcoded secrets in code
  - Source: luna-workspace — Go API security review

### Frontend Security Pattern
- **Pattern:** Frontend app ที่เก็บ sensitive data ใน localStorage โดยไม่มี encryption เป็น security risk สูง
  - Evidence: 1/3
  - First seen: 2026-04-30
  - Last confirmed: 2026-04-30
  - Context: Stella รีวิว gosoft-rental พบว่า AccountContext เก็บ user data ใน localStorage โดยไม่ encrypt
  - Critical findings to look for:
    - localStorage ที่เก็บ sensitive data โดยไม่ encrypt
    - sessionStorage ที่เก็บ sensitive data โดยไม่ encrypt
    - Cookies ที่ไม่มี HttpOnly, Secure flags
  - Recommended fix: ใช้ encryption (crypto-js หรือ library อื่นๆ) สำหรับ localStorage ที่มี sensitive data
  - Source: luna-workspace — gosoft-rental frontend review

### Frontend Production Readiness Pattern
- **Pattern:** Production app ต้องมี error tracking system เช่น Sentry เพื่อ monitor errors
  - Evidence: 1/3
  - First seen: 2026-04-30
  - Last confirmed: 2026-04-30
  - Context: Stella รีวิว gosoft-rental พบว่าขาด error tracking system
  - Critical findings to look for:
    - ไม่มี Sentry หรือ error tracking system
    - ไม่มี monitoring tools
    - ไม่มี logging strategy
  - Recommended fix: เพิ่ม Sentry หรือ error tracking system ก่อนขึ้น production
  - Source: luna-workspace — gosoft-rental frontend review

### Frontend Accessibility Pattern
- **Pattern:** หลาย frontend codebases ขาด ARIA attributes และ keyboard navigation ทำให้ accessibility score ต่ำ
  - Evidence: 1/3
  - First seen: 2026-04-30
  - Last confirmed: 2026-04-30
  - Context: Stella รีวิว gosoft-rental พบว่า accessibility score 5/10 ขาด ARIA attributes, keyboard navigation
  - Critical findings to look for:
    - ขาด ARIA attributes (aria-label, aria-describedby, role)
    - ขาด keyboard navigation (Escape key สำหรับ modals, Tab navigation)
    - ขาด focus management (focus trap สำหรับ modals)
    - ขาด semantic HTML
  - Recommended fix: เพิ่ม ARIA attributes และ keyboard navigation ใน components ทุกตัว
  - Source: luna-workspace — gosoft-rental frontend review

## การยืนยัน Hypothesis

เมื่อได้หลักฐานเพิ่ม:
1. Review hypothesis ที่มีอยู่
2. เพิ่ม Evidence count + Last confirmed date
3. ถ้า Evidence ≥ 1 → ย้ายไป `insights.md`
4. ถ้า Evidence ≥ 3 → ย้ายไป `preferences.md`
5. ถ้าไม่ยืนยันภายใน 4 สัปดาห์ → ลบออก (ที่ Weekly Retrospective)

---
*อัปเดตล่าสุด: 2026-04-30 (Thai name communication pattern)*
