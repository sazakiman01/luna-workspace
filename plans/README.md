# Plans — Planning Mode Artifacts

*ไฟล์แผนที่สร้างใน Windsurf planning mode — สำหรับ review ก่อน implement*

---

## 📁 Structure

```
plans/
├── README.md           # ไฟล์นี้
├── archive/            # แผนที่ทำเสร็จ / ยกเลิก
│   └── 2026/
└── *.md                # Active plans เท่านั้น
```

---

## 🎯 Active vs Archive

**Active plans (`plans/*.md`):**
- ✅ กำลัง implement อยู่
- ✅ รอพี่แมน review
- ✅ Reference ต่อในเซสชันต่อไป

**Archived plans (`plans/archive/YYYY/`):**
- ✔️ Implement แล้วและ verified
- ❌ ยกเลิก / superseded
- 📚 Historical reference

---

## 🏷️ Naming Convention

```
<feature-name>-<session-id>.md
```

**Examples:**
- `enforce-5step-pattern-597e97.md`
- `automated-learning-triggers-5c22c7.md`

**Session ID suffix** (`-5c22c7`, `-597e97`):
- เป็น hash ของ session — ไม่มี semantic meaning
- ใช้แยก plan ที่ชื่อเหมือนกันในคนละ session
- **Don't rename** — Windsurf อาจ reference จาก internal state

---

## 📋 Lifecycle

```
1. Planning mode → create plan
2. User review → modify/approve
3. Exit plan mode → implement
4. Implementation complete → move to archive/YYYY/
```

---

## 🗂️ Archive Process

เมื่อ plan ถูก implement เสร็จ:
```powershell
# Move to year folder
Move-Item "plans\<plan>.md" "plans\archive\2026\"
```

**เกณฑ์ archive:**
- ✅ งานที่แผนสั่งให้ทำ → ทำเสร็จแล้ว
- ✅ Verified ว่าไม่มี regression
- ✅ บันทึก daily log แล้ว

---

## 🔍 หา Plan เก่า

```powershell
# ค้นใน archive
Get-ChildItem -Recurse plans\archive\ -Filter "*.md" | Select-String "keyword"
```

---
*Managed by Luna — ใช้ร่วมกับ `<repo>/Luna/team/daily/` เพื่อ track implementation history*
