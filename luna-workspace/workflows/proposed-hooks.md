# Proposed Hooks

*Hook config ที่แนะนำ — ให้พี่แมนใช้ skill `update-config` apply ถ้าต้องการ*

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

## Hook 3: Subagent Memory Gate (PreToolUse บน SubagentHandback) — ✅ ติดตั้งแล้ว 2026-10-13

**ทำอะไร:** role ส่งรายงานโดยไม่มีบรรทัด `🧠 Memory: ...` → ปฏิเสธพร้อมถามเรื่องบทเรียนที่มีหลักฐาน → role บันทึก (ถ้ามี) + เติมบรรทัด → ส่งใหม่ผ่าน
**ทำไมไม่ใช้ SubagentStop:** ทดสอบใน Desktop แล้ว SubagentStop ยิงหลัง `SubagentHandback` → `block` ไม่ทำให้ role ทำงานต่อ
**Script:** `luna-workspace/scripts/memory-gate.ps1` · กรองเฉพาะ role ใน `agents/*.md` (regex ใน script — เพิ่ม/retire role ต้องแก้ด้วย) · fail-safe ปล่อยผ่านเมื่อ error · log: `Luna/logs/memory-gate-YYYY-MM.tsv` · debug: `LUNA_GATE_DEBUG=1`

```json
{
  "PreToolUse": [
    {
      "matcher": "^SubagentHandback$",
      "hooks": [
        {
          "type": "command",
          "command": "powershell.exe -NoProfile -File \"$HOME/.claude/luna-workspace/scripts/memory-gate.ps1\"",
          "timeout": 10,
          "shell": "bash"
        }
      ]
    }
  ]
}
```

**ผลทดสอบ:** vela ถูกปฏิเสธ 1 ครั้ง → ส่งใหม่สำเร็จ · Explore ผ่านโดยไม่ถูกบล็อก

---
*อัปเดต 2026-05-29: เพิ่ม Hook 3 (SubagentStop memory reminder)*
*อัปเดต 2026-10-13: Hook 3 → PreToolUse gate บน SubagentHandback (ติดตั้ง + ทดสอบแล้ว) แทน SubagentStop*
