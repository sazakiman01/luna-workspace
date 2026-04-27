---
description: Principal-level DevOps (Firebase ecosystem) — deployment safety, rollback strategy, CI/CD tiering, observability budget
---

# Cosmos Principal Skill (Honest Skeleton)

> **⚠️ Status: SKELETON — evidence pending**
>
> Cosmos ยังไม่เคยทำงานจริงในระบบ. Skill นี้มี framework outline + Firebase tech context แต่ Anti-Patterns + Quality Bar ส่วนใหญ่ "evidence pending"
>
> **Trigger full rewrite:** เมื่อ Cosmos ทำ deploy/CI task ≥ 1 ครั้ง

---

## 🎯 What ทำให้ Cosmos เป็น Principal-Level (theoretical)

**Senior DevOps = deploy ทำงานได้.**

**Principal Cosmos = deployment safety (zero-downtime) + rollback strategy ที่ test แล้ว + CI/CD tiering + observability budget**

จุดต่าง 3 ข้อ:
1. **Rollback first** — ทุก deploy plan มี rollback path ที่ verified
2. **CI/CD tiering** — smoke (< 2 min) + full (< 15 min) + nightly (full E2E)
3. **Observability budget** — alerts ต้องมี actionable runbook (ไม่ใช่ noise)

---

## 🧭 Decision Framework (skeleton)

### Deploy strategy
- **Hotfix** → emulator test → staging deploy → prod (with rollback ready)
- **Feature** → preview channel → staging → canary → prod
- **Schema migration** → backwards-compatible 2-phase deploy (deploy code → migrate data → cleanup)

### Rollback decision
- Error rate spike > 5% หรือ p95 latency > 2x → auto-rollback
- Business metric drop → manual decision

### CI/CD tier
- Pre-commit: lint + typecheck (< 30s)
- PR: smoke tests (< 2 min)
- Main merge: full unit + integration (< 15 min)
- Nightly: full E2E + perf regression

---

## 📏 Quality Bar (skeleton)

| มิติ | Senior | Principal |
|------|--------|-----------|
| Deploy safety | Manual deploy | Automated + rollback verified |
| CI duration | All-in-one | Tiered + parallelized |
| Observability | Errors only | Errors + p95 latency + business metrics |
| Runbook | None | Per-alert runbook + on-call rotation |

---

## ⚠️ Anti-Patterns (template — evidence pending)

- **AP-1:** Deploy without rollback path tested
- **AP-2:** All-in-one CI (slow PR feedback)
- **AP-3:** Alert noise (alerts without runbook → ignored)
- **AP-4:** Schema migration in single deploy (no rollback for breaking change)
- **AP-5:** Secret in `firebase.json` หรือ committed env files

---

## 🛠️ Tech Stack
- **Deploy:** Firebase CLI + GitHub Actions
- **Hosting:** Firebase Hosting (FE) + Cloud Run (functions Gen 2)
- **Monitoring:** Cloud Logging + Cloud Monitoring + Sentry (error tracking)
- **Secrets:** Google Secret Manager (NOT env files)

---

## 🤝 Cross-Role Boundaries

| Role | Boundary |
|------|----------|
| Nova | Nova = code. Cosmos = deploy + infra |
| Lyra | Lyra = Windsurf tooling. Cosmos = Firebase tooling |
| Sirius | Sirius = test design. Cosmos = CI execution |
| Orion | Cosmos consult Orion สำหรับ infra architecture |

---

## 📚 Required Reading
- `team/roles/cosmos.md`
- Firebase Hosting + Cloud Functions deploy docs
- GitHub Actions + Firebase CLI integration

---

## 🔄 When to Use
- Deploy strategy design
- CI/CD pipeline tuning
- Rollback planning
- Observability setup
- Secret management

---

## 📝 Authoring Notes
- **Author:** Luna 🌙 (skeleton)
- **Version:** 2026-04-27-v0.1
- **Next rewrite trigger:** Cosmos ทำ deploy task จริง 1 ครั้ง
