# Automated Learning Triggers

ออกแบบระบบให้ Luna บันทึก learning เองโดยไม่ต้องให้พี่แมนสั่ง — ใช้ keyword-based triggers ใน global_rules.md

## 🎯 Goal

ลด friction: พี่แมนไม่ต้องพูด "บันทึกเข้า hypothesis.md" ทุกครั้งที่เจอ pattern ใหม่

## 💡 ข้อจำกัดที่ต้องเข้าใจก่อน

- **Rules ไม่ auto-run** — เป็น instruction ที่ Luna ต้องอ่าน + remember
- **ไม่มี long-term memory ข้าม session** — จำได้แค่ภายใน session เดียว
- **Token cost** — ถ้าบันทึกทุกอย่างจะเยอะเกิน

ดังนั้นต้อง: **clear keywords + low overhead + high signal**

## 🧠 Trigger ที่จะ implement

### Trigger 1: Self-Correction Detection
- **เมื่อไหร่:** Luna พูดคำ: "ผิด", "สมมติผิด", "คิดผิด", "ทำผิด", "พลาด", "ไม่ถูก"
- **ทำอะไร:** บันทึก pattern ลง `hypothesis.md` ทันที (evidence 1/3)
- **บันทึกที่:** `Luna/hypothesis.md` (global) หรือ `<repo>/Luna/feedback.md` (per-repo)

### Trigger 2: User Correction Detection
- **เมื่อไหร่:** พี่แมนพูด: "ไม่ใช่", "ผิดมั้ย", "ลูน่า...ผิด", "ทำไม...", "ควร...", "น่าจะ..."
- **ทำอะไร:**
  1. บันทึก pattern ลง `hypothesis.md` (evidence 1/3)
  2. ถ้า pattern เคยมี → เพิ่ม evidence +1
  3. ขอบคุณพี่แมนที่ correct

### Trigger 3: Evidence Threshold Auto-Promotion
- **เมื่อไหร่:** หลังบันทึก learning เสร็จ
- **ทำอะไร:** ตรวจ evidence counter
  - ≥ 1 → ย้าย `hypothesis.md` → `insights.md`
  - ≥ 3 → ย้าย `insights.md` → `preferences.md` + สร้าง memory

## 📍 ไฟล์ที่จะแก้

### 1. `C:\Users\sansakritsuk\.codeium\windsurf\memories\global_rules.md`
เพิ่ม section ใหม่:
```markdown
## 🧠 Automated Learning Triggers (CRITICAL)

Luna ต้องบันทึก learning เอง โดยไม่รอพี่แมนสั่ง:

**Trigger 1 — Self-Correction:**
เมื่อ Luna พูด: "ผิด", "สมมติผิด", "คิดผิด", "ทำผิด", "พลาด"
→ บันทึกลง `<repo>/Luna/feedback.md` หรือ global `Luna/hypothesis.md`
→ ระบุ context + evidence 1/3

**Trigger 2 — User Correction:**
เมื่อพี่แมนพูด: "ไม่ใช่", "ผิด", "ทำไม...", "ควร...", "น่าจะ..."
→ บันทึก pattern ทันที
→ ขอบคุณพี่แมน
→ ถ้า pattern เคยมี → เพิ่ม evidence

**Trigger 3 — Auto-Promotion:**
หลังบันทึก → ตรวจ evidence:
- ≥ 1 → ย้ายไป insights.md
- ≥ 3 → ย้ายไป preferences.md + create_memory
```

### 2. `C:\Users\sansakritsuk\.windsurf\luna-workspace\rules\luna-core.md`
เพิ่ม section เดียวกัน (redundancy สำหรับ ecosystem consistency)

### 3. ไม่แก้ triggers ใน per-repo rules
เป็น global behavior ไม่ใช่ per-repo

## ✅ Trigger ที่ไม่ทำ (ตัดออก)

- **Post-Task Reflection ทุก task:** เปลือง token, noise
  - แทนที่ด้วย: ทำใน weekly retro แทน (`/weekly-retro` workflow)
- **Pattern Repetition ข้าม session:** impractical (ไม่มี memory)
  - แทนที่ด้วย: weekly retro ทำหน้าที่นี้

## 🧪 Verification

หลัง implement → ทดสอบด้วย:
1. พี่แมน correct ลูน่า 1 ครั้ง → ดูว่าลูน่าบันทึกเองหรือเปล่า
2. ลูน่าพูด "ลูน่าผิดไป" → ดูว่าบันทึกเองหรือเปล่า
3. ถ้าลูน่าไม่ทำ → ลูน่าอาจต้อง remind ตัวเองด้วย หรือปรับ keyword

## 📊 Success Metrics

- พี่แมนไม่ต้องพูด "บันทึก hypothesis" อีกเลย ภายใน 2 สัปดาห์
- Evidence counter เพิ่มขึ้นอัตโนมัติ
- Hypothesis ที่ถึง 3 evidence → ย้ายไป preferences เอง

## 🔄 Fallback ถ้าไม่ได้ผล

ถ้า Luna ยังลืม:
1. เพิ่ม explicit reminder ทุก CRITICAL pattern ใน global_rules.md
2. ใช้ workflow `/learn` เรียก manually
3. ทำ workflow อัตโนมัติใน `.windsurf/workflows/`
