<div align="center">

# 🌙 Luna System

**หนึ่งแชท · สิบสี่มืออาชีพ · ทำงานเป็นระบบและปลอดภัยกว่าเดิม**

ผู้ช่วย AI ประจำทีมพัฒนาซอฟต์แวร์ — รันบน **OpenCode v2** + **Gosoft LLM Gateway** บนเครื่อง Windows ของคุณเอง

พูดคุยกับ **"ลูน่า"** คนเดียว — เธอวิเคราะห์งาน เลือก specialist ที่ใช่ แจกงาน รวมผล รายงานกลับ
และ **ไม่เคยทำสิ่งที่ถอยกลับไม่ได้ โดยไม่ถามคุณก่อน**

`14 specialist roles` · `4-Tier delegation` · `R0–R2 guardrails` · `3-layer memory` · `11 skills` · `5 commands` · `3 plugins` · `3 MCP servers`

</div>

> 🔒 **ใครใช้ได้:** เฉพาะผู้ที่มีสิทธิ์ใช้ Gosoft LLM gateway และ repository นี้ · ระบบออกแบบให้ติดตั้งที่ `%USERPROFILE%\.config\opencode` บน **Windows**

---

## 📖 อ่านหน้านี้แค่ไหนก็ได้

| มีเวลา | อ่านส่วนไหน | จบแล้วรู้อะไร |
|---|---|---|
| **2 นาที** | สแกนหัวข้อ + ตารางทุกตาราง | Luna ทำอะไรได้บ้าง ปลอดภัยแค่ไหน ทีมมีใคร |
| **10 นาที** | + Tier workflow · Safety · Memory | รู้วิธีทำงานจริง ขอบเขตที่ AI ห้ามเกิน |
| **พร้อมลงมือ** | [ติดตั้ง](#-ติดตั้ง-10-นาที) → [ตรวจสอบ](#-ตรวจสอบหลังติดตั้ง) → [เริ่มโปรเจกต์](#-เริ่มใช้กับโปรเจกต์ของคุณ) | ใช้งานได้จริงวันนี้ |

---

## 🎬 ทำไมทีมถึงสร้าง Luna

| ปัญหาที่เจอตอนใช้ AI ทำงาน | Luna ตอบด้วย |
|---|---|
| 🌀 แต่ละคนใช้ AI สไตล์ต่างกัน — คำตอบไม่คงเส้นคงวา ไม่รู้บริบททีม | 🧭 **Persona + กฎกลาง + memory** — ทุกคนได้คุณภาพงานแบบเดียวกัน และ Luna จำบริบทโปรเจกต์/ความชอบของคุณข้าม session |
| 😱 กลัว AI ทำพลาษใหญ่ — deploy ผิด, ลบไฟล์, ส่ง secret หลุด | 🛡️ **Guardrails R0–R2 + permission enforcement + อนุมัติทุกครั้ง** — งานถาวรต้องผ่านคุณก่อนเสมอ |
| 🕳️ ความรู้ที่คุยกับ AI หายไปพร้อม session | 🧠 **Memory 3 ชั้น + decision log + retro** — ทุก decision/learning/feedback ถูกบันทึกและนำกลับมาใช้ |

> 💡 **นึกภาพง่ายๆ:** Luna เหมือน**เลขาส่วนตัวที่มีทีม specialist 14 คนอยู่เบื้องหลัง** — คุณคุยกับเลขาคนเดียว แต่ได้กำลังของทั้งแผนก

---

## 🧭 Luna ทำงานยังไง

```
คุณ
 │  พิมพ์คุยผ่านแชทเดียว
 ▼
🌙 LUNA — interface เดียวของระบบ
 │  วิเคราะห์งาน → เลือก "tier" ที่ถูกที่สุดที่จบงานได้
 ├─ Tier 1 · งานเล็ก ──────── ลูน่าทำเองเลย            (~80% ตามนโยบาย)
 ├─ Tier 2 · งาน review ──── โหลด skill + checklist    (~15%)
 └─ Tier 3 · งานใหญ่ ─────── เรียก subagent specialist (~5%)
 ▼
รายงานผลกลับคุณ + บันทึก decision log + memory
```

**กฎเหล็ก:** ทุกงาน Tier 2 ขึ้นไป ลูน่า**ประกาศ tier ที่เลือก + เหตุผลก่อนลงมือ** และเปิดทางให้คุณ override เสมอ — ไม่มีการแอบส่งงานใหญ่ให้ subagent โดยไม่บอก

| Tier | ใช้เมื่อ | ตัวอย่าง |
|---|---|---|
| **1 · Luna Direct** | ถาม-ตอบ, สรุป, แปล, อธิบาย code, edit ≤ 10 บรรทัด | "อธิบาย transaction นี้ทำงานยังไง" |
| **2 · Skill** | งาน review ที่มี checklist สำเร็จรูป | `frontend-review` · `backend-api-review` · `bpmn-review` · `audit-form-review` |
| **3 · Subagent** | code > 30 บรรทัด · multi-file refactor · architecture/design decision · specialist deep dive | "ออกแบบ schema ใหม่" → **Nebula** + **Orion** ตรวจ |
| ~~4 · Agent Teams~~ | *(OpenCode ไม่มี feature นี้)* | ใช้ Tier 3 หลาย role ขนานกันแทน |

งาน **critical** (security / schema / money / migration / production) → ต้องมี **human-in-the-loop + ให้ agent อื่น verify** เสมอ (เช่น ให้ Sirius ตรวจงานที่ Nova เขียน)

---

## 👥 ทีม specialist — 14 roles จริงใน runtime

> นิยามจริงอยู่ที่ `agents/*.md` (frontmatter `mode: subagent`) · รายละเอียด mapping งาน: [`luna-workspace/team/team-config.md`](luna-workspace/team/team-config.md)

| กลุ่ม | Role | ตำแหน่ง | ดูแลเรื่อง |
|---|---|---|---|
| 🔍 **วิเคราะห์ & ออกแบบ** | **Galaxy** (กัลยา) | Business Analyst | Requirements, business analysis |
| | **Orion** (อริย) | System Architect | Architecture, system design |
| | **Vega** (วิกา) | UI/UX Designer | UX, accessibility, naming, branding |
| | **Nebula** (นภา) | Database Designer | Schema, index, data modeling |
| ⚙️ **พัฒนา** | **Nova** (โนวา) | Backend Developer | API, Cloud Functions, Firestore, integration |
| | **Stella** (สเตลลา) | Frontend Developer | React, LIFF, UI implementation |
| | **Cosmos** (กสิณ) | DevOps Engineer | Deploy, CI/CD, monitoring |
| | **Comet** (โคเมต) | BPMN/Camunda Expert | Workflow, process design |
| ✅ **คุณภาพ & ตรวจสอบ** | **Sirius** (ศิริ) | QA Engineer | Test strategy, E2E, verification |
| | **Polaris** (โพลาริส) | Luna System Auditor | Compliance, quality, learning-loop audit |
| 💼 **ธุรกิจ & เฉพาะทาง** | **Atlas** (อัฐ) | Business & Finance Advisor | Cost, pricing, ROI, strategy |
| | **Vela** (วีล่า) | Embroidery Specialist | งานปัก, production, ตลาดรับปักไทย |
| | **Rigel** (ริเจล) | AI Agent Engineer | AgentCore prompt/model/eval tuning |
| 🧰 **ระบบ Luna เอง** | **Lyra** (ไลรา) | Tooling | Agents, skills, commands, plugins, config |

**Model routing (provider `gosoft` เท่านั้น — ล็อกด้วย policy):**

| กลุ่ม model | Roles | ค่าตั้งต้น | ทำไม |
|---|---|---|---|
| **think** | Orion, Nova, Nebula, Polaris, Atlas, Galaxy, Rigel, Sirius | `gothink2` (สลับ `gothink3` ได้) | งานคิดหนัก/ออกแบบ — verifier ต้องไม่อ่อนกว่า worker |
| **dev** | Stella, Vega, Comet, Cosmos, Vela | `godev1` (สลับ `godev1–3` ได้) | งาน implement |
| **inherit** | Lyra | ตาม agent หลัก | ทำงานคู่กับลูน่า |

ทุก model: context **128k** / output **16k** — สลับ model ราย role ด้วย `luna-workspace/scripts/set-role-model.ps1`

> 🧑‍💼 **Luna = interface เดียว** — role อื่นไม่คุยกับคุณโดยตรง ลูน่าเป็นคนเรียก รวมผล และรายงานกลับ

---

## ⚙️ ความสามารถที่มีจริง (ทั้งหมด trace ได้ถึง config)

| ระบบ | ทำอะไร | หลักฐานใน repo |
|---|---|---|
| 🎯 **4-Tier delegation** | เลือกวิธีทำงานที่ถูกที่สุดต่องาน ประกาศก่อนลงมือ | `AGENTS.md` · `rules/luna-guardrails.md` |
| 🛡️ **Guardrails R0–R2** | แยกงานตาม "ถอยกลับได้แค่ไหน" — งานถาวรต้อง confirm | `rules/luna-guardrails.md` |
| 🔐 **Permission enforcement** | ล็อก provider, บล็อกอ่านไฟล์ secret, สั่ง shell อันตรายต้องถามก่อน | `opencode.json → policies` + `permissions` |
| 🔌 **MCP (DS / DV / KM)** | เรียก tools งานออกแบบ/พัฒนา/ความรู้องค์กร Gosoft — **อนุมัติรายครั้ง** | `opencode.json → mcp` · `rules/mcp-routing.md` |
| 🧩 **Skills** | Checklist review โหลดเมื่อใช้ — ไม่กิน context ตลอดเวลา | `skills/` (11 skills) |
| ⌨️ **Commands** | `/daily-log` `/weekly-retro` `/luna-audit` `/luna-archive` `/team-delegate` | `commands/` (5 commands) |
| 🪝 **luna-hooks plugin** | SessionStart reminder · บันทึกงานอัตโนมัติ · เตือนเมื่อลืม log | `plugins/luna-hooks/index.ts` |
| 🧠 **Memory 3 ชั้น** | ส่วนกลาง / รายโปรเจกต์ / ราย role — จำข้าม session | `memory/` · `project-memory/` · `agent-memory/` |
| 📋 **Decision log + retro** | บันทึก decision/learning/feedback + สรุปรายสัปดาห์ + audit | `Luna/team/daily/` · workflows |
| 🚀 **Project onboarding** | สคริปต์ติดตั้ง Luna ลงโปรเจกต์ใหม่ในคำสั่งเดียว | `luna-workspace/templates/*.ps1` |

<details>
<summary><b>🔧 เจาะลึก: luna-hooks ทำอะไรบ้าง (คลิกดู)</b></summary>

แทน hooks ของ Claude Code ด้วย plugin ของ OpenCode v2 — ทั้งหมดรันผ่าน `powershell.exe`:

| Hook | ทำงานเมื่อ | หน้าที่ |
|---|---|---|
| **SessionStart** | ก่อน prompt แรกของแต่ละวัน | เตือน daily log ค้างเกิน 14 วัน (`auto-archive.ps1`) · session reminders · inject ดัชนี project memory ให้ model เห็นอัตโนมัติ |
| **PostToolUse** | หลัง AI แก้ไฟล์ทุกครั้ง | บันทึกหลักฐานงานลง worklog (subagent ก็นับ) |
| **Stop / log-gate** | จบ turn ของ main session | ถ้ามี decision/learning ที่ควรบันทึกแต่ยังไม่ได้จด → ปลุก session ให้ลูน่าเตือนคุณ |

หลักการ: hook **ไม่เคย block งาน** และ **ไม่ใช่ผู้ตัดสินใจแทนคน** — เป็นเพียงระบบเตือนและเก็บหลักฐาน · error ทั้งหมด log ที่ `luna-workspace/Luna/logs/plugin-errors.log`

</details>

<details>
<summary><b>🔌 เจาะลึก: MCP servers และกฎการใช้ (คลิกดู)</b></summary>

3 servers ผ่าน Gosoft agent-gateway (ใช้ `LITELLM_KEY` ของคุณ):

| Server | ช่วยงาน | ตัวอย่าง route |
|---|---|---|
| **DS** | Design/พัฒนาเอกสาร | ร่าง HLDD/LLDD, pre-fill ITSM form, ตรวจ estimation, IaC, gate evidence |
| **DV** | Development | โค้ดจาก LLDD, test design/writer, วิเคราะห์ SIT failure, QC handover |
| **KM** | ความรู้องค์กร | ถาม-ตอบเรื่องระบบ/บริการ/เอกสาร IT ของ GOSOFT/CP ALL + Dynatrace logs |

**กฎ (บังคับ):** เรียกได้**หลังคุณอนุมัติเป็นรายครั้งเท่านั้น** · ต้องมี input ครบตาม route · ข้อมูล Confidential ต้อง mask ก่อน · 🚫 ห้ามส่ง Restricted (credential, PII จริง, สัญญา, ข้อมูลการเงิน) — รายละเอียด: [`rules/mcp-routing.md`](rules/mcp-routing.md)

</details>

---

## 🛡️ Safety Model — AI ที่รู้ขอบเขตตัวเอง

### 1️⃣ ทุกงานถูกแบ่งตามความ "ถอยกลับได้" (Reversibility)

| ระดับ | ความหมาย | ตัวอย่าง | Luna ทำยังไง |
|---|---|---|---|
| 🟢 **R0** ถอยง่าย | undo ได้ทันที | อ่านไฟล์, แก้ draft | ทำเลย |
| 🟡 **R1** ถอยยาก | กู้คืนได้แต่เสียแรง | refactor หลายไฟล์, แก้ config, migration ที่ rollback ได้ | ทำแล้ว**รายงาน** (ทำอะไร + ถอยยังไง) |
| 🔴 **R2** ถอยไม่ได้ | ถาวร / นอกการควบคุม | prod deploy, ลบข้อมูล, rotate secret, **commit/push**, ส่งงานออกนอกองค์กร, จ่ายเงิน | **หยุด → ท้วง (DISSENT) → รอคุณ confirm เสมอ** |

### 2️⃣ บังคับด้วย config จริง ไม่ใช่แค่คำสัญญา

| กลไก | อะไรถูกคุม |
|---|---|
| `policies` ล็อก provider | ใช้ได้**เฉพาะ `gosoft`** — ส่งงานไป provider ภายนอกไม่ได้เด็ดขาด |
| `permissions` บล็อกอ่าน | `.env`, `*credentials*`, `*.key`, `*.pem`, `service.json`, `auth.json` ฯลฯ |
| `permissions` สั่ง shell ต้องถาม | `git commit/push/reset --hard`, `Remove-Item`, `deploy`, `npm publish`, `rm/del/erase` ทุกรูปแบบ |
| MCP routing rule | เรียก MCP tool ต้องผ่านอนุมัติรายครั้ง |

> ⚠️ **ข้อเท็จจริงที่ต้องรู้:** permission เป็น**ชั้นเสริม ไม่ใช่กำแพง** — shell และ grep เลี่ยงได้ (ทดสอบแล้ว) → **อย่าเก็บ secret จริงไว้ใน workspace ที่ agent เข้าถึงได้** ใช้ environment variable แทนไฟล์

### 3️⃣ ข้อมูลจัดประเภทก่อนส่งเข้า model เสมอ

| ระดับ | ตัวอย่าง | ส่ง AI ได้ไหม |
|---|---|---|
| 🟢 Public / 🔵 Internal | เอกสารเปิด, code โครงสร้างทั่วไป | ✅ |
| 🟠 Confidential | ข้อมูลลูกค้า, business logic เฉพาะ, ต้นทุน | ⚠️ mask/dummy ก่อน |
| 🔴 Restricted | credential, PII จริง, สัญญา, ข้อมูลการเงิน | ❌ เด็ดขาด |

### 4️⃣ คนคือเจ้าของผลลัพธ์

> 👤 **Accountability:** ผลงานทุกชิ้น **คุณคือผู้รับผิดชอบสุดท้าย** — Luna และทีมเป็น*ผู้ช่วยร่าง* · code ที่ AI สร้างต้องผ่าน review ก่อนใช้ · งานส่งภายนอก mark ว่า "ช่วยโดย AI ตรวจทานโดยคน" เมื่อเหมาะสม

---

## 🧠 Memory & Learning Loop — จำได้ ฉลาดขึ้นทุกสัปดาห์

```
~/.config/opencode/
├── memory/MEMORY.md            ← ส่วนกลาง (โหลดอัตโนมัติทุก session)
├── project-memory/<slug>/      ← รายโปรเจกต์ (luna-hooks inject ให้เมื่อเปิดงานใน repo)
└── agent-memory/<role>/        ← ราย role (specialist จำ pattern งานของตัวเอง)
```

**วงจรเรียนรู้:**

```
ทำงาน ─▶ decision / learning / feedback ─▶ daily log (Luna/team/daily/)
  ▲                                              │
  │                                    memory 3 ชั้น + case study
  │                                              │
  └──── session หน้า ใช้ความรู้เดิมต่อ ◀── /weekly-retro สรุปรายสัปดาห์
                                                 │
                                    /luna-audit — Polaris ตรวจระบบรอบใหญ่
```

- **บันทึกเฉพาะ** decision / learning / feedback — *ไม่บันทึก activity ว่าทำอะไรไป* (กัน noise)
- ลืมจด → **log-gate เตือนอัตโนมัติ**หลังจบ turn (ผ่าน luna-hooks)
- ลูน่าแก้ไขตาม feedback คุณ → บันทึกเป็น memory type `feedback` **ทันที** → ใช้ถูกตั้งแต่ครั้งต่อไป

---

## 🚀 ติดตั้ง (10 นาที)

**สิ่งที่ต้องมี:** OpenCode Desktop/CLI **v2** · Windows ที่เปิด `powershell.exe` ได้ · สิทธิ์ Gosoft LLM gateway · `LITELLM_KEY` ของตัวเอง

> ⚠️ ถ้ามี `~/.config/opencode` ใช้งานอยู่แล้ว → **สำรองและตรวจ diff ก่อน** · ห้ามแชร์/commit `service.json`, `auth.json`, `.env`, memory และ log ส่วนตัว

**1. Clone ไปที่ profile ของคุณ**

```powershell
git clone -b opencode https://github.com/sazakiman01/luna-workspace.git "$env:USERPROFILE\.config\opencode"
```

**2. ตั้ง `LITELLM_KEY` ของตัวเอง** — ผ่านช่องทางที่ทีมอนุมัติ (environment variable)

> 🔑 **ห้าม**ฝังคีย์ลง `opencode.json` — config อ่านจาก `{env:LITELLM_KEY}` อยู่แล้ว การแก้ไฟล์เพื่อใส่คีย์ = เสี่ยง leak คีย์ลง git

**3. เปิด OpenCode** ที่โฟลเดอร์โปรเจกต์ของคุณ — จบ ✅

---

## ✅ ตรวจสอบหลังติดตั้ง

ปรับ `$cli` ให้ตรงตำแหน่งที่ติดตั้ง แล้วรันจาก `$env:USERPROFILE\.config\opencode`:

```powershell
$cli = 'C:\Path\To\opencode-cli.exe'
& $cli debug config      # config โหลดได้
& $cli debug agents      # 14 agents โหลดครบ
& $cli api plugin.list   # luna-hooks, opencode-dcp, ponytail = active
& $cli api command.list  # 5 commands
& $cli api skill.list    # skills ที่ติดตั้ง
```

**Smoke test ปลอดภัย:**

```powershell
& $cli run --standalone "คนในทีมมีใครบ้าง" < $null
```

ตอบรายชื่อทีมได้ = พร้อมใช้ 🎉 *(ใช้ Git Bash ให้เติม `MSYS_NO_PATHCONV=1` ก่อน `api` command)*

---

## 📁 เริ่มใช้กับโปรเจกต์ของคุณ

```powershell
& "$env:USERPROFILE\.config\opencode\luna-workspace\templates\Setup-LunaRepo.ps1" -RepoPath "D:\coding\MyProject"
```

สคริปต์สร้าง `.opencode/project-context.md` + โครงสร้าง `Luna/` ให้ → เติม tech stack และบริบทที่**ส่งได้อย่างปลอดภัย**ลง `project-context.md` → เปิด OpenCode ที่โฟลเดอร์นั้น

<details>
<summary><b>🧰 คำสั่งจัดการระบบเพิ่มเติม (คลิกดู)</b></summary>

| ต้องการ | คำสั่ง |
|---|---|
| Export ระบบให้เพื่อนร่วมทีมเริ่มใช้ (ได้เฉพาะ SYSTEM ไม่รวม data ส่วนตัว) | `Export-LunaSystem.ps1 -OutputPath "D:\luna-export"` |
| ย้ายเครื่อง | `git clone` (SYSTEM) + zip ย้าย DATA แยก — ดู [`luna-workspace/ARCHITECTURE.md`](luna-workspace/ARCHITECTURE.md) |
| Backup (เดือนละครั้ง / ก่อนอัปเดตใหญ่) | `Compress-Archive -Path "$env:USERPROFILE\.config\opencode" -DestinationPath "D:\backup\luna-$(Get-Date -Format yyyyMMdd).zip"` ⚠️ zip มี `service.json`/`auth.json` — เก็บในที่ปลอดภัย ห้ามแชร์ |
| Reset ข้อมูลเริ่มใหม่ (SYSTEM อยู่ครบ, DATA ล้าง + backup อัตโนมัติ) | `Reset-LunaData.ps1 -Confirm` |

</details>

---

## ❓ FAQ — ถามก่อนที่ทุกคนถาม

<details>
<summary><b>ใช้กับ macOS / Linux ได้ไหม?</b></summary>

ไม่แนะนำ — `luna-hooks` รันผ่าน `powershell.exe` และออกแบบ/ทดสอบบน Windows โดยเฉพาะ (โครงสร้าง path, encoding ภาษาไทย ฯลฯ)

</details>

<details>
<summary><b>ต้องใช้ API key อะไร ไปไหนมาไหม?</b></summary>

`LITELLM_KEY` (สิทธิ์ Gosoft LLM gateway) — ขอผ่านช่องทางที่ทีมอนุมัติ ตั้งเป็น environment variable ของตัวเอง ห้ามฝังใน config/ไฟล์ใดๆ ที่ agent อ่านได้

</details>

<details>
<summary><b>Luna จะ deploy / commit / push เองโดยไม่ถามได้ไหม?</b></summary>

ไม่ได้ — ทั้งเป็น R2 (ถอยไม่ได้) และถูก `permissions` บังคับเป็นชั้น `ask` ทั้ง policy และ technical enforcement คุมคู่กัน

</details>

<details>
<summary><b>ข้อมูลลับของโปรเจกต์ปลอดภัยไหม?</b></summary>

มี 4 ชั้นป้องกัน: (1) นโยบาย provider เฉพาะ `gosoft` (2) permission บล็อกอ่านไฟล์ secret (3) กฎ MCP routing อนุมัติรายครั้ง + ห้ามส่ง Restricted (4) data classification ก่อนส่งทุกครั้ง — แต่ขั้นสุดท้ายคือ**วินัยของคน**: อย่าวาง secret ใน workspace ที่ agent เข้าถึงได้

</details>

<details>
<summary><b>Luna ไม่รู้ tech stack โปรเจกต์ / ตอบไม่ตรง?</b></summary>

เติม `<repo>/.opencode/project-context.md` แล้วบอกลูน่าให้อ่าน หรือให้บันทึกลง `project-memory/<slug>/` — ครั้งต่อไปเธอเห็นเองตั้งแต่เปิด session

</details>

<details>
<summary><b>อ่านคู่มือ OpenCode ที่ไหน?</b></summary>

ใช้เวอร์ชัน v2 เท่านั้น: `https://opencode.ai/v2/docs` — เอกสารหลักบางส่วนยังเป็น v1 ซึ่งต่างจาก config ที่ระบบใช้จริง

</details>

---

## ⚠️ ข้อจำกัดที่เราบอกตรงๆ

- **Windows only** — hooks ทั้งระบบพึ่ง PowerShell
- **OpenCode v2 เท่านั้น** — บน v1 config/hook/plugin ทั้งชุดนี้ไม่ทำงาน
- **ไม่มี Agent Teams** (แบบ Claude Code) — งานขนานใช้ Tier 3 เรียกหลาย subagent แทน
- **ไม่มี auto-memory ในตัว** — ลูน่าจัดการ memory เองผ่านไฟล์ + plugin inject
- **Context 128k / output 16k ทุก model** — งานใหญ่ต้อง split ให้ subagent ทำรายส่วน
- **Hook = ผู้เตือน ไม่ใช่ผู้ตัดสินใจ** — ทุก gate ยังต้องมีคนกด confirm
- **Permission deny เลี่ยงได้ผ่าน shell** (ทดสอบแล้ว) — จึงเป็นชั้นเสริม ไม่ใช่กำแพงเด็ดขาด

---

## 📚 เอกสารอ้างอิง

| อยากรู้เรื่อง | ไฟล์ |
|---|---|
| 📖 คู่มือผู้เริ่มต้น (ฉบับเต็ม) | [`luna-workspace/README.md`](luna-workspace/README.md) |
| 🏗️ สถาปัตยกรรม System vs Data | [`luna-workspace/ARCHITECTURE.md`](luna-workspace/ARCHITECTURE.md) |
| 👥 Team config + mapping งาน → role | [`luna-workspace/team/team-config.md`](luna-workspace/team/team-config.md) |
| 🛡️ Guardrails เต็ม (R0–R2, DISSENT, brief template) | [`rules/luna-guardrails.md`](rules/luna-guardrails.md) |
| 🔒 Data classification + PDPA | [`rules/data-handling.md`](rules/data-handling.md) |
| 🔌 MCP routing policy | [`rules/mcp-routing.md`](rules/mcp-routing.md) |
| 📋 Workflows ทั้งหมด | [`luna-workspace/workflows/README.md`](luna-workspace/workflows/README.md) |
| ⚖️ Governance (AI ใช้อย่างรับผิดชอบ) | [`luna-workspace/governance/`](luna-workspace/governance/) |

---

## 🌙 พร้อมเริ่มแล้วหรือยัง

**ถัดไปของคุณคือ:** [ติดตั้งใน 10 นาที](#-ติดตั้ง-10-นาที) → [ตรวจสอบ](#-ตรวจสอบหลังติดตั้ง) → เปิด OpenCode ที่โปรเจกต์ แล้วพิมพ์ว่า *"สวัสดีลูน่า"* 🌙

---

*ระบบนี้เป็นเครื่องมือช่วยงาน — ผู้ใช้คือผู้ตรวจทานและรับผิดชอบผลลัพธ์สุดท้ายเสมอ*
