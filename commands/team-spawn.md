---
description: Tier 4 — spawn agent team ทำงานขนาน (CLI เท่านั้น) พร้อม fallback ไป /team-delegate อัตโนมัติ
when_to_use: ใช้กับงาน cross-layer ที่ต้องหลายมุมมองพร้อมกัน (FE+BE+DB+QA) หรือ parallel review · Desktop App / VS Code panel จะ fallback ไป /team-delegate เสมอ
argument-hint: "<task description>"
allowed-tools: Agent, Read, Bash
---

# /team-spawn

**Usage:** `/team-spawn <task description>`

สั่งให้ Luna spawn agent team สำหรับงานที่ระบุ — ตรวจ environment อัตโนมัติและ fallback ไป subagent mode ถ้าไม่พร้อม

---

## ขั้นตอน

1. **ตรวจ environment:**
   - ตรวจว่ารันใน CLI หรือ Desktop App / VS Code panel
   - ถ้า CLI: ตรวจ `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` env var
   - ถ้า Desktop App / VS Code panel หรือ env var ไม่ได้เปิด → **fallback ทันที**

2. **ถ้า environment ไม่พร้อม (fallback — เป็นเส้นทางปกติบนเครื่องนี้):**
   ```
   Agent Teams ไม่พร้อม (Desktop App / VS Code panel / env var ไม่ได้เปิด)
   Fallback ไป subagent mode — เรียก /team-delegate แทน
   ```
   จากนั้น invoke `/team-delegate` กับ task เดิม

   > `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` **ไม่ได้ตั้งไว้โดยตั้งใจ** — Desktop App / VS Code panel (ที่พี่แมนใช้เป็นหลัก ตั้งแต่ 2026-10-08 = VS Code) ใช้ Agent Teams ไม่ได้หรือยังไม่ยืนยัน และ Tier 4 ≈ 1% ของงาน · fallback คือพฤติกรรมที่ถูกต้อง ไม่ใช่ bug

3. **ถ้า environment พร้อม (Agent Teams mode):**
   - วิเคราะห์ task → เลือก role ที่เหมาะสม (3-5 teammates สูงสุด)
   - อ่านเกณฑ์เลือก tier จาก CLAUDE.md section "4-Tier Delegation"
   - อ่าน best practices จาก `luna-workspace/workflows/agent-teams-mode.md`
   - สร้าง spawn prompt สำหรับแต่ละ teammate ที่ระบุ:
     - Task ที่ชัดเจน (ไม่ overlap กัน)
     - Expected output format
     - Report back criteria
   - Spawn teammates พร้อม spawn prompt
   - ติดตาม task list (Ctrl+T ใน in-process mode)

4. **รวมผลลัพธ์:**
   - รอ teammate ทุก role เสร็จ
   - Luna สังเคราะห์ผลรวม
   - เสนอ consolidated report ให้พี่แมน
   - บันทึก daily log ถ้ามี decision/learning/feedback (อย่าจดถ้าเป็นแค่ activity)

---

## ตัวอย่าง

```
/team-spawn review PR #142 feature payment-flow จาก 3 มุมมอง
```

ผลลัพธ์:
- ตรวจ environment
- ถ้าพร้อม: spawn Nova (backend) + Stella (frontend) + Nebula (data model) พร้อมกัน
- ถ้าไม่พร้อม: fallback ไป `/team-delegate` เรียก role ตาม domain หลัก

---

## หมายเหตุ

- Agent Teams = CLI v2.1.32+ เท่านั้น
- Windows = in-process mode (ไม่มี split-pane)
- Token cost สูงกว่า subagent mode — ใช้เมื่อจำเป็นจริงๆ
- รายละเอียด: `luna-workspace/workflows/agent-teams-mode.md`
