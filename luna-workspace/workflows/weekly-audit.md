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
- memory tool (Luna ส่วนกลาง) — feedback/learnings ที่บันทึกไว้
- `~/.claude/agent-memory/<role>/` — agent-memory ของแต่ละ role
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

## Step 3: Team Performance Check (with Rubric)

จาก `performance.md` + `templates/scoring-rubric.md` Part B:

- Role usage distribution (count per role)
- Orphan roles (0 usage 2+ weeks) → flag
- Overloaded roles (>50% of tasks) → hire/delegate?
- Quality score trends
- **NEW (Phase 5):** Score active roles ด้วย rubric Part B (5 dimensions)
- **NEW (Phase 5):** Check growth triggers — any role crossed L1→L2? (see `workflows/growth-triggers.md`)

---

## Step 4: Learning System Check

- Stale memory entries (ไม่ได้ใช้ / ขัดแย้งกับพฤติกรรมจริง) → consolidate หรือลบ?
- Pattern ใน agent-memory ของ role ที่ควร sync ขึ้น memory tool ส่วนกลาง?
- Memory entries ซ้ำซ้อน/ขัดแย้งกันเอง?
- **NEW (Phase 5):** Knowledge maturity spot-check 2-3 roles ด้วย rubric Part C
- **NEW (Monthly M1):** Full knowledge maturity review ทุก role (1st week of month)

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

## Step 7: Update Health Dashboard

**Phase 5:** ~~อัปเดต `team/health-dashboard.md`~~ — archived 2026-08-07 · ใช้ `luna-dashboard` (npm run scan) ซึ่งคำนวณเองแทน:
- Overall health metrics
- Role health matrix (ถ้ามี score change)
- Trend table (+1 row)
- Alerts (add/remove)
- Backlog (add/remove/reprioritize)

---

## Step 8: Update Daily Log

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
*Updated 2026-04-27 — Phase 5: added rubric integration (Steps 3,4), health dashboard (Step 7), growth triggers*
