# Team Protocol

*กติกาการทำงานของทีม (ดู global `team/team-config.md` สำหรับ Role mapping)*

## Handoff งานระหว่าง Role

1. บันทึก status ปัจจุบัน
2. ระบุ Role ปลายทาง + context ที่ต้องรู้
3. บันทึก handoff ลง `<repo>/Luna/team/daily/YYYY-MM-DD.md`

## งานที่ต้องการหลาย Role

1. ระบุ Primary + Supporting (ดู team-config)
2. กำหนด responsibility + timeline ของแต่ละ Role
3. บันทึก `<repo>/Luna/team/daily/YYYY-MM-DD.md`

## Resolve Conflict

1. ฟัง perspective ทุก Role
2. วิเคราะห์ trade-offs
3. ตัดสินใจด้วย reasoning ชัดเจน
4. บันทึก `<repo>/Luna/decisions.md` + `<repo>/Luna/team/daily/`

## Review งาน

1. เลือก Role reviewer (เช่น Sirius สำหรับ QA, Vega สำหรับ UX)
2. ให้ context ชัดเจน
3. รับ feedback → ปรับปรุง
4. บันทึก `<repo>/Luna/team/daily/`

## สร้าง Role ใหม่ (Dynamic Role Creation)

Luna เสนอ → พี่แมน approve → Luna สร้างตาม Claude Code spec
ดู workflow เต็ม: `luna-workspace/workflows/role-creation.md`

หลักการ: ใช้ existing role ก่อนเสมอ — สร้างใหม่เฉพาะ gap จริงที่เกิดซ้ำ ≥ 2-3 ครั้ง
ตั้งชื่อ Space Theme + agent file ตาม spec (ไม่ใส่ `Agent` ใน tools, เปิด `memory: user`)

## Performance Review

- **รายสัปดาห์:** Review `<repo>/Luna/team/performance.md` → `<repo>/Luna/retrospective/weekly-YYYY-Www.md`
- **รายเดือน:** Retrospective ทั้งทีม → `<repo>/Luna/retrospective/monthly-YYYY-MM.md`

## Mode การทำงาน: 4-Tier Delegation

### กฎหลัก

✅ **Tier-based: Luna ทำเองถ้า Tier 1-2, delegate ถ้า Tier 3-4**

ห้าม default delegate ทุก domain — Luna ประเมิน tier ก่อนเสมอ

| Tier | เงื่อนไข | Luna ทำ |
|------|---------|---------|
| 1 | Q&A, edit ≤ 10 บรรทัด, quick task | ทำเอง |
| 2 | Review งาน (มี skill) | Skill trigger ก่อน |
| 3 | Code gen > 30 บรรทัด, specialist deep dive | Spawn subagent |
| 4 | Parallel multi-perspective (CLI only) | Agent Teams |

### Subagent Mode (Tier 3)
- Luna spawn Role ผ่าน Agent tool (isolated context)
- Role รายงานกลับ Luna เท่านั้น — ไม่คุยกันเอง
- **Role คืนผล ≤ 2,000 tokens** เป็น executive summary + ชี้ path ไฟล์ถ้าต้องดูลึก — ไม่ทุ่ม raw output กลับ Luna (กัน context ของ Luna บวม)
- ใช้ได้ทั้ง Desktop App และ CLI

### Agent Teams Mode (Tier 4 — CLI only)
- ต้องการ: CLI v2.1.32+, `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`
- Luna = team lead, Role อื่น = teammate
- Desktop App → fallback Tier 3 อัตโนมัติ
- ใช้ `/team-spawn <task>` เพื่อ check environment

รายละเอียด: `luna-workspace/workflows/agent-teams-mode.md`
รายละเอียด 4-tier: `luna-workspace/rules/luna-core.md`

---

## Continuous Learning

*แหล่งความจริงเดียวของหลักการเรียนรู้ — agents/*.md, luna-core.md, workflows อ้างมาที่นี่ (อิง Claude Code docs: sub-agents / memory)*

### กลไก (native ของ Claude Code)
- **Role:** `memory: user` → `~/.claude/agent-memory/<role>/` — เลือก `user` (ไม่ใช่ `project`) เพราะ role ทำงานข้ามหลาย repo · บริบทเฉพาะ repo อยู่ `<repo>/Luna/`
- **Luna ส่วนกลาง:** `~/.claude/projects/<project>/memory/` — role มองไม่เห็น memory นี้
- **โหลดอัตโนมัติแค่ `MEMORY.md` 200 บรรทัด / 25KB แรก** · topic file ไม่โหลด → อ่านเองเมื่อเกี่ยว
- เขียนด้วย Read/Write/Edit ปกติ (ไม่มี tool พิเศษ) · ต้องเปิด auto memory (default) ไม่งั้น `memory:` ไม่มีผล
- Memory = **context ไม่ใช่การบังคับ** → พฤติกรรมที่ต้องเกิดทุกครั้ง ให้ยกเป็น rule/hook

### ✅ บันทึกเมื่อ (ต้องมีหลักฐานอย่างน้อย 1 ข้อ)
1. **verify ผลแล้ว** — test/run ผ่านหรือไม่ผ่าน → บันทึกสิ่งที่ได้ผล / สาเหตุที่พลาด (ไม่ผ่าน = บันทึก **ทันที**: ครั้งหน้าทำต่างยังไง + why)
2. **พี่แมนยืนยันหรือแก้** — approve / correct / redirect · role ไม่ได้คุยกับพี่แมนตรง → **ลูน่าเป็นคนส่งต่อ**: feedback ที่เจาะจง role ใด ลูน่าเขียนลง `agent-memory/<role>/` เอง (หรือใส่ใน brief รอบถัดไปให้ role บันทึก)
3. **gotcha ที่เสียแรงเกิน 1 รอบ** — สิ่งที่ถ้ารู้ก่อนจะไม่เสียเวลา

### ❌ ห้ามบันทึก
- สิ่งที่หาได้จาก code / git / CLAUDE.md / เอกสาร (ให้ชี้ path แทน)
- activity log ("วันนี้ทำ X")
- สมมติฐานที่ยังไม่พิสูจน์ · ความเห็นที่ไม่มีผลลัพธ์รองรับ
- secret / PII / ข้อมูลลูกค้า (`rules/data-handling.md`)

### 📝 รูปแบบ
- `MEMORY.md` = **index** บรรทัดละ 1 entry: `- [หัวข้อ](file.md) — hook สั้น`
- เนื้อหาอยู่ topic file (1 ไฟล์ 1 เรื่อง):
```
<ข้อเท็จจริง/บทเรียน 1-3 บรรทัด>
**Why:** ทำไมถึงเป็นแบบนี้
**How to apply:** ครั้งหน้าใช้ยังไง / เมื่อไหร่
**Evidence:** <ที่มา: verify/พี่แมน/incident> · YYYY-MM-DD · <repo หรือ path>
```

### 🧹 ดูแลรักษา
- ก่อนเขียน **ค้นของเดิมก่อน** — มีแล้ว → แก้ไฟล์เดิม ไม่สร้างซ้ำ
- ของใหม่ขัดกับของเก่า → แก้/ลบของเก่า (อย่าปล่อยให้ขัดกัน)
- `MEMORY.md` ใกล้ 200 บรรทัด → รวม/ตัด entry
- Luna ไม่ gate ทุก entry — แต่ pattern **cross-role / ระดับทีม** Luna บันทึกซ้ำใน memory ส่วนกลาง

### 🔔 กลไกบังคับ
- **PreToolUse hook บน `SubagentHandback`** (`scripts/memory-gate.ps1`): role ส่งรายงานที่ไม่มีบรรทัด `🧠 Memory: ...` → ถูกปฏิเสธ 1 ครั้งพร้อมคำถาม "มีบทเรียนที่มีหลักฐานไหม" → บันทึก (ถ้ามี) + เติมบรรทัดแล้วส่งใหม่ · agent ที่ไม่ใช่ role ของลูน่า (Explore ฯลฯ) ผ่านเลย · fail-safe: script พัง = ปล่อยผ่าน
- ทดสอบ 2026-10-13 (Desktop): vela ถูกปฏิเสธ 1 ครั้ง → ส่งใหม่พร้อม `🧠 Memory: ไม่มีบทเรียนใหม่` ✅ · Explore ไม่ถูกบล็อก ✅
- *ไม่ใช้ SubagentStop เพราะใน Desktop ยิงหลัง handback → role ไม่ได้ทำต่อ*

### 📏 วัดว่าเก่งขึ้นจริง (weekly-retro / `/luna-audit`)
| ตัวชี้วัด | ทิศที่ดี |
|---|---|
| feedback เรื่องเดิมซ้ำ (พี่แมนต้องบอกซ้ำ) | ↓ ลดลง — ซ้ำ ≥ 2 = memory ไม่ได้ผล → แก้ entry หรือยกเป็น rule/hook |
| สัดส่วน `none` ต่อ role (จาก `Luna/logs/memory-gate-YYYY-MM.tsv`) | ดูคู่กับคุณภาพ — `none` สูงไม่ผิด ถ้างานไม่มีหลักฐานใหม่จริง · ห้ามใช้เป็นเป้าบังคับเขียน |
| entry ที่ไม่มี Evidence | 0 |
| ขนาด `MEMORY.md` | < 200 บรรทัด |

**Quarterly:** Polaris distill memory + decision logs → `workflows/quarterly-audit.md`

---
*อัปเดต 2026-05-25: Phase 1 — เปลี่ยนจาก "บังคับ delegate ทุก domain" เป็น 4-Tier Delegation*
*อัปเดต 2026-05-29: เปลี่ยน Continuous Learning เป็น native `memory:` field (Claude Code spec)*
*อัปเดต 2026-10-13: Continuous Learning = evidence-gated + index/topic file + memory gate (PreToolUse บน SubagentHandback) + ตัวชี้วัด (อิง Claude Code docs)*
