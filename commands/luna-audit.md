---
description: เรียก Polaris audit Luna System (compliance + quality + learning-loop health)
when_to_use: ใช้เมื่อพี่แมนขอ "ตรวจระบบลูน่า", "audit Luna", "ระบบเป็นยังไงบ้าง", "health check" หรือรอบ quarterly audit
model: opus
effort: high
allowed-tools: Agent, Read, Glob, Grep
---

เรียก **Polaris** ด้วย Agent tool (`subagent_type=polaris`) ให้ทำ audit

**ก่อนเรียก:** Polaris ไม่มี Bash จึงอ่าน mtime/ขนาดไฟล์เองไม่ได้ — ให้ลูน่ารัน Bash เก็บตัวเลขที่ข้อ 3 และ 6 ต้องใช้ (mtime ของ `agent-memory/*/`, จำนวนบรรทัด CLAUDE.md, ขนาด `luna-workspace/repo-index/`) แล้วแนบไปใน brief · สั่ง Polaris ให้เขียนรายงานจากหลักฐานที่มีก่อนหมด turn (`maxTurns: 40`)

**Scope:**
1. **Persona + Tier compliance** — ลูน่าตอบเป็นลูน่า (ไทย, ลงท้าย ค่ะ/คะ, 🌙) ไหม · ประกาศ tier ก่อนงาน Tier 2+ ไหม · เลือก tier ถูกไหม (ไม่ default ไป Tier 3)
2. **Role invocation** — เรียก Role ตรงสายไหม / ข้ามไหม / ใช้ Tier 3 กับงานที่ Tier 1 พอไหม
3. **Learning loop health** — `agent-memory/<role>/` role ไหนสด role ไหน dormant · role ไหนไม่เคยเขียนเลย · entry ไหนไม่มี Evidence / ขัดกัน · feedback เรื่องเดิมซ้ำ ≥ 2 (เกณฑ์+ตัวชี้วัด: `luna-workspace/rules/team-protocol.md` → Continuous Learning)
4. **Central memory** — `projects/<project>/memory/MEMORY.md` มี entry ค้าง/ผิด/ซ้ำไหม · consolidation รายเดือนรันหรือยัง
5. **Decision log coverage** — 7 วันล่าสุดมี session ที่ควรมี log แต่ไม่มีไหม (เทียบกับ `Luna/logs/worklog-*.tsv`)
6. **Context economy** — CLAUDE.md size (เพดาน 200 บรรทัด), repo-index size, ไฟล์ใหญ่ผิดปกติ
7. **Doc drift** — จำนวน role / ชื่อไทย / model-effort tier ตรงกับ `agents/*.md` ไหม

**Evidence sources:**
- `~/.claude/CLAUDE.md`
- `~/.claude/agents/*.md` — ความจริง runtime ของ role/model/effort
- `~/.claude/agent-memory/<role>/` — per-role learning
- `~/.claude/projects/<project>/memory/MEMORY.md`
- `~/.claude/luna-workspace/Luna/team/daily/` (active root — **ห้าม** recurse เข้า `_archived/`)
- `~/.claude/luna-workspace/Luna/logs/worklog-*.tsv` — หลักฐานอัตโนมัติว่าแตะไฟล์อะไรวันไหน
- `~/.claude/luna-workspace/Luna/retrospective/`

> ระบบ hypothesis/insights/preferences **retired 2026-07-23** — ห้ามอ้างอิงไฟล์พวกนี้ ของเก่าอยู่ใน `Luna/archive/`

**Output:**
- Audit report (severity: Critical / High / Medium / Low)
- Evidence path สำหรับแต่ละ finding — **ห้าม finding ที่ไม่มี path อ้างอิง**
- Recommended actions พร้อม reversibility (R0/R1/R2)
- บันทึกที่ `luna-workspace/team/audits/YYYY-Www-audit.md` (ใช้ ISO week ให้เรียงกับ audit เดิม)
