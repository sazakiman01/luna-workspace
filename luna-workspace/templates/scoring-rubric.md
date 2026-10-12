# Principal Skill & Role Performance Scoring Rubric

*Designed by **Polaris** (Luna System Auditor) — Reviewed by Luna*
*Phase 4, Decision 15 of luna-principal-elevation-roadmap*
*Created: 2026-04-27*

> **Purpose:** ให้ทุก score ใน `performance.md` มี criteria ชัดเจน — ไม่ใช้ gut feeling
>
> **ใช้เมื่อ:**
> - Polaris audit principal skill quality
> - Luna/Pulsar evaluate role performance
> - Weekly retrospective performance review

---

## 📏 Part A: Principal Skill Quality Score

ใช้ให้คะแนน `*-principal-skill.md` ของแต่ละ role

### 7 Dimensions (แต่ละข้อ 0-2 คะแนน → max 14 → normalize เป็น 10)

| # | Dimension | 0 (Fail) | 1 (Acceptable) | 2 (Principal) |
|---|-----------|----------|-----------------|----------------|
| D1 | **Specificity** | Generic — ใช้ได้กับ role ไหนก็ได้ | มี role-specific content แต่ยัง broad | ทุก section เฉพาะ role นี้เท่านั้น — ย้ายไป role อื่นไม่ได้ |
| D2 | **Evidence** | ไม่มี evidence / อ้างอิงจริง | มี evidence บางส่วน หรือ mark "pending" honestly | ทุก claim มี date + source + context จริง |
| D3 | **Decision Framework** | Generic 5-step หรือ copy จาก template | มี framework เฉพาะแต่ยังไม่ tested | Framework ผ่านการใช้จริง ≥ 1 ครั้ง + มี example |
| D4 | **Anti-Patterns** | ไม่มี หรือ copy จาก role อื่น | มี anti-patterns แต่ไม่มี date/context | Anti-patterns จากเหตุการณ์จริง + วิธีแก้ที่ใช้ได้ |
| D5 | **Quality Bar** | ไม่มี measurable threshold | มี threshold แต่ไม่ practical | Threshold วัดได้จริง + แยก Senior vs Principal ชัด |
| D6 | **Cross-Role Boundaries** | ไม่ระบุ boundary | ระบุ boundary แต่ไม่มี handoff trigger | Boundary ชัด + handoff trigger + tested ≥ 1 ครั้ง |
| D7 | **Honesty** | Claim expertise ที่ไม่มีจริง | บาง section ยังมี inflation | ทุก section honest — mark pending ที่ยังไม่มี data |

### Score Calculation

```
Raw Score = D1 + D2 + D3 + D4 + D5 + D6 + D7  (0-14)
Normalized = (Raw / 14) × 10  (0.0 - 10.0)
```

### Score Bands

| Band | Score | ความหมาย | Action |
|------|-------|----------|--------|
| 🔴 **Fail** | 0-3.9 | Boilerplate / ไม่ผ่าน | Discard + rewrite |
| 🟡 **Skeleton** | 4.0-6.9 | Honest skeleton — role ยังไม่ active | OK ถ้า mark "evidence pending" |
| 🟢 **Genuine** | 7.0-8.4 | Role-specific + มี evidence บางส่วน | Good — improve เมื่อมี evidence เพิ่ม |
| 🌟 **Principal** | 8.5-10.0 | ทุก dimension evidence-backed + tested | Excellent — reference quality |

### Quick Validation (ตัด Fail ทันที)

ถ้าเจออย่างใดอย่างหนึ่ง → Score ≤ 3.9 อัตโนมัติ:
- [ ] มี banned phrase จาก `templates/role-principal-skill.template.md`
- [ ] Copy structure/content จาก role อื่น > 30%
- [ ] ไม่มี evidence หรือ "pending" mark เลย
- [ ] Generic TypeScript interfaces ที่ไม่เกี่ยวกับ role

---

## 📊 Part B: Role Performance Score

ใช้ให้คะแนน role performance ใน `performance.md`

### 5 Dimensions (แต่ละข้อ 0-2 → max 10)

| # | Dimension | 0 | 1 | 2 |
|---|-----------|---|---|---|
| P1 | **Output Volume** | 0 tasks | 1-2 tasks | ≥ 3 tasks |
| P2 | **Output Quality** | ไม่มี review / fail review | ผ่าน review แต่มี revision | ผ่าน first-time review |
| P3 | **Learning Growth** | ไม่มี preferences/insights update | มี update แต่ยัง shallow | มี anti-patterns + hypothesis + confirmed insights |
| P4 | **Cross-Role Contribution** | ไม่เคย review/support role อื่น | Review role อื่น ≥ 1 ครั้ง | Active cross-review pattern + handoff smooth |
| P5 | **Consistency** | Active ครั้งเดียวแล้วหาย | Active ≥ 2 sessions แต่ไม่ต่อเนื่อง | Active ≥ 3 sessions + ห่างไม่เกิน 7 วัน |

### Score Bands

| Band | Score | ความหมาย |
|------|-------|----------|
| 🔴 **Inactive** | 0-1.9 | Role ไม่เคย active หรือ dormant > 14 วัน |
| 🟡 **Emerging** | 2.0-4.9 | Active แต่ยังไม่ established |
| 🟢 **Established** | 5.0-7.4 | Consistent output + learning |
| 🌟 **Principal** | 7.5-10.0 | High output + quality + cross-role + consistent |

---

## 📈 Part C: Knowledge Maturity Level (per Role)

| Level | Name | Criteria | Example |
|-------|------|----------|---------|
| **L0** | Empty | ไม่มี knowledge file, ไม่มี preferences, ไม่มี insights | Nova (ปัจจุบัน) |
| **L1** | Skeleton | มี principal skill (skeleton/genuine) + preferences template | Cosmos, Aurora, Nebula |
| **L2** | Learning | L1 + มี real preferences (≥1 confirmed) + ≥1 anti-pattern | Lyra, Polaris |
| **L3** | Deep | L2 + มี case study จริง + cross-repo knowledge + ≥3 insights confirmed | *ยังไม่มี role ถึง* |

### Knowledge Score Mapping

| Level | Score |
|-------|-------|
| L0 | 0-2.4 |
| L1 | 2.5-4.9 |
| L2 | 5.0-7.4 |
| L3 | 7.5-10.0 |

---

## 🔄 Scoring Process

### เมื่อไหร่ให้ score:

| Trigger | ใครให้ | ใช้ Part ไหน |
|---------|-------|-------------|
| Principal skill rewrite/review | Polaris | Part A |
| Weekly retrospective | Luna + Pulsar | Part B |
| Phase 4 audit / quarterly review | Polaris | Part C |
| Role ทำงานเสร็จ (task complete) | Luna | Part B (update P1, P2) |

### Inter-Rater Reliability

เพื่อลด bias:
1. **Reviewer ≠ Author** — ผู้ให้ score ต้องไม่ใช่คนเขียน
2. **ใช้ rubric table** — ไม่ใช้ gut feeling, tick ทีละ dimension
3. **Document scores** — บันทึกคะแนนแต่ละ dimension ไม่ใช่แค่ total
4. **Calibration session** — ทุก 4 สัปดาห์ Polaris ทบทวน score consistency

---

## 📋 Scoring Worksheet (ใช้ใน review)

### Part A Worksheet
```markdown
## Skill Review: [Role] Principal Skill
**Reviewer:** [name] | **Date:** YYYY-MM-DD

| Dim | Score | Evidence/Notes |
|-----|-------|----------------|
| D1 Specificity | _/2 | |
| D2 Evidence | _/2 | |
| D3 Decision Framework | _/2 | |
| D4 Anti-Patterns | _/2 | |
| D5 Quality Bar | _/2 | |
| D6 Cross-Role | _/2 | |
| D7 Honesty | _/2 | |
| **Total** | _/14 | **Normalized: _/10** |
```

### Part B Worksheet
```markdown
## Performance Review: [Role]
**Period:** W__ to W__ | **Reviewer:** [name]

| Dim | Score | Evidence/Notes |
|-----|-------|----------------|
| P1 Output Volume | _/2 | Tasks: _ |
| P2 Output Quality | _/2 | Reviews: _ |
| P3 Learning Growth | _/2 | |
| P4 Cross-Role | _/2 | |
| P5 Consistency | _/2 | |
| **Total** | _/10 | |
```

---

## 🔗 References

- `templates/role-principal-skill.template.md` — anti-boilerplate template
- `team/performance.md` — current scores (to be recalibrated)
- `team/audits/2026-W18-baseline-audit.md` — baseline audit

---

## 📝 Changelog

| Date | Change | By |
|------|--------|-----|
| 2026-04-27 | Initial rubric created (Decision 15) | Polaris + Luna |

---
*Polaris note: Rubric นี้จะถูก calibrate หลังใช้จริง 2-3 ครั้ง — initial design อาจปรับ weight/criteria*
