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

---

## 🌐 opencode Instruction Load Order (2026-10-28)

```
โหลดอัตโนมัติทุก session:
1. ~/.config/opencode/AGENTS.md                     ← persona, 4-Tier summary, team table
2. `instructions` ใน ~/.config/opencode/opencode.json (ตามลำดับ):
   - rules/luna-guardrails.md                      ← R0/R1/R2, guardrails, brief template
   - rules/data-handling.md                        ← data classification + secret/PII
   - memory/MEMORY.md                              ← ดัชนี memory ส่วนกลาง (opencode ไม่มี auto-memory)

ไม่ auto-load (ลูน่าเปิดอ่านเอง):
3. ~/.config/opencode/project-memory/<slug>/MEMORY.md  ← เริ่มงานใน repo
4. luna-workspace/rules/luna-core.md, team-protocol.md ← อ่านเมื่อจำเป็น

ไฟล์ระดับ repo ที่ opencode โหลดเอง: ยังไม่ยืนยัน
```

- *เดิม (Claude Code): `~/.claude/CLAUDE.md` + `~/.claude/rules/*.md` + auto-memory · ระดับ repo `<repo>/CLAUDE.md` + `<repo>/.claude/rules/*.md` (`paths:`)*
- เพดาน: AGENTS.md ≤ 200 บรรทัด และ context มีแค่ 128k → เพิ่มใน `instructions` เฉพาะที่ต้องใช้ทุกครั้ง (`auto-archive.ps1` เตือนผ่าน plugin luna-hooks แล้ว ✅)
- procedure ยาวๆ ควรเป็น **skill** (โหลดตอนใช้) ไม่ใช่ rule (โหลดตลอด)

**Shared between opencode Desktop + CLI (`opencode-cli`):**
- `~/.config/opencode/AGENTS.md` — global rules
- `~/.config/opencode/opencode.json` — model, instructions, permissions, MCP (`mcp.servers`)
- `~/.config/opencode/skills/`, `commands/` — skills + command wrapper
- `~/.config/opencode/agents/` — subagents
- hooks → plugin `plugins/luna-hooks` (ทำงานแล้ว ✅ — SessionStart/PostToolUse/Stop)

**Migration Note:** `.clauderules` (Windsurf legacy) → `CLAUDE.md` (archived 2026-08-07 เพราะ Claude Code ไม่อ่านมัน และเนื้อหาขัดกับ 4-Tier) → `~/.config/opencode/AGENTS.md` (ย้ายไป opencode 2026-10-28 · `~/.claude` = fallback ห้ามลบ)


**Use cases:**
- **ย้ายเครื่องใหม่:** zip ทั้งชุด → ได้ทั้ง system + data (ดู Scenario 1)
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
| `team/roles/` | role definitions (จำนวน: ดู `team/team-config.md`) | ✅ ย้ายทั้ง folder |
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
| `Luna/retrospective/` | **retro ทุกฉบับอยู่ที่นี่ที่เดียว** (รวมจาก team retro 2026-08-07 · team retro แยกไฟล์ retired 2026-08-17) | ⚠️ optional (history) |
| `~/.config/opencode/memory/` (Luna ส่วนกลาง) + `project-memory/<slug>/` | central + per-project feedback/learnings (แทน hypothesis/insights/preferences.md — retired 2026-07-23 → `Luna/archive/`) | 🟡 recommended |
| `~/.config/opencode/agent-memory/<role>/` | per-role learnings (path เขียนไว้ใน `agents/<role>.md`) | 🟡 recommended |
| `Luna/claude-updates.md` | Claude Code update notes (ประวัติก่อนย้ายไป opencode) | ⚠️ optional |
| `team/audits/` | audit reports | ⚠️ optional (history) |
| `team/case-studies/` | real case studies | 🟡 recommended (knowledge) |
| ~~`team/retrospective/`~~ | retired 2026-08-17 — มีแต่ README 15 สัปดาห์ · ย้ายไป `Luna/archive/2026-08-team-retrospective-retired/` | — |
| `team/performance.md` | current scores | ⚠️ reset on new machine |
| ~~`team/health-dashboard.md`~~ | archived 2026-08-07 — snapshot ที่แก้มือแล้วค้าง 2 เดือน · ใช้ `luna-dashboard` (scan อัตโนมัติ) แทน | — |
| `team/skill-gap-analysis.md` | gap analysis | ⚠️ optional |
| `team/onboarding.md` | onboarding instance | ⚠️ optional |
| `plans/` | active plans | ⚠️ optional (may be stale) |
| `repo-index/` | per-repo state | ⚠️ optional |
| `team/_archived/` | archived files | ⚠️ optional |

### 🔗 MIXED — Template Start → Data Fill

| Path | เริ่มต้น | หลังใช้งาน |
|------|----------|-----------|
| `team/preferences/<role>.md` | ⚠️ **retired 2026-07-23** — ยังอยู่บนดิสก์เพราะ `team/context/*.md` และ `*-principal-skill.md` ยังอ้างถึง · learning จริงไปอยู่ที่ `~/.config/opencode/agent-memory/<role>/` | ไม่ต้องเติม |
| `team/<role>/performance-metrics.md` | template structure | เติม metrics |

---

## 🚀 Export Scenarios

### Scenario 1: ย้ายเครื่อง (ทุกอย่าง)

⚠️ **git คลุมแค่บางส่วน** — `~/.config/opencode/` เป็น git repo (branch `opencode`) แบบ allowlist: ใน `luna-workspace/` track เฉพาะ README, ARCHITECTURE, `rules/`, `scripts/`, `workflows/`, `templates/`, `governance/`, `team/team-config.md`, `team/roles/` · **DATA (`Luna/`, `plans/`, memory ฯลฯ) ไม่อยู่ใน git** (ดู `~/.config/opencode/.gitignore`)

```powershell
# zip ทั้งชุด (FileShare::ReadWrite เพราะไฟล์ log อาจถูก lock ชั่วคราว)
Compress-Archive -Path "$env:USERPROFILE\.config\opencode\luna-workspace" `
                 -DestinationPath "<ปลายทาง>\luna-$(Get-Date -f yyyyMMdd).zip"
```

> **ไม่มี backup อัตโนมัติสำหรับ DATA** — การลบไฟล์ที่ไม่ได้ track ใน `luna-workspace/` กู้ไม่ได้
> เพราะงั้นการ cleanup ทุกครั้งให้ **ย้ายเข้า `Luna/archive/`** ไม่ใช่ลบ (นโยบายตั้งแต่ 2026-08-07)

### Scenario 2: ให้คนอื่นใช้ (เฉพาะ system)
```powershell
# ใช้ export script
& "$env:USERPROFILE\.config\opencode\luna-workspace\templates\Export-LunaSystem.ps1" -OutputPath "D:\luna-export"
```
→ ได้เฉพาะ SYSTEM files + empty DATA folders

### Scenario 3: Reset fresh (keep system, clear data)
```powershell
# ใช้ reset script
& "$env:USERPROFILE\.config\opencode\luna-workspace\templates\Reset-LunaData.ps1"
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
