---
description: รัน Luna auto-archive (manual trigger) — archive daily logs > 14 วัน + repo-index cleanup
when_to_use: ใช้เมื่อ SessionStart เตือนว่ามี daily log ค้างเกิน 14 วัน หรือก่อนรัน /weekly-retro
argument-hint: "[-CheckOnly]"
allowed-tools: Bash
model: haiku
---

รัน auto-archive script:

```
powershell.exe -NoProfile -File "$HOME/.claude/luna-workspace/scripts/auto-archive.ps1" $ARGUMENTS
```

**ตัวอย่าง:**
- `/luna-archive` → archive จริง
- `/luna-archive -CheckOnly` → ตรวจ + warn อย่างเดียว (PowerShell switch — **ห้ามใช้ `--check-only`**)

**สิ่งที่ทำ:**
- Daily logs เก่ากว่า 14 วัน → `Luna/team/daily/_archived/YYYY-MM/` + อัพเดต `INDEX.md`
- repo-index folders ที่ไม่ถูกแตะเกิน 90 วัน → `repo-index/_archived/`
- เตือนถ้า repo-index > 5 MB หรือ CLAUDE.md > 200 บรรทัด
- Log บันทึกที่ `luna-workspace/Luna/logs/YYYY-MM-DD-auto-archive.log`

**หมายเหตุ:**
- `-CheckOnly` เป็น read-only จริงตั้งแต่ 2026-08-07 — ไม่สร้างโฟลเดอร์ ไม่เขียน log และพิมพ์เฉพาะบรรทัดที่ต้องลงมือทำ (stdout ของ SessionStart hook ถูก inject เป็น context)
- การ snapshot hypothesis/insights ถูกถอดออกจาก script เมื่อ 2026-07-23 พร้อมกับการ retire ระบบนั้น

แนะนำ: รันก่อน `/weekly-retro`
