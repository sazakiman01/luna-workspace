# แก้ Template AI Assistant Setup Prompt (Path ผิด)

แก้ template `knowledge-package\templates\ai-assistant-setup-prompt.md` ที่บอก path ผิดสำหรับ global rules จะทำให้ผู้ใช้เจอปัญหาเดียวกับพี่แมน (Cascade ตอบแทน Luna)

## 🔍 Root Cause

Template บอกให้สร้างไฟล์ที่:
- **Option A (Global):** `C:\Users\{ชื่อคุณ}\.windsurf\rules\ai-assistant.md` ❌
- **Option B (Per-project):** `{โปรเจกต์ของคุณ}\.windsurf\rules\ai-assistant.md` ✅ (ถูก)

แต่จากปัญหาที่แก้ไป (2026-04-22):
- Windsurf โหลด **global rules** จาก `C:\Users\sansakritsuk\.codeium\windsurf\memories\global_rules.md` เท่านั้น
- **ไม่ใช่** จาก `C:\Users\sansakritsuk\.windsurf\rules\*.md` (path นี้ Windsurf ไม่โหลดอัตโนมัติ)

## 🎯 สิ่งที่ต้องแก้

### 1. Step 1: เปลี่ยน path ของ Option A

**เดิม:**
```
**Option A: ใช้ทุก Workspace (แนะนำ)** — สร้างไฟล์ใน Global Windsurf directory
- Windows: `C:\Users\{ชื่อคุณ}\.windsurf\rules\ai-assistant.md`
- Mac/Linux: `~/.windsurf/rules/ai-assistant.md`
```

**ใหม่:**
```
**Option A: ใช้ทุก Workspace (แนะนำ)** — สร้างไฟล์ใน Windsurf Global Rules
- Windows: `C:\Users\{ชื่อคุณ}\.codeium\windsurf\memories\global_rules.md`
- Mac/Linux: `~/.codeium/windsurf/memories/global_rules.md`

⚠️ **ข้อควรระวัง:** Global rules มี limit ~6,000 chars — ถ้า prompt ยาวเกินต้องย่อ
```

### 2. เพิ่ม Note เตือนเกี่ยวกับ `.windsurf/rules/*.md`

เพิ่ม section ใหม่หลัง Step 1:

```markdown
### 📌 Note เกี่ยวกับ Path

- **`.codeium/windsurf/memories/global_rules.md`** = Global rules ที่ Windsurf โหลดอัตโนมัติ (ไฟล์เดียว, limit ~6,000 chars)
- **`.windsurf/rules/*.md`** = Workspace rules ที่ Windsurf โหลดเฉพาะเมื่อเปิด workspace นั้น
- **Path ที่ใช้เป็น reference:** คุณยังสามารถสร้างไฟล์ใน `.windsurf/rules/` แล้วให้ AI อ่านเพิ่มเติมได้ แต่ Windsurf จะไม่โหลดอัตโนมัติ
```

### 3. อัปเดต Summary ด้านล่าง

**เดิม:**
```
**💡 สรุปสั้นๆ:** สร้างไฟล์ `.md` ในโฟลเดอร์ `.windsurf/rules/` → วาง Prompt → แก้ช่อง `{{...}}` → เสร็จ
```

**ใหม่:**
```
**💡 สรุปสั้นๆ:**
- **Global:** สร้างไฟล์ใน `~/.codeium/windsurf/memories/global_rules.md` → วาง Prompt (ย่อ) → เสร็จ
- **Per-project:** สร้างไฟล์ใน `{project}/.windsurf/rules/ai-assistant.md` → วาง Prompt → เสร็จ
```

### 4. เพิ่ม Note ใน Tips เพิ่มเติม

เพิ่ม item ใหม่:

```markdown
5. **⚠️ Global Rules Path สำคัญมาก** — ถ้าจะใช้ทุก workspace ต้องวางใน `~/.codeium/windsurf/memories/global_rules.md` ไม่ใช่ `~/.windsurf/rules/` (Windsurf ไม่โหลดอัตโนมัติจากที่นั่น)
```

## ✅ หลังแก้เสร็จ

- Template จะบอก path ถูกต้องสำหรับ global rules
- ผู้ใช้จะไม่เจอปัญหา "เปิดแชทใหม่ → AI ไม่ตอบตาม persona"
- มี note เตือนเกี่ยวกับ char limit ของ global rules
