---
name: generate-arch-json
description: Use this skill when creating or updating an `architecture.json` file — ผังสถาปัตยกรรมระบบสำหรับนำเข้า sys-blueprint เป็นชิ้นงาน ARCH-nn (ระบบ · การเชื่อมต่อ · มุมมองหลายแบบ · สถานการณ์การไหลของข้อมูล). Triggers on "สร้าง architecture.json", "ทำผังสถาปัตยกรรม", "generate arch json", "ร่างผังระบบ", "แผนผังการเชื่อมต่อระบบ", "system architecture diagram", "อัปเดตผังสถาปัตยกรรม", or any request to draft/refresh that file. Delegates to Orion, who has the extraction checklist preloaded.
---

# architecture.json Generator Skill

**Delegate ให้ subagent `orion`** ด้วย task tool

`architecture.json` = ไฟล์เดียวที่บอกว่า **ระบบไหนคุยกับระบบไหนด้วยอะไร** และ **ข้อมูลไหลยังไง**
→ นำเข้า sys-blueprint เป็นชิ้นงาน `ARCH-nn` แล้วทีมกดดูเป็นผังได้ (ADR-0039)
ต่างจาก BPMN ที่ตอบเรื่อง "กระบวนการทำงานของคน" — ไฟล์นี้ตอบเรื่อง "โครงของระบบ"

**ส่งไปใน prompt:** repo path หรือแหล่งข้อมูล (absolute) + ว่าเป็นการสร้างใหม่หรืออัปเดตของเดิม
+ ขอบเขต (ระบบเดียว/ทั้ง landscape) + ถ้ามี `DOC-nn`/BPMN/ไฟล์ deploy ที่ถือเป็นแหล่งความจริง ให้ระบุ

**สั่ง Orion ให้อ่าน `reference.md` ข้าง SKILL.md นี้ก่อนเริ่ม** — มี schema เต็ม + extraction
checklist + สัญญากับ viewer (รูปที่ตัวอ่านของ sys-blueprint รับได้)

**จุดที่ Orion ต้องสกัด:**
- ระบบที่มีจริง — จาก repo (service/module), เอกสารสถาปัตยกรรม, ไฟล์ deploy (`docker-compose`, k8s, `firebase.json`)
- การเชื่อมต่อจริง — grep base URL / client SDK / queue topic / ตาราง integration ในเอกสาร
  · **โพรโทคอลต้องมาจากหลักฐาน** ไม่ใช่เดาจากชื่อระบบ
- เจ้าของ/ทีม/วงจรชีวิต — จากเอกสารหรือถามผู้ใช้ · ไม่รู้ให้เว้นว่าง **ห้ามแต่ง**
- สถานการณ์การไหล (`flows`) — ลำดับขั้นจริงของงานสำคัญ 1-3 เรื่อง (เช่น "สร้างสัญญา", "อนุมัติ + ส่งออก")

**กฎเหล็ก (NO MAGIC):** ทุกระบบ/การเชื่อมต่อต้องมีที่มาอ้างอิงได้ (`file:line` หรือชื่อเอกสาร + หัวข้อ)
— ถ้าไม่มีหลักฐานว่าเชื่อมกันจริง **ห้ามลากเส้น** · ของที่เดาให้ใส่ `"status"` ว่างและบอกในรายงานแทน

**กฎความปลอดภัย:** ห้ามใส่ credential/token/รหัสผ่าน/connection string ที่มีรหัสผ่านลงไฟล์นี้เด็ดขาด
(`endpoint` ใส่ได้เฉพาะ host/path ที่ไม่มีความลับ) — ไฟล์นี้ถูกอัปโหลดเข้าระบบกลางที่ทีมทุกคนอ่านได้

**Output:** `architecture.json` (ตำแหน่งที่ผู้ใช้ระบุ · ถ้าไม่ระบุให้วางที่ root ของ repo)
**Return กลับมา:** executive summary สั้นๆ — จำนวนระบบ/การเชื่อมต่อ/มุมมอง/สถานการณ์
+ จุดที่ไม่มีหลักฐานพอและเว้นว่างไว้ + สิ่งที่ต้องให้คนยืนยัน
