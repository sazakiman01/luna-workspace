---
description: Master cadence ที่เชื่อม daily-log, weekly-audit, weekly-retro, feedback-learn, scoring-rubric เข้าด้วยกัน — Phase 5 of luna-principal-elevation-roadmap
---

# /continuous-improvement

**Purpose:** ป้องกัน system decay — ทำให้ทุก workflow ทำงานเป็นจังหวะ ไม่ต้องพึ่ง "จำได้"
**Owner:** Luna (coordinate) + Polaris (audit) + Pulsar (retro)
**Created:** 2026-04-27 (Phase 5)

---

## 🔄 Cadence Overview

```
┌─────────────────────────────────────────────────────┐
│                    CONTINUOUS LOOP                    │
│                                                       │
│   DAILY (auto-trigger)                               │
│   ├── daily-log.md → T1-T6 triggers                 │
│   └── feedback-learn.md → on feedback                │
│                                                       │
│   WEEKLY (Friday or on-demand)                       │
│   ├── weekly-audit.md → Polaris audit                │
│   ├── weekly-retro.md → Pulsar retro                 │
│   └── scoring-rubric.md → calibrate if task done     │
│                                                       │
│   MONTHLY (1st week)                                 │
│   ├── Knowledge maturity review (L0-L3)              │
│   ├── Hypothesis cleanup (>4 weeks = drop)           │
│   └── Growth path check (promote eligible roles)     │
│                                                       │
│   QUARTERLY (every 12 weeks)                         │
│   ├── Full system audit (Polaris baseline-level)     │
│   ├── Rubric calibration review                      │
│   └── Roadmap health check                           │
│                                                       │
└─────────────────────────────────────────────────────┘
```

---

## 📅 Daily Cadence (auto — ทุกวันที่มีงาน)

**Trigger:** ทุกครั้งที่ role ทำงาน
**Workflow:** `workflows/daily-log.md`
**Owner:** Luna

| Step | Action | Output |
|------|--------|--------|
| 1 | Role ทำงานเสร็จ | Task output |
| 2 | Luna review output | Review notes |
| 3 | Append daily log (T1-T6 triggers) | `<repo>/Luna/team/daily/YYYY-MM-DD.md` |
| 4 | Update `performance.md` (+1 task, last active) | Score update |
| 5 | ถ้ามี feedback → run `feedback-learn.md` | Learning updates |

**Health check:** ถ้าวันไหนมี task แต่ไม่มี daily log → flag ใน weekly audit

---

## 📅 Weekly Cadence (Friday หรือ on-demand)

### Part A: Weekly Audit (Polaris)

**Trigger:** ทุกวันศุกร์ หรือพี่แมนสั่ง `/weekly-audit`
**Workflow:** `workflows/weekly-audit.md`

| Step | Action | Rubric Integration |
|------|--------|-------------------|
| 1 | Gather data (daily logs 7 days) | — |
| 2 | Behavior compliance check | — |
| 3 | **Team performance check ด้วย rubric Part B** | Score ทุก active role ด้วย 5 dimensions |
| 4 | Learning system check | Check hypothesis staleness |
| 5 | **Knowledge maturity spot-check** | Spot-check 2-3 roles ด้วย Part C |
| 6 | Generate report | `team/audits/YYYY-Www-weekly.md` |
| 7 | Luna review + present พี่แมน | Decisions + action items |

### Part B: Weekly Retro (Pulsar)

**Trigger:** Sunday evening หรือ Monday morning (หลัง audit)
**Workflow:** `workflows/weekly-retro.md`

| Step | Action |
|------|--------|
| 1 | Consume audit findings |
| 2 | Run team retro |
| 3 | Run Luna retro |
| 4 | Apply changes (hypothesis promotion, stale cleanup) |
| 5 | Present + record decisions |

**Sequence:** Audit (Friday) → Retro (Sunday/Monday) → ใช้ findings จาก audit เป็น input ของ retro

---

## 📅 Monthly Cadence (1st week of month)

**Trigger:** สัปดาห์แรกของเดือน (ทำใน weekly audit session)
**Owner:** Polaris + Luna

### Monthly-specific checks (เพิ่มจาก weekly):

| Check | Action | Threshold |
|-------|--------|-----------|
| **M1: Knowledge Maturity Review** | Score ทุก role ด้วย Part C (L0-L3) | Target: ≥ 4 roles at L2+ |
| **M2: Hypothesis Cleanup** | ลบ hypothesis ที่ > 4 weeks + no evidence increase | Drop if stale |
| **M3: Growth Path Check** | ตรวจ roles ที่ trigger promotion conditions | See Growth Path System |
| **M4: Rubric Calibration** | Polaris ทบทวน score consistency ย้อนหลัง | Adjust weights if needed |
| **M5: Backlog Review** | Check pending items (Galaxy skeleton, KA3-KA5) | Prioritize or drop |

**Output:** Append monthly section ใน weekly audit report

---

## 📅 Quarterly Cadence (every 12 weeks)

**Trigger:** ทุก 12 สัปดาห์ (manual trigger โดย Luna)
**Owner:** Polaris (full audit) + Luna (roadmap)

| Check | Action |
|-------|--------|
| **Q1: Full System Audit** | เหมือน baseline audit W18 — ตรวจทุก dimension |
| **Q2: Scoring Rubric Review** | Rubric ยัง fit ไหม? ต้อง adjust dimensions/weights? |
| **Q3: Roadmap Health** | เป้าหมายระยะยาวยัง align ไหม? Phase ไหนต้อง revisit? |
| **Q4: Team Composition** | Role ไหนควร merge/split/retire? |

**Output:** `team/audits/YYYY-Qx-quarterly.md`

---

## 🔗 Workflow Dependency Graph

```
feedback-learn.md ──┐
                    ├──► daily-log.md ──► performance.md
role task output ───┘         │
                              ▼
                    weekly-audit.md (Polaris)
                              │
                              ▼
                    weekly-retro.md (Pulsar)
                              │
                              ├──► hypothesis.md (promote/drop)
                              ├──► insights.md (promote)
                              ├──► preferences.md (promote)
                              └──► performance.md (update)
                                        │
                                        ▼
                              scoring-rubric.md (calibrate)
                                        │
                              ┌─────────┴─────────┐
                              ▼                   ▼
                    growth-triggers.md      health-dashboard.md
```

---

## ⚠️ Decay Detection (สัญญาณว่า loop กำลังพัง)

| Signal | Threshold | Action |
|--------|-----------|--------|
| **No daily log** | 2+ task days without log | Luna self-flag + Polaris audit |
| **No weekly audit** | Skip 2 consecutive weeks | Luna alert พี่แมน |
| **No retro** | Skip 2 consecutive weeks | Luna alert พี่แมน |
| **Stale hypothesis** | > 4 weeks no evidence | Drop at monthly review |
| **Score inflation** | Rubric dimension all 2/2 for 4+ weeks | Polaris investigate — too lenient? |
| **Score stagnation** | Same score 4+ weeks despite activity | Check if rubric captures growth |
| **Active rate drop** | < 50% roles active in 2 weeks | Review delegation patterns |

---

## 📋 Quick Reference: When to Run What

| You need to... | Run this |
|----------------|----------|
| บันทึกงานที่เสร็จ | `workflows/daily-log.md` |
| เรียนรู้จาก feedback | `workflows/feedback-learn.md` |
| ตรวจสอบทีมรายสัปดาห์ | `workflows/weekly-audit.md` |
| ทบทวนสัปดาห์ + ย้าย pattern | `workflows/weekly-retro.md` |
| ให้คะแนน skill/performance | `templates/scoring-rubric.md` |
| ตรวจสอบ role growth | `workflows/growth-triggers.md` |
| ดู system health รวม | `team/health-dashboard.md` |

---
*Phase 5 — Continuous Improvement Loop | Luna + Polaris + Pulsar*
