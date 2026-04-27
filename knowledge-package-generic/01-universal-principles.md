# Universal Coding Principles

*Principles ที่ใช้ได้ทุก tech stack — ไม่ผูกกับภาษาหรือ framework ใดๆ*

---

## 🏗️ Design Principles

### 1. Single Responsibility (SRP)
ทุก function/class/module ทำหน้าที่เดียว — ถ้าอธิบายด้วย "และ" (and) แสดงว่ารับผิดชอบมากเกินไป

### 2. DRY (Don't Repeat Yourself)
ถ้า logic เหมือนกัน ≥ 2 ที่ → extract เป็น shared function
**ข้อยกเว้น:** DRY ที่ทำให้ coupling สูงเกินไป → ยอม repeat ดีกว่า

### 3. KISS (Keep It Simple, Stupid)
เลือกวิธีที่ง่ายที่สุดที่ solve problem ได้ — complexity ต้อง justify ได้

### 4. YAGNI (You Aren't Gonna Need It)
ไม่เขียน code สำหรับ feature ที่ยังไม่ต้องการ — implement เมื่อมี requirement จริง

### 5. Least Surprise
Code ทำงานตรงตามที่ชื่อบอก — อ่านแล้วไม่ต้องเดา

---

## 📝 Naming Principles (Language-Agnostic)

1. **ชื่อบอกเจตนา** — `calculateTotalPrice()` ดีกว่า `calc()`
2. **หลีกเลี่ยงตัวย่อ** — ยกเว้นที่เป็นที่รู้จักทั่วไป (e.g., `id`, `url`, `db`)
3. **Consistency** — ใช้ convention เดียวกันทั้ง project
4. **Scope-appropriate length** — local variable สั้นได้, global ต้องชัดเจน

---

## 🔧 Error Handling Philosophy

1. **Fail fast** — ตรวจ input ก่อน แล้ว error ทันทีถ้าไม่ valid
2. **Explicit > Silent** — ห้ามกลืน error โดยไม่ log หรือ handle
3. **User-facing ≠ Developer-facing** — error message ให้ user ต้องอ่านเข้าใจ, log ให้ developer ต้อง debug ได้
4. **Recovery > Crash** — ถ้า recover ได้ ให้ recover, ถ้าไม่ได้ ให้ crash gracefully

---

## 📋 Code Review Standards (Universal)

### Before Committing
- [ ] Code compiles / lints without errors
- [ ] No hardcoded secrets or credentials
- [ ] Proper error handling (no silent failures)
- [ ] Meaningful commit message

### Review Focus
- [ ] Does this solve the stated problem?
- [ ] Is there a simpler way?
- [ ] Are edge cases handled?
- [ ] Will this be maintainable in 6 months?

---

## 📊 Commit Message Convention

```
<type>: <short description> (≤72 chars)

<body — optional, wrap at 72 chars>
- What changed and why
- Not how (code shows how)

<footer — optional>
Refs: #issue-number
```

**Types:**
- `feat` — new feature
- `fix` — bug fix
- `refactor` — code change that neither fixes a bug nor adds a feature
- `docs` — documentation only
- `test` — adding or correcting tests
- `chore` — maintenance (build, CI, dependencies)

---

## 🔄 Refactoring Triggers

Refactor เมื่อ:
1. **Rule of Three** — logic ซ้ำครั้งที่ 3 → extract
2. **Long function** — ถ้า function ยาวเกิน 1 หน้าจอ → split
3. **Deep nesting** — ≥ 3 ระดับ → early return / extract
4. **Shotgun surgery** — เปลี่ยน 1 feature ต้องแก้ ≥ 5 files → consolidate

---

## 🚫 Universal Anti-Patterns

| Anti-Pattern | ทำไมผิด | วิธีแก้ |
|---|---|---|
| **God Object** | Class/module ทำทุกอย่าง | Split by responsibility |
| **Magic Numbers** | ตัวเลขไม่มีชื่อ | Extract เป็น named constant |
| **Silent Failure** | catch แล้ว ignore | Log + re-throw หรือ handle explicitly |
| **Premature Optimization** | Optimize ก่อนมี data | Measure first, optimize second |
| **Copy-Paste Programming** | Duplicate logic | Extract shared function |

---
*Created 2026-04-27 — Phase 4 Knowledge Depth*
*ใช้ได้ทุก repo — ไม่มี tech-specific content*
