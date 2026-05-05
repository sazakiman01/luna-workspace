# Nova Principle Level Readiness Audit
**Date:** 2026-04-29
**Reviewer:** Polaris (โพลาริส) - Luna System Auditor
**Scope:** Nova Principal Skill Readiness (Senior → Principle Upgrade)
**Audit Type:** On-demand (role elevation)

---

## Executive Summary

สุขภาพ Nova Principal Skill: **⚠️ ต้องปรับปรุง (Skeleton State)**

**สรุปสั้นๆ:** Nova Principal Skill อยู่ในสถานะ "Honest Skeleton" - มี framework ที่ดีแต่ยังขาด evidence จริงจากการทำงาน ทุก section ยกเว้น Decision Framework ยัง mark "evidence pending" หรือเป็น template การอัปเกรดจาก Senior → Principle จำเป็นต้อง rewrite skill จาก skeleton → full ด้วย evidence จริง

**Overall Score:** 4/10

- **Framework Quality:** 8/10 (structure ดี, domain-specific)
- **Evidence Completeness:** 1/10 (เกือบไม่มี evidence จริง)
- **Readiness for Promotion:** 2/10 (ยังไม่พร้อม - ต้องทำงานจริงก่อน)

---

## Detailed Findings

### ✅ Strengths (ดี)

#### 1. Framework Structure
- **Decision Framework:** มี 3 frameworks ที่ชัดเจน (Transaction selection, Cold-start optimization, Error handling)
- **Domain-specific:** เนื้อหาเฉพาะสำหรับ backend (Firebase, Firestore, TypeScript) - ไม่ใช่ generic
- **No banned phrases:** ไม่มี "Define X strategy", "5 step framework", generic interfaces

#### 2. Honest Disclosure
- **Status declaration:** ระบุชัดเจนว่า "SKELETON — evidence pending"
- **Trigger condition:** ระบุว่าจะ rewrite เมื่อ Nova ทำ backend task ≥ 1 ครั้ง
- **Author transparency:** ระบุว่า Luna author skeleton (Nova ยังไม่ active)

#### 3. Quality Bar Table
- **Comparable dimensions:** มี table เปรียบเทียบ Senior vs Principal 4 มิติ
- **Measurable thresholds:** ระบุตัวเลบ (cold start < 2s, TS strict + zod)

---

### ⚠️ Issues (ต้องปรับปรุง)

#### Critical (สูง)

**C1: Anti-Patterns ทั้งหมดเป็น template - ไม่มีเหตุการณ์จริง**
- **ที่ไหน:** `team/nova/skills/nova-principal-skill.md` lines 59-67
- **ปัญหาคืออะไร:** Anti-Patterns 5 ข้อ (AP-1 ถึง AP-5) ทั้งหมดเป็น template - ไม่มี "เคยเกิดเมื่อ" date จริง, ไม่มี context จริง, ไม่มี evidence จริง เปรียบเทียบกับ Orion (มี AP-1 ถึง AP-5 ที่มี real evidence จาก PMAM review), Lyra (มี AP-1, AP-2 ที่มี date 2026-04-23 จริง)
- **ทำไมต้องแก้:** Anti-Patterns ใน Principal Skill ต้องมาจากเหตุการณ์จริงที่ role เคยทำผิด - ถ้าเป็น template จะไม่สามารถใช้เป็น guard rail ได้จริง และ violate กฎ "ห้ามคัดลอกจาก role อื่น"
- **วิธีแก้:** Nova ต้องทำ backend task จริง ≥ 1 ครั้ง → เกิด anti-pattern จริง → rewrite AP section ด้วย evidence จริง (date + context + why wrong)

**C2: Quality Bar thresholds ไม่ได้ validate จากงานจริง**
- **ที่ไหน:** `team/nova/skills/nova-principal-skill.md` lines 48-56
- **ปัญหาคืออะไร:** Quality Bar table ระบุ thresholds (cold start < 2s, TS strict + zod, typed errors) แต่เป็น theoretical - ไม่ได้ measure จากงานจริง เปรียบเทียบกับ Orion (มี evidence จาก PMAM Architecture Review Score 8/10), Polaris (มี evidence จาก W18 baseline audit + Lyra Wave 1 review)
- **ทำไมต้องแก้:** Quality Bar ใน Principal Level ต้องมี measurable thresholds ที่ validate จากงานจริง - ถ้าเป็น theoretical จะไม่สามารถใช้ประเมิน performance ได้
- **วิธีแก้:** Nova ทำ backend task จริง → measure actual performance → update Quality Bar ด้วย real data

**C3: Decision Framework ยังไม่ได้ test ในสถานการณ์จริง**
- **ที่ไหน:** `team/nova/skills/nova-principal-skill.md` lines 28-45
- **ปัญหาคืออะไร:** Decision Framework 3 อัน (Transaction selection, Cold-start optimization, Error handling) ดีแต่ยังไม่ได้ apply ในงานจริง - ไม่มีตัวอย่าง concrete จาก task จริง เปรียบเทียบกับ Orion (มีตัวอย่างจาก PMAM review: "Reject 2, Choose 1" สำหรับ Firestore selection), Polaris (มีตัวอย่างจาก W18 audit: severity calibration ด้วย 30-day impact lens)
- **ทำไมต้องแก้:** Decision Framework ใน Principal Level ต้องมีตัวอย่าง concrete จากงานจริง - ถ้าเป็น theoretical จะไม่สามารถใช้เป็น guide ได้จริง
- **วิธีแก้:** Nova ทำ backend task จรัย → apply frameworks → capture examples → update Decision Framework section

#### High (สูง-ปานกลาง)

**H1: "What makes Principal" section ยังเป็น theoretical**
- **ที่ไหน:** `team/nova/skills/nova-principal-skill.md` lines 15-25
- **ปัญหาคืออะไร:** ระบุจุดต่าง 3 ข้อ (Transaction discipline, Cold-start economics, Error contracts) แต่เป็น theoretical - ไม่ได้ demonstrate จากงานจริง เปรียบเทียบกับ Orion (มีจุดต่าง 4 ข้อที่ validate จาก PMAM review), Polaris (มีจุดต่าง 3 ข้อที่ validate จาก W18 audit)
- **ทำไมต้องแก้:** Section นี้ต้อง demonstrate จากงานจริงว่า Principal ทำอะไรต่างจาก Senior
- **วิธีแก้:** Nova ทำงานจริง → capture examples → update section ด้วย real demonstrations

**H2: Required Reading ยังไม่ครบ**
- **ที่ไหน:** `team/nova/skills/nova-principal-skill.md` lines 92-97
- **ปัญหาคืออะไร:** Required Reading ระบุ `team/preferences/nova.md` (empty — fill เมื่อ active) แต่ยังไม่ได้สร้าง preferences file เปรียบเทียบกับ Orion (มี preferences file), Polaris (มี preferences file), Lyra (มี preferences file)
- **ทำไมต้องแก้:** Preferences file จำเป็นสำหรับ track learning history และ anti-patterns
- **วิธีแก้:** สร้าง `team/preferences/nova.md` (อาจเป็น empty ตอนนี้ แต่ต้องสร้าง file)

#### Medium (ปานกลาง)

**M1: Tools & Outputs ยัง generic**
- **ที่ไหน:** `team/nova/skills/nova-principal-skill.md` lines 71-76
- **ปัญหาคืออะไร:** Tech Stack section ดีแต่ Tools & Outputs ยัง generic - ไม่มี "Verification habit" เหมือน Orion, Polaris, Lyra
- **ทำไมต้องแก้:** Principal Level ต้องมี verification habit ที่ชัดเจน
- **วิธีแก้:** Add "Verification habit" section ด้วย backend-specific checks

**M2: When to Use ยังไม่มี counter-trigger**
- **ที่ไหน:** `team/nova/skills/nova-principal-skill.md` lines 100-105
- **ปัญหาคืออะไร:** "When to Use" มีแต่ trigger conditions ไม่มี "อย่าใช้" (counter-trigger) เหมือน Orion, Polaris, Lyra
- **ทำไมต้องแก้:** Counter-trigger ช่วย prevent misuse
- **วิธีแก้:** Add "อย่าใช้" section

---

## Priority Action Items

### 🔴 สิ่งที่ต้องแก้ทันที (Critical)

- [ ] **Nova ทำ backend task จริง ≥ 1 ครั้ง** - เพื่อสะสม evidence สำหรับ rewrite principal skill
- [ ] **Rewrite Anti-Patterns section** - เปลี่ยนจาก template → real evidence (date + context + why wrong)
- [ ] **Validate Quality Bar thresholds** - measure จากงานจริง → update table

### 🟠 สิ่งที่ต้องแก้ภายใน 1-2 สัปดาห์

- [ ] **Apply Decision Framework ในงานจริง** - capture concrete examples
- [ ] **Update "What makes Principal" section** - demonstrate จากงานจริง
- [ ] **สร้าง `team/preferences/nova.md`** - เพื่อ track learning history

### 🟡 สิ่งที่ควรแก้ภายใน 1 เดือน

- [ ] **Add Verification habit section** - backend-specific checks
- [ ] **Add "อย่าใช้" counter-triggers** - prevent misuse

### 🟢 สิ่งที่ควรแก้ภายใน 3 เดือน

- [ ] **Promote Nova จาก Senior → Principle** - หลัง evidence accumulation complete

---

## Best Practices Recommendations

### 💡 แนวทางการพัฒนาที่ดี

#### 1. Evidence-First Approach
- **Evidence before elevation:** อย่า promote role ถ้ายังไม่มี evidence จริง - ตาม pattern ของ Orion, Polaris, Lyra
- **Real examples:** ทุก section ต้องมี examples จากงานจริง - ไม่ใช้ theoretical

#### 2. Honest Disclosure
- **Skeleton state:** ระบุชัดเจนว่า "evidence pending" เหมือน Nova ปัจจุบัน - ดีมาก
- **Trigger condition:** ระบุว่าจะ rewrite เมื่อไหร่ - ดีมาก

#### 3. Role-Specific Content
- **Domain expertise:** เนื้อหาเฉพาะ backend (Firebase, Firestore, TypeScript) - ดีมาก
- **No boilerplate:** ไม่มี banned phrases - ดีมาก

---

## Comparison with Existing Principal Skills

| Role | Evidence Base | Anti-Patterns | Quality Bar | Decision Framework |
|------|--------------|--------------|-------------|-------------------|
| **Orion** | PMAM Architecture Review 8/10 (2026-04-23) | 5 APs มี real evidence | Validated from review | Applied in PMAM (Reject 2, Choose 1) |
| **Polaris** | W18 baseline audit + Lyra Wave 1 review | 5 APs (3 real, 2 guard) | Validated from audits | Applied in W18 (30-day impact lens) |
| **Lyra** | 2 APs + 4-6 tasks (W17-W18) | 3 APs (2 real, 1 potential) | Validated from tasks | Applied in daily-log workflow |
| **Nova** | None (skeleton) | 5 APs (template only) | Theoretical only | Theoretical only |

---

## Conclusion

**สรุปสั้นๆ:** Nova Principal Skill มี framework ที่ดีและ domain-specific แต่ยังขาด evidence จริงจากการทำงาน - การอัปเกรดจาก Senior → Principle จำเป็นต้อง:
1. Nova ทำ backend task จริง ≥ 1 ครั้ง
2. Rewrite principal skill จาก skeleton → full ด้วย evidence จริง
3. อัปเดต nova.md (Senior → Principle) หลัง evidence accumulation complete

**ถ้าแก้ตามสิ่งที่แนะนำ:** จะทำให้ Nova มี principal skill ที่มี evidence จริง เหมือน Orion, Polaris, Lyra และสามารถทำงานระดับ Principle ได้อย่างมั่นใจ

---

## Roadmap for Promotion

### Phase 1: Evidence Accumulation (Current)
- Nova ทำ backend task จริง ≥ 1 ครั้ง (รอ repo context จากพี่แมน)
- Capture anti-patterns จริง
- Measure quality bar thresholds
- Apply decision frameworks

### Phase 2: Skill Rewrite
- Rewrite nova-principal-skill.md จาก skeleton → full
- Update Anti-Patterns ด้วย real evidence
- Update Quality Bar ด้วย real data
- Add concrete examples ใน Decision Framework

### Phase 3: Promotion
- อัปเดต nova.md (Senior → Principle)
- สร้าง `team/preferences/nova.md`
- Polaris audit อีกครั้ง → approve promotion

---

**ถ้ามีคำถาม:** ถ้าไม่เข้าใจส่วนไหน สามารถถามได้เลย
