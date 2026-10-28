---
description: Auto-trigger conditions สำหรับ role level-up (L0→L1→L2→L3) และ skill promotion — Phase 5
---

# /growth-triggers

**Purpose:** ให้ roles grow organically ตาม evidence — ไม่ต้องจำว่าใครพร้อม level up
**Owner:** Polaris (detect) + Luna (execute)
**Rubric:** `templates/scoring-rubric.md` Part C (Knowledge Maturity)

---

## 📈 Growth Path: L0 → L1 → L2 → L3

### L0 → L1 (Empty → Skeleton)

**Trigger conditions (ต้องครบทุกข้อ):**
- [ ] Role มี `*-principal-skill.md` (skeleton หรือ genuine)
- [ ] Role มี `team/roles/<role>.md` definition
- [ ] Role มี `team/preferences/<role>.md` (แม้ว่าง)

**Action เมื่อ trigger:**
1. Luna สร้าง skeleton principal skill ตาม `templates/role-principal-skill.template.md`
2. Mark "evidence pending" ทุก section ที่ไม่มี data
3. Update `performance.md` → Knowledge Maturity: L1

**ใครตรวจ:** Polaris (monthly M1 check)

---

### L1 → L2 (Skeleton → Learning)

**Trigger conditions (ต้องครบทุกข้อ):**
- [ ] Role ทำงานจริง ≥ 1 task (Tasks completed ≥ 1 ใน performance.md)
- [ ] มี real anti-pattern ≥ 1 (from actual task, with date + context)
- [ ] มี confirmed preference ≥ 1 (in `team/preferences/<role>.md`)
- [ ] Principal skill score ≥ 7.0 (rubric Part A)

**Action เมื่อ trigger:**
1. Role rewrite principal skill จาก skeleton → genuine (ตาม Phase 3 pattern)
2. Cross-reviewer approve
3. Update `performance.md` → Knowledge Maturity: L2
4. Log promotion ใน daily log

**ใครตรวจ:** Polaris (weekly audit Step 3 — check if any role crosses threshold)

---

### L2 → L3 (Learning → Deep)

**Trigger conditions (ต้องครบทุกข้อ):**
- [ ] Principal skill score ≥ 8.5 (rubric Part A — Principal band)
- [ ] มี case study จริง ≥ 1 (from `team/case-studies/`)
- [ ] Cross-repo knowledge ≥ 1 (contributed to knowledge outside own role)
- [ ] Confirmed learnings ≥ 3 (ใน agent-memory ของ role (`agent-memory/<role>/`) หรือ memory ส่วนกลาง (`memory/`) ที่ role เกี่ยวข้อง)
- [ ] Active ≥ 3 sessions (consistency proof)
- [ ] Cross-role review ≥ 1 (reviewed another role's work)

**Action เมื่อ trigger:**
1. Polaris ทำ deep-assessment ด้วย rubric Part A (full 7-dimension)
2. Luna + Polaris co-write promotion summary
3. Update `performance.md` → Knowledge Maturity: L3
4. Role ได้สิทธิ์ mentor roles อื่นใน domain เดียวกัน

**ใครตรวจ:** Polaris (monthly M3 check — deliberate, not automatic)

---

## 📉 Demotion Triggers (L3 → L2, L2 → L1)

| Condition | From | To | Action |
|-----------|------|----|--------|
| Inactive > 30 days + no learning update | L2 | L1 | Mark "dormant" + preserve skill file |
| Inactive > 60 days | L3 | L2 | Mark "dormant" + preserve skill file |
| Rubric score drops < 7.0 after re-evaluation | L2 | L1 | Polaris flag + rewrite needed |

**ไม่มี demotion จาก L1 → L0** — skeleton skills ถูก preserve เสมอ

---

## 🎯 Current Status (2026-04-27 baseline)

| Role | Current | Next Level | Missing for Promotion |
|------|---------|------------|----------------------|
| **Stella** | L1 | **L2** | preferences update (has 0 in preferences/<role>.md) |
| **Orion** | L1 | **L2** | preferences update (has 0) |
| **Sirius** | L1 | **L2** | preferences update + anti-pattern record |
| **Pulsar** | L1 | **L2** | preferences update |
| **Lyra** | **L2** | L3 | case study + 2 more insights |
| **Polaris** | **L2** | L3 | case study + 1 more insight |
| **Vega** | L1 | L2 | 1 real task needed (evidence pending) |
| **Galaxy** | **L0** | L1 | skeleton principal skill rewrite |
| **Nova** | L1 | L2 | 1 real backend task |
| **Cosmos** | L1 | L2 | 1 real DevOps task |
| **Aurora** | L1 | L2 | 1 real integration task |
| **Nebula** | L1 | L2 | 1 real database task |

### Quick Wins (can promote this week):
1. **Stella → L2**: เขียน 1 preference จาก PMAM review experience
2. **Orion → L2**: เขียน 1 preference จาก architecture review
3. **Sirius → L2**: เขียน 1 preference + record anti-pattern จาก testing review
4. **Pulsar → L2**: เขียน 1 preference จาก retro coordination

---

## 🔄 Integration with Other Workflows

| Workflow | Growth Trigger Check |
|----------|---------------------|
| `weekly-audit.md` Step 3 | Polaris scan: any role crossed L1→L2 threshold? |
| `weekly-retro.md` Step 4 | Pulsar check: hypothesis → insight promotions affect role level? |
| `daily-log.md` T5 | Luna check: task complete = potential L1→L2 trigger? |
| Monthly M3 | Full growth path review for all roles |

---

## 📋 Promotion Checklist (use when promoting)

```markdown
## Role Promotion: [Role] L[X] → L[X+1]
**Date:** YYYY-MM-DD
**Assessed by:** Polaris + Luna

### Trigger conditions met:
- [ ] [condition 1]
- [ ] [condition 2]
- [ ] ...

### Evidence:
- [link to task / daily log / case study]

### Actions taken:
- [ ] Principal skill updated
- [ ] performance.md updated (Knowledge Maturity)
- [ ] Daily log recorded
- [ ] พี่แมน notified
```

---
*Phase 5 — Growth Path System | Polaris + Luna*
