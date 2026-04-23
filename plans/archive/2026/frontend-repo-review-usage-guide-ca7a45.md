# คู่มือการใช้ Skill frontend-repo-review ใน Repo อื่น

Skill `frontend-repo-review` ที่คุณสร้างไว้สามารถใช้งานได้ 3 วิธี ขึ้นอยู่กับความต้องการ

## สถานะปัจจุบัน

Skill นี้อยู่ที่ `c:\Users\sansakritsuk\.windsurf\skill\frontend-repo-review\` ซึ่งเป็น **Global Skill** แล้ว เพราะอยู่ใน directory `~/.windsurf/` (หรือ `~/.codeium/windsurf/` ตาม spec มาตรฐาน)

**ข้อมูลสำคัญ:**
- ✅ Skill นี้ใช้งานได้ทุก workspace/repo ที่เปิดใน Windsurf แล้ว
- ✅ ไม่ต้องทำอะไรเพิ่มเติมเพื่อเรียกใช้ใน repo อื่น
- ✅ Cascade จะเห็น skill นี้อัตโนมัติจากทุก workspace

## วิธีการใช้งาน

### 1. ใช้งานอัตโนมัติ (Automatic Invocation)
Cascade จะเรียกใช้ skill นี้เองเมื่อ:
- คุณขอให้รีวิว frontend code
- คุณขอให้ตรวจสอบ PR
- คุณขอประเมินความพร้อมก่อน release

**ตัวอย่างคำสั่ง:**
```
รีวิว frontend repo นี้ให้หน่อย
ตรวจสอบ PR นี้ก่อน merge
ประเมินความพร้อมก่อนขึ้น production
```

### 2. เรียกใช้ด้วย @mention (Manual Invocation)
คุณสามารถ @mention skill โดยตรง:
```
@frontend-repo-review ช่วยรีวิว component นี้
```

### 3. ใช้จาก Cascade Panel
1. เปิด Cascade panel
2. คลิก three dots (⋮) ที่มุมขวาบน
3. เลือก "Skills"
4. จะเห็น `frontend-repo-review` ในรายการ Global Skills
5. คลิกเพื่อดูรายละเอียดหรือใช้งาน

## โครงสร้าง Skill Scopes

| Scope | Location | ความหมาย |
|-------|----------|----------|
| **Workspace** | `.windsurf/skills/` | ใช้ได้เฉพาะ project นั้น, commit ไปกับ repo |
| **Global** | `~/.windsurf/skills/` หรือ `~/.codeium/windsurf/skills/` | ใช้ได้ทุก workspace บนเครื่องคุณ |
| **System** (Enterprise) | `/etc/windsurf/skills/` (Linux) หรือ `C:\ProgramData\Windsurf\skills\` (Windows) | Deploy โดย IT, read-only |

**Skill ของคุณอยู่ที่:** `c:\Users\sansakritsuk\.windsurf\skill\frontend-repo-review\`
- ✅ นี่คือ Global Skill (ใช้ได้ทุก repo)
- ⚠️ แต่ path ไม่ตรงตาม spec มาตรฐาน (ควรอยู่ที่ `~/.codeium/windsurf/skills/`)

## สิ่งที่ไม่ต้องทำ

❌ **ไม่ต้อง copy skill ไปทุก repo** - เพราะเป็น Global Skill แล้ว
❌ **ไม่ต้องติดตั้งอะไรเพิ่ม** - Cascade จะหา skill อัตโนมัติ
❌ **ไม่ต้อง configure ใน repo อื่น** - ใช้งานได้ทันที

## การทดสอบว่า Skill ใช้งานได้

1. เปิด workspace/repo ใดก็ได้ใน Windsurf
2. เปิด Cascade panel
3. พิมพ์: `@frontend-repo-review`
4. ถ้าเห็น autocomplete แสดงว่า Cascade รู้จัก skill นี้

## ข้อแนะนำเพิ่มเติม

### ถ้าต้องการให้เป็น Workspace Skill (เฉพาะ project)
1. Copy folder `frontend-repo-review/` ไปที่ `.windsurf/skills/` ใน project นั้น
2. Commit ไปกับ repo เพื่อให้ทีมใช้ร่วมกัน

### ถ้าต้องการย้ายไปตาม spec มาตรฐาน
ย้าย skill จาก:
```
c:\Users\sansakritsuk\.windsurf\skill\frontend-repo-review\
```
ไปที่:
```
C:\Users\sansakritsuk\.codeium\windsurf\skills\frontend-repo-review\
```

### ถ้าต้องการแชร์ให้ทีม
1. **วิธีที่ 1:** Commit skill ใน `.windsurf/skills/` ของ repo
2. **วิธีที่ 2:** (Enterprise) Deploy เป็น System-Level Skill ที่ `C:\ProgramData\Windsurf\skills\`

## สรุป

✅ **Skill ของคุณพร้อมใช้งานแล้ว** - ไม่ต้องทำอะไรเพิ่มเติม
✅ **ใช้ได้ทุก repo** - เพราะเป็น Global Skill
✅ **เรียกใช้ได้ 2 วิธี** - อัตโนมัติหรือ @mention

เพียงแค่เปิด repo ใดก็ได้ใน Windsurf แล้วขอให้ Cascade รีวิว frontend code - Cascade จะเรียกใช้ skill นี้เองโดยอัตโนมัติ
