# Proposed Hooks

> ⚠️ **ใช้ไม่ได้ใน opencode (2026-10-28)** — snippet ด้านล่างเป็นรูปแบบ `settings.json` ของ Claude Code และ skill `update-config` ไม่มีใน opencode · hooks ของลูน่าจะทำเป็น plugin `plugins/luna-hooks` (เฟส 2 — Lyra กำลังทำ) · เก็บไฟล์นี้ไว้เป็นแนวคิด/ประวัติ

*Hook config ที่แนะนำ (เดิม Claude Code) — ให้พี่แมนใช้ skill `update-config` apply ถ้าต้องการ*

---

## Hook 1: Decision Log Reminder (Stop Hook)

### จุดประสงค์
เตือน Luna ทุกครั้งที่ session จบ ว่า "ถ้ามี decision / learning / feedback ใน session นี้ → อย่าลืมบันทึก decision log"

### Config Snippet

```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "echo '[LUNA HOOK] Session ending — check: any decisions, learnings, or feedback to log? If yes, write to <repo>/Luna/team/daily/YYYY-MM-DD.md before closing.'"
          }
        ]
      }
    ]
  }
}
```

### Exit Code Semantics
- **Exit 0:** Hook ran successfully, Claude resumes normal stop flow
- **Exit 2** (หรือ JSON `{"decision":"block"}`): block การจบ turn — ต้องเช็ค `stop_hook_active` กัน loop
- **Exit อื่นที่ไม่ใช่ 0/2:** non-blocking error (แสดง stderr แต่ไม่ block)

### วิธี Apply
1. เรียกใช้ skill `update-config`
2. บอกว่า "เพิ่ม Stop hook เพื่อเตือน decision log"
3. Skill จะอ่าน settings.json ปัจจุบันและ merge config ให้

### หมายเหตุ
- Hook นี้ใช้ `echo` เท่านั้น — ปลอดภัย ไม่แก้ไฟล์ใดๆ
- Luna ยังต้องตัดสินใจเองว่า session นี้มี D1-D4 ไหม — hook แค่ remind
- ถ้าต้องการ hook ที่ block จนกว่า Luna จะ confirm → ต้องใช้ exit code 2 (feedback to Claude) แต่อาจทำให้ session close ช้า

---

## Hook 2 (Optional): Pre-Tool Read Reminder

### จุดประสงค์
ก่อน Bash tool ทำงาน — remind Luna ว่า "check ว่ามี safer tool ไหม (Grep/Glob/Read)"

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "echo '[LUNA HOOK] Using Bash — confirm no dedicated tool (Grep/Glob/Read/Edit) can do this instead?'"
          }
        ]
      }
    ]
  }
}
```

### หมายเหตุ
- Hook นี้จะ trigger ทุก Bash call — อาจ verbose เกินไปถ้ามี Bash calls มาก
- แนะนำ apply เฉพาะช่วง training / ไม่แนะนำสำหรับ production sessions

---

## Hook 3 (Optional): Subagent Memory Reminder (SubagentStop)

### จุดประสงค์
เมื่อ role (subagent) ทำงานเสร็จ → log เตือนว่า "role บันทึก learning ลง memory แล้วหรือยัง"
เสริม learning loop (memory instruction อยู่ใน agent body แล้ว — hook นี้เป็น safety net)

### Config Snippet
```json
{
  "hooks": {
    "SubagentStop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "echo '[LUNA HOOK] Subagent finished — did the role update its agent-memory with new patterns/learnings?'"
          }
        ]
      }
    ]
  }
}
```

### หมายเหตุ
- `SubagentStop` fire เมื่อ subagent จบ (matcher = agent type name, ว่าง = ทุก role)
- ใช้ `echo` เท่านั้น — ปลอดภัย
- Memory instruction อยู่ใน agent body แล้ว → hook นี้เป็น optional reinforcement
- ต้องเช็คว่า Desktop App รองรับ SubagentStop hook ไหม (อาจเป็น CLI feature)

---
*สร้าง 2026-05-25: Phase 3 — proposal เท่านั้น ยังไม่ apply*
*อัปเดต 2026-05-29: เพิ่ม Hook 3 (SubagentStop memory reminder)*
