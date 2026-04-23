---
description: Weekly audit of Luna system + team performance by Polaris
---

# /weekly-audit

**Trigger:** Every Friday (or when พี่แมนขอ)
**Role:** Polaris (Luna System Auditor)
**Output:** `luna-workspace/team/audits/YYYY-Www-weekly.md`

---

## Step 1: Gather Data

อ่านแหล่งข้อมูลต่อไปนี้:

- `<repo>/Luna/team/daily/*.md` — last 7 days
- `luna-workspace/team/performance.md`
- `luna-workspace/Luna/hypothesis.md`
- `luna-workspace/Luna/insights.md`
- `luna-workspace/Luna/preferences.md`
- Previous week audit (ถ้ามี)

---

## Step 2: Behavior Compliance Check

สแกน daily logs 7 วันล่าสุด นับ:

- ✓ **Pre-Response Commitment present?** (target: 100% for non-trivial)
- ✓ **5-step pattern followed?** (team/announce/work/review/log)
- ✗ **Anti-pattern violations?** Count by type:
  - "ทำงาน domain เองทั้งที่มี Role"
  - "สมมติ limitation โดยไม่ test"
  - "ไม่ scan Image section"
- ✗ **Missing Visible Commitment?**

---

## Step 3: Team Performance Check

จาก `performance.md`:

- Role usage distribution (count per role)
- Orphan roles (0 usage 2+ weeks) → flag
- Overloaded roles (>50% of tasks) → hire/delegate?
- Quality score trends

---

## Step 4: Learning System Check

- Stale hypotheses (first-seen > 14 days, no evidence increase) → promote or drop?
- Ready-to-promote insights (Evidence 3+ but still in insights.md)?
- Evidence counters mismatch actual occurrences?

---

## Step 5: Generate Report

สร้าง `luna-workspace/team/audits/YYYY-Www-weekly.md` ตาม template ใน `audits/README.md`:

```markdown
# Weekly Audit YYYY-Www
*Audited by Polaris on YYYY-MM-DD*

## Summary
- Behavior compliance: [score/10]
- Team performance: [status]
- Learning system: [status]
- Architecture: [status]

## 🔴 Critical Findings
...

## 🟡 Warnings
...

## 🟢 Minor / ℹ️ Info
...

## Trend vs Previous Audit
...

## Action Items
- [ ] [who] [what] by [when]

## Metrics
| Metric | This week | Last week | Δ |
```

---

## Step 6: Luna Review & Present

- Luna อ่าน audit report
- ตรวจสอบว่า findings fair + evidence-based
- สรุปให้พี่แมน + เสนอ action items
- พี่แมนตัดสินใจ → บันทึก decisions

---

## Step 7: Update Daily Log

บันทึกใน `<repo>/Luna/team/daily/YYYY-MM-DD.md`:
- Task: Weekly audit
- Team: Polaris + Luna
- Output: `luna-workspace/team/audits/YYYY-Www-weekly.md`
- Action items assigned

---

## Anti-Patterns (ห้ามทำ)

- ❌ Audit โดยไม่มี data (insufficient → say so)
- ❌ Attack role/person
- ❌ Duplicate Sirius QA scope
- ❌ Over-detail minor issues, miss critical ones

---
*Managed by Polaris + Lyra (workflow design)*
