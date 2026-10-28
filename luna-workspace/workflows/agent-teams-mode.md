# Agent Teams Mode — Workflow

*สร้าง 2026-05-25 — ใช้คู่กับ `rules/team-protocol.md` และ `CLAUDE.md` decision tree*

---

## ข้อกำหนดก่อนใช้งาน

| ข้อกำหนด | รายละเอียด |
|---------|-----------|
| CLI version | Claude Code CLI v2.1.32 ขึ้นไป (`claude --version`) |
| Env var | `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` |
| Platform | Windows = in-process mode เท่านั้น (ไม่รองรับ split-pane/tmux) |
| Desktop App | ไม่รองรับ Agent Teams — ใช้ Subagent mode แทน |

---

## ขั้นตอนเปิด Agent Teams (CLI)

1. ตรวจ version:
   ```
   claude --version
   ```
   ต้องได้ v2.1.32 ขึ้นไป

2. เปิด env var ใน `settings.json`:
   ```json
   {
     "env": {
       "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
     },
     "teammateMode": "in-process"
   }
   ```
   หรือ set ก่อน run: `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude`

3. ใช้ `/team-spawn <task>` — command จะ check environment อัตโนมัติ

---

## เมื่อไหร่ใช้ Agent Teams

ใช้เมื่อต้องการ **parallel, self-coordinating work** ที่ subagent ทำได้ช้าหรือต้องการ cross-role debate:

- Parallel review จากหลาย perspective พร้อมกัน (เช่น architecture review โดย Orion + Nova + Nebula พร้อมกัน)
- Cross-layer feature ที่ต้องการ FE + BE + DB + QA ทำงานร่วมกันแบบ real-time
- Debug หลาย hypothesis แข่งกัน (spawn 2-3 teammate มา propose solution ต่างกัน)

**ไม่ใช้เมื่อ:**
- งาน focus task ที่ role เดียวทำได้ (ใช้ subagent ประหยัดกว่ามาก)
- ใช้ Desktop App (รองรับแค่ subagent)
- Token budget จำกัด (Agent Teams เพิ่ม token cost linear ตามจำนวน teammate)

---

## ตัวอย่าง Spawn Prompt สำหรับ Luna เป็น Lead

เมื่อ Luna spawn agent team ให้ระบุ spawn prompt ที่ชัดเจน:

```
Task: [ระบุงานชัดเจน]
Expected output: [ผลลัพธ์ที่ต้องการ]
Coordination: ให้แต่ละ teammate ทำงานอิสระแล้ว report ผ่าน task list
Report back: สรุปผลรวมกลับ Luna เมื่อเสร็จ
```

ตัวอย่างงานจริง:
```
Task: Review PR #142 — feature order-payment-flow
Expected output: แต่ละ role ให้ review ตามสายตัวเอง (Nova: backend safety, Stella: frontend UX, Nebula: data model)
Coordination: ทำงาน parallel, ไม่ต้องรอกัน
Report back: สรุป critical findings รวมกลับ Luna
```

---

## Best Practices (จาก Claude Code spec)

1. **จำนวน teammate:** 3-5 คนต่อ task (เกินนี้ token cost สูงมาก)
2. **Tasks ต่อ teammate:** 5-6 tasks (ไม่มากเกินไป)
3. **หลีกเลี่ยง:** ให้หลาย teammate แก้ไฟล์เดียวกันพร้อมกัน (conflict risk)
4. **Naming:** ตั้งชื่อ task ชัดเจนใน task list เพื่อ track ได้ง่าย
5. **Fallback:** ถ้า environment ไม่พร้อม ใช้ `/team-delegate` แทนเสมอ

---

## ข้อจำกัดสำคัญ

- `skills:` และ `mcpServers:` ใน agent frontmatter **ไม่ทำงาน** ใน teammate mode (load จาก project/user settings แทน)
- Agent body ของ definition จะถูก **append** เข้า system prompt ของ teammate (ไม่ทับ)
- `tools:` และ `model:` ใน frontmatter จะถูก honor ใน teammate mode
- ใน in-process mode (Windows): ไม่มี split-pane UI — ติดตามผ่าน task list (Ctrl+T)

---

*อ้างอิง: [code.claude.com/docs/en/agent-teams](https://code.claude.com/docs/en/agent-teams)*
