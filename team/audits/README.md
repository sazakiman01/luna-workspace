# Team Audits — Polaris Output

*Audit reports จาก Polaris (Luna System Auditor)*

---

## 📁 Structure

```
audits/
├── README.md                       # ไฟล์นี้
├── YYYY-Www-weekly.md              # Weekly audit (Friday)
├── YYYY-MM-monthly.md              # Monthly deep audit (end of month)
└── deep-audit-YYYY-MM-DD.md        # On-demand deep audits
```

---

## 🎯 Audit Types

| Type | Cadence | Scope |
|------|---------|-------|
| **Weekly** | Friday | Behavior compliance + team performance (past 7 days) |
| **Monthly** | End of month | Deep dive: structure, learning, trends |
| **On-Demand** | As requested | Pre-release / post-incident / custom |

---

## 📋 Severity Levels

- 🔴 **Critical** — ต้องแก้ทันที (anti-pattern violations, broken paths)
- 🟡 **Warning** — ควรแก้เร็วๆ (stale hypothesis, role imbalance)
- 🟢 **Minor** — แก้เมื่อว่าง (doc outdated, cosmetic)
- ℹ️ **Info** — observation, trend tracking

---

## 🔄 Audit Lifecycle

```
1. Polaris runs audit (manual or via /weekly-audit workflow)
2. Output saved to audits/YYYY-Www-weekly.md
3. Luna reviews findings
4. Luna presents to พี่แมน with action items
5. พี่แมน decides action (fix now / defer / deprioritize)
6. Next audit tracks resolution
```

---

## 📝 Report Template

```markdown
# Weekly Audit YYYY-Www
*Audited by Polaris on YYYY-MM-DD*

## Summary
- Behavior compliance: [score/10]
- Team performance: [status]
- Learning system: [status]
- Architecture: [status]

## 🔴 Critical Findings
[...]

## 🟡 Warnings
[...]

## 🟢 Minor / ℹ️ Info
[...]

## Trend vs Previous Audit
- [Better/Worse/Same] because [...]

## Action Items
- [ ] [who] [what] by [when]

## Metrics
| Metric | This week | Last week | Δ |
|--------|-----------|-----------|---|
| Role deployments | | | |
| Anti-pattern violations | | | |
| New hypotheses | | | |
| Promoted insights | | | |
```

---

## 🔗 Related

- `roles/polaris.md` — Polaris role definition
- `preferences/polaris.md` — Polaris learning
- `workflows/weekly-audit.md` — automation (to be created)
- `performance.md` — raw data source
- `../Luna/retrospective/` — cross-check with retrospectives

---
*Maintained by Polaris — reviewed by Luna*
