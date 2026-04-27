# Luna Workspace Architecture — System vs Data Separation

*Designed by **Orion** (System Architect) — Phase 5+ portability enhancement*
*Created: 2026-04-27*

---

## 🎯 หลักการ

```
luna-workspace/
├── 🔧 SYSTEM (portable)     ← ย้ายข้ามเครื่องได้ ไม่เปลี่ยน
├── 📊 DATA (dynamic)         ← เกิดจากการใช้งาน เปลี่ยนทุกวัน
└── 🔗 MIXED (template→data)  ← เริ่มเป็น template ว่าง เติมข้อมูลระหว่างใช้
```

**Use cases:**
- **ย้ายเครื่องใหม่:** clone repo → ได้ทั้ง system + data (history)
- **ให้คนอื่นใช้:** export เฉพาะ SYSTEM → เขาเริ่ม data ใหม่
- **Reset fresh:** ลบ DATA → keep SYSTEM → เริ่มต้นใหม่สะอาด

---

## 📋 File Classification Map

### 🔧 SYSTEM — Portable Core (ไม่เปลี่ยนตามการใช้งาน)

| Path | คือ | ย้ายข้ามเครื่อง |
|------|-----|----------------|
| `rules/` | กฎหลักของ Luna | ✅ ย้ายทั้ง folder |
| `templates/` | แม่แบบทุกชนิด (daily-log, skill, case-study, scoring-rubric, etc.) | ✅ ย้ายทั้ง folder |
| `workflows/` | workflow definitions ทุกตัว | ✅ ย้ายทั้ง folder |
| `team/roles/` | role definitions (12 roles) | ✅ ย้ายทั้ง folder |
| `team/team-config.md` | team structure config | ✅ |
| `team/decision-global-vs-per-repo.md` | decision framework | ✅ |
| `team/onboarding-template.md` | onboarding template | ✅ |
| `team/<role>/skills/*-principal-skill.md` | principal skill ของแต่ละ role | ✅ |
| `team/<role>/skills/*-skill.md` | basic skill ของแต่ละ role | ✅ |
| `team/<role>/skills/*/` | skill packages (e.g. stella/frontend-repo-review/) | ✅ |
| `team/<role>/knowledge/` | role knowledge files | ✅ |
| `team/<role>/learning-paths.md` | learning paths | ✅ |
| `knowledge-package-generic/` | universal coding principles | ✅ ย้ายทั้ง folder |
| `knowledge-package-pmam/` | PMAM-specific standards | ✅ (ถ้าใช้ PMAM) |
| `Luna/skills/` | Luna's own principal skill | ✅ |
| `README.md` | onboarding guide | ✅ |
| `ARCHITECTURE.md` | this file | ✅ |
| `.gitignore` | git config | ✅ |

### 📊 DATA — Dynamic (เกิดจากการใช้งาน เปลี่ยนทุกวัน)

| Path | คือ | ย้ายข้ามเครื่อง |
|------|-----|----------------|
| `Luna/team/daily/` | daily logs | ⚠️ optional (history) |
| `Luna/retrospective/` | Luna retros | ⚠️ optional |
| `Luna/hypothesis.md` | evolving hypotheses | ⚠️ optional (learning state) |
| `Luna/insights.md` | confirmed patterns | 🟡 recommended (valuable learnings) |
| `Luna/preferences.md` | learned preferences | 🟡 recommended (behavioral tuning) |
| `Luna/windsurf-updates.md` | Windsurf update notes | ⚠️ optional |
| `team/audits/` | audit reports | ⚠️ optional (history) |
| `team/case-studies/` | real case studies | 🟡 recommended (knowledge) |
| `team/retrospective/` | team retros | ⚠️ optional |
| `team/performance.md` | current scores | ⚠️ reset on new machine |
| `team/health-dashboard.md` | system health | ⚠️ reset on new machine |
| `team/skill-gap-analysis.md` | gap analysis | ⚠️ optional |
| `team/onboarding.md` | onboarding instance | ⚠️ optional |
| `plans/` | active plans | ⚠️ optional (may be stale) |
| `repo-index/` | per-repo state | ⚠️ optional |
| `team/_archived/` | archived files | ⚠️ optional |

### 🔗 MIXED — Template Start → Data Fill

| Path | เริ่มต้น | หลังใช้งาน |
|------|----------|-----------|
| `team/preferences/<role>.md` | ว่าง (จาก _TEMPLATE.md) | เติม learnings จากงานจริง |
| `team/<role>/performance-metrics.md` | template structure | เติม metrics |

---

## 🚀 Export Scenarios

### Scenario 1: ย้ายเครื่อง (ทุกอย่าง)
```powershell
# git clone ปกติ — ได้ทั้ง system + data + history
git clone <repo-url> "$env:USERPROFILE\.windsurf\luna-workspace"
```

### Scenario 2: ให้คนอื่นใช้ (เฉพาะ system)
```powershell
# ใช้ export script
& "$env:USERPROFILE\.windsurf\luna-workspace\templates\Export-LunaSystem.ps1" -OutputPath "D:\luna-export"
```
→ ได้เฉพาะ SYSTEM files + empty DATA folders

### Scenario 3: Reset fresh (keep system, clear data)
```powershell
# ใช้ reset script
& "$env:USERPROFILE\.windsurf\luna-workspace\templates\Reset-LunaData.ps1"
```
→ ลบ DATA files + reset MIXED files กลับเป็น template ว่าง

---

## 📊 Size Breakdown (estimate)

| Category | Files | % of repo |
|----------|-------|-----------|
| 🔧 SYSTEM | ~80 files | ~65% |
| 📊 DATA | ~30 files | ~25% |
| 🔗 MIXED | ~15 files | ~10% |

---

## 🔗 References

- `README.md` — onboarding guide (section "ใช้ Luna บนเครื่องอื่น")
- `templates/Export-LunaSystem.ps1` — export script
- `templates/Reset-LunaData.ps1` — reset script

---
*Orion — System Architecture Decision | Reviewed by Luna*
