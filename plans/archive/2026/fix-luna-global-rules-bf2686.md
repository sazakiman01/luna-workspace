# Fix: Luna ไม่ตอบเมื่อเปิดแชทใหม่ (Global Rules Path ผิด)

แก้ปัญหา Cascade ตอบแทน Luna โดยเติม Luna persona/rules ลงในไฟล์ global rules จริงของ Windsurf ที่ `C:\Users\sansakritsuk\.codeium\windsurf\memories\global_rules.md` (ปัจจุบันว่างเปล่า 0 bytes)

## 🔍 Root Cause

| สิ่งที่พี่แมนตั้ง | ตำแหน่งจริงที่ Windsurf อ่าน |
|---|---|
| `C:\Users\sansakritsuk\.windsurf\rules\luna-core.md` (4,680 B) | ❌ Windsurf ไม่อ่านจากตรงนี้ |
| `C:\Users\sansakritsuk\.windsurf\rules\team-protocol.md` (1,873 B) | ❌ |
| `C:\Users\sansakritsuk\.windsurf\rules\project-detect.md` (5,228 B) | ❌ |
| `C:\Users\sansakritsuk\.codeium\windsurf\memories\global_rules.md` | ✅ **แต่เป็นไฟล์เปล่า 0 bytes** |

**ผลลัพธ์:** เปิดแชทใหม่ → ไม่มี Luna persona → default เป็น Cascade

**ทำไมครั้งก่อนๆ ยังเป็น Luna:** Memory system ดึง memories เก่าของ Luna (persona, pattern) มาเสริม context แต่แชทใหม่ที่ fresh ไม่ได้ดึงทุกตัว โดยเฉพาะถ้าไม่ match keyword

## 🎯 กลยุทธ์แก้

**ข้อจำกัด:** Windsurf `global_rules.md` มี limit ~6,000 chars. ไฟล์ Luna รวมกัน ~11.8 KB → เกิน. ต้อง condense.

**แนวทาง:** ย่อส่วน essential (persona + core pattern) ลงใน `global_rules.md` แล้วให้ Luna อ่านไฟล์ละเอียดเพิ่มที่ `C:\Users\sansakritsuk\.windsurf\rules\*.md` เมื่อจำเป็น

## 📋 ขั้นตอนแก้ไข

### Step 1: เขียน `global_rules.md` (essential only, ~5,500 chars)
ไฟล์: `C:\Users\sansakritsuk\.codeium\windsurf\memories\global_rules.md`

เนื้อหาต้องครอบคลุม:
1. **Luna Identity** — ผู้หญิง 30, เพื่อนของพี่แมน, ตอบไทย, ลงท้าย 🌙, เรียก "พี่แมน"
2. **พี่แมน profile** — ESFJ-A 40, ชอบแผนชัด/ระบบ, ไม่ชอบกำกวม
3. **Critical Pattern** — 5 ขั้น: เลือกทีม → ประกาศ → Role ทำ → Luna รีวิว → สรุป + log
4. **Path Convention (ย่อ)** — global vs per-repo paths
5. **Pointer ไปไฟล์ละเอียด:** ให้ Luna อ่าน `C:\Users\sansakritsuk\.windsurf\rules\luna-core.md`, `team-protocol.md`, `project-detect.md` เมื่อต้องรู้เพิ่ม
6. **Pointer ไปไฟล์ทีม:** `C:\Users\sansakritsuk\.windsurf\team\team-config.md` + `roles/*.md`

### Step 2: ทดสอบ
- พี่แมนเปิดแชทใหม่ใน UniformFlow → ทักลูน่าดู
- ถ้ายังเป็น Cascade → restart Windsurf (reload global rules)
- ทดสอบเปิด repo อื่นด้วย (ยืนยันว่า global ทำงาน cross-repo)

### Step 3: บันทึก decision + feedback
- `d:\coding\UniformFlow\Luna\decisions.md` — ADR: Windsurf global rules อยู่ที่ `.codeium/windsurf/memories/global_rules.md` ไม่ใช่ `.windsurf/rules/`
- `d:\coding\UniformFlow\Luna\feedback.md` — บันทึกปัญหา + วิธีแก้สำหรับ future reference
- `C:\Users\sansakritsuk\.windsurf\Luna\windsurf-updates.md` — note Windsurf path convention

### Step 4: Update `luna-core.md` (optional)
เพิ่ม note ว่าไฟล์ actual global rules อยู่ที่ `.codeium/windsurf/memories/global_rules.md` (เผื่อ migration ครั้งหน้า)

## ⚠️ ข้อควรระวัง

- **Char limit 6,000:** ต้องย่อเนื้อหา ห้ามใส่ทุกอย่าง
- **ไม่แตะ** `C:\Users\sansakritsuk\.windsurf\rules\*.md` (ยังใช้เป็น detailed reference ได้)
- **ไม่ลบ** memories เก่าใน DB (ยังมีประโยชน์)

## ✅ Success Criteria

- เปิดแชทใหม่ใน UniformFlow → ลูน่าตอบด้วยบุคลิกลูน่า (ไทย + 🌙 + เรียก "พี่แมน")
- เปิดแชทใหม่ใน repo อื่น → ลูน่ายังเป็นลูน่า
- ลูน่ารู้จักทีม 10 Role เมื่อถูกเรียก
