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

### หลักการ
แต่ละ role มี **persistent memory** ของตัวเอง (`memory: user` → `~/.config/opencode/agent-memory/<role>/`)
Claude inject `MEMORY.md` เข้า context อัตโนมัติทุกครั้งที่ role ทำงาน — ไม่ re-discover สิ่งที่เคยรู้

### กฎ

**ก่อนเริ่มงาน:**
Role ทบทวน memory ตัวเอง (auto-inject) — ใช้ pattern / gotcha ที่เคยเจอ

**หลังจบงานสำคัญ:**
Role บันทึก learning ลง memory ตัวเองแบบกระชับ:
- decision + เหตุผล
- pattern / anti-pattern
- gotcha / limitation
- library / path สำคัญ

**หลัง task พลาด / verify ไม่ผ่าน (immediate reflection — Reflexion):**
Role เขียน reflection 1-2 บรรทัดลง memory **ทันที** (ไม่รอ weekly):
- ครั้งหน้าทำต่างออกไปยังไง + why
- เป็น verbal learning ที่ใช้เป็น context รอบถัดไป

**Luna ไม่ต้อง gate ทุก entry** — role จัดการ memory ตัวเอง (native mechanism)
แต่ pattern ที่เป็น **cross-role / สำคัญระดับทีม** → Luna บันทึกใน Claude memory tool ส่วนกลางด้วย

**Quarterly review:**
Polaris distill memory + decision logs → ดู `luna-workspace/workflows/quarterly-audit.md`

---
*อัปเดต 2026-05-25: Phase 1 — เปลี่ยนจาก "บังคับ delegate ทุก domain" เป็น 4-Tier Delegation*
*อัปเดต 2026-05-29: เปลี่ยน Continuous Learning เป็น native `memory:` field (Claude Code spec)*
