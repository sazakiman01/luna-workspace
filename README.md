# Luna System for OpenCode

ระบบผู้ช่วย AI สำหรับ OpenCode ที่รวม persona ของ Luna, ทีม specialist, guardrails ด้านความปลอดภัย และ workflow สำหรับงานพัฒนาซอฟต์แวร์

> เหมาะสำหรับผู้ใช้ Gosoft ที่มีสิทธิ์ใช้งาน Gosoft LLM gateway และ GitHub repository นี้

## ระบบนี้ช่วยอะไรได้บ้าง

- ประสานงานงานด้วย **Luna** และเลือกใช้ specialist ตามประเภทงาน
- มี **14 roles** เช่น Business Analyst, Frontend/Backend Developer, QA, DevOps และ System Architect
- ใช้การเลือกระดับงาน (4-Tier) เพื่อไม่เรียก agent เกินความจำเป็น
- มี guardrails สำหรับการแก้ไขที่มีความเสี่ยง, secret/PII และการใช้ MCP
- เก็บ memory แยกส่วนกลาง, รายโปรเจกต์ และราย role โดยไม่เผยแพร่ข้อมูลใช้งานส่วนตัวผ่าน Git
- มี skill สำหรับ review และคำสั่งช่วยงาน เช่น daily log, weekly retrospective และ system audit

## ติดตั้ง

> หากมี `~/.config/opencode` ใช้งานอยู่แล้ว ให้สำรองข้อมูลก่อน หรือ clone ลงโฟลเดอร์ชั่วคราวเพื่อตรวจสอบไฟล์ก่อนนำไปรวม

```powershell
git clone https://github.com/sazakiman01/luna-workspace.git "$env:USERPROFILE\.config\opencode"
```

จากนั้นตั้งค่า environment variable `LITELLM_KEY` ของตนเองผ่านช่องทางที่ทีมอนุมัติ แล้วเปิด OpenCode ในโฟลเดอร์โปรเจกต์

## ทดสอบ

พิมพ์ใน OpenCode:

- `สวัสดี Luna`
- `คนในทีมมีใครบ้าง`

## ใช้กับโปรเจกต์ใหม่

```powershell
& "$env:USERPROFILE\.config\opencode\luna-workspace\templates\Setup-LunaRepo.ps1" -RepoPath "D:\coding\MyProject"
```

## คู่มือและสถาปัตยกรรม

- [คู่มือเริ่มต้นฉบับเต็ม](luna-workspace/README.md)
- [System vs Data architecture](luna-workspace/ARCHITECTURE.md)
- [Team configuration](luna-workspace/team/team-config.md)

## ข้อมูลสำคัญด้านความปลอดภัย

- Repository นี้เก็บเฉพาะไฟล์ระบบที่ portable และ **ไม่** เก็บ secret, API key, memory, daily log หรือข้อมูลใช้งานส่วนตัว
- ห้าม commit ค่า `LITELLM_KEY` หรือ credential อื่นลง repository
- อ่านกฎการจัดการข้อมูลได้ที่ [rules/data-handling.md](rules/data-handling.md)

---

*ระบบนี้เป็นเครื่องมือช่วยงาน ผู้ใช้งานยังเป็นผู้ตรวจทานและรับผิดชอบผลลัพธ์สุดท้าย*
