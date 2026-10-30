---
name: luna-audit
description: เรียก Polaris audit Luna System (compliance + quality + learning-loop health) — ใช้เมื่อพี่แมนขอ "ตรวจระบบลูน่า", "audit Luna", "ระบบเป็นยังไงบ้าง", "health check" หรือรอบ quarterly audit
---

เรียก **Polaris** ด้วย task tool (subagent `polaris`) ให้ทำ audit

**ก่อนเรียก:** Polaris ไม่มี Bash จึงอ่าน mtime/ขนาดไฟล์เองไม่ได้ — ให้ลูน่ารัน Bash เก็บตัวเลขที่ข้อ 3 และ 6 ต้องใช้ (mtime ของ `agent-memory/*/`, จำนวนบรรทัด CLAUDE.md, ขนาด `luna-workspace/repo-index/`) แล้วแนบไปใน brief · สั่ง Polaris ให้เขียนรายงานจากหลักฐานที่มีก่อนหมด turn (`maxTurns: 40`)

**Scope:**
1. **Persona + Tier compliance** — ลูน่าตอบเป็นลูน่า (ไทย, ลงท้าย ค่ะ/คะ, 🌙) ไหม · ประกาศ tier ก่อนงาน Tier 2+ ไหม · เลือก tier ถูกไหม (ไม่ default ไป Tier 3)
2. **Role invocation** — เรียก Role ตรงสายไหม / ข้ามไหม / ใช้ Tier 3 กับงานที่ Tier 1 พอไหม
3. **Learning loop health** — `agent-memory/<role>/` role ไหนสด role ไหน dormant · role ไหนไม่เคยเขียนเลย
4. **Central memory** — `memory/MEMORY.md` has stale, wrong, or duplicate entries; has the monthly consolidation run?
5. **Decision log coverage** — 7 วันล่าสุดมี session ที่ควรมี log แต่ไม่มีไหม (เทียบกับ `Luna/logs/worklog-*.tsv`)
6. **Context economy** — AGENTS.md size (เพดาน 200 บรรทัด), repo-index size, ไฟล์ใหญ่ผิดปกติ
7. **Doc drift** — จำนวน role / ชื่อไทย / model-effort tier ตรงกับ `agents/*.md` ไหม

**Evidence sources:**
- `~/.config/opencode/AGENTS.md`
- `~/.config/opencode/agents/*.md` — ความจริง runtime ของ role/model/effort
- `~/.config/opencode/agent-memory/<role>/` — per-role learning
- `~/.config/opencode/memory/MEMORY.md`
- `~/.config/opencode/luna-workspace/Luna/team/daily/` (active root — **ห้าม** recurse เข้า `_archived/`)
- `~/.config/opencode/luna-workspace/Luna/logs/worklog-*.tsv` — หลักฐานอัตโนมัติว่าแตะไฟล์อะไรวันไหน
- `~/.config/opencode/luna-workspace/Luna/retrospective/`

> ระบบ hypothesis/insights/preferences **retired 2026-07-23** — ห้ามอ้างอิงไฟล์พวกนี้ ของเก่าอยู่ใน `Luna/archive/`

**Output:**
- Audit report (severity: Critical / High / Medium / Low)
- Evidence path สำหรับแต่ละ finding — **ห้าม finding ที่ไม่มี path อ้างอิง**
- Recommended actions พร้อม reversibility (R0/R1/R2)
- บันทึกที่ `luna-workspace/team/audits/YYYY-Www-audit.md` (ใช้ ISO week ให้เรียงกับ audit เดิม)
