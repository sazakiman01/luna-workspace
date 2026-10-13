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
- [ ] Role มี `memory: user` ใน `agents/<role>.md` frontmatter

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
- [ ] มี learning ที่มีหลักฐาน ≥ 1 ใน `agent-memory/<role>/` (ตามเกณฑ์ใน `rules/team-protocol.md`)
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
- [ ] Confirmed learnings ≥ 3 (ใน agent-memory ของ role (`memory: user`) หรือ auto memory ส่วนกลางที่ role เกี่ยวข้อง)
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

## 🎯 Current Status

ไม่เก็บตารางสถานะในไฟล์นี้ (เคย hard-code baseline 2026-04-27 แล้วเก่าเร็ว + อ้าง role ที่ retire แล้ว)
→ สถานะล่าสุดดูจาก `/luna-audit` / weekly audit report (`team/audits/`)

*2026-10-13: เริ่มสะสม agent-memory ใหม่บนเครื่องนี้ — ทุก role ประเมินใหม่จากหลักฐานจริง*

---

## 🔄 Integration with Other Workflows

| Workflow | Growth Trigger Check |
|----------|---------------------|
| `weekly-audit.md` Step 3 | Polaris scan: any role crossed L1→L2 threshold? |
| `weekly-retro.md` Step 4 | Luna check: learning ใหม่ใน agent-memory ทำให้ role ผ่านเกณฑ์ level ไหม? |
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
