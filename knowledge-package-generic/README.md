# Knowledge Package — Generic (Universal)

*Universal coding principles ใช้ได้ข้าม repo, ข้าม tech stack*

> **สร้างใหม่** 2026-04-27 (Phase 4 KA1 Option A)
> PMAM-specific content ย้ายไป `knowledge-package-pmam/`
> ที่นี่เก็บเฉพาะ universal rules เท่านั้น

---

## 📁 Available Files

| ไฟล์ | Scope | เมื่อไหร่อ่าน |
|------|-------|----------------|
| `01-universal-principles.md` | Core principles ที่ใช้ได้ทุก tech stack | เสมอ (foundation) |

---

## 🎯 Scope

**อะไรควรอยู่ที่นี่:**
- ✅ Universal principles (DRY, SOLID, KISS, YAGNI)
- ✅ Language-agnostic patterns (error handling philosophy, naming principles)
- ✅ Cross-repo standards (commit messages, PR process, documentation)
- ✅ Review methodology ที่ใช้ได้ทุก project

**อะไรไม่ควรอยู่ที่นี่:**
- ❌ Tech-specific patterns → ไปอยู่ `knowledge-package-<project>/`
- ❌ Business logic → ไปอยู่ `repo-index/<repo>/`
- ❌ Library-specific code (React, Firebase, etc.)

---

## 🔗 Tech-Specific Packages

| Package | Stack | Location |
|---------|-------|----------|
| PMAM Web | React + Firebase + TypeScript + Firestore | `knowledge-package-pmam/` |

*เพิ่ม package ใหม่เมื่อมี repo ที่มี tech stack ต่างจาก PMAM*

---

## ✏️ เมื่อไหร่ต้องเพิ่ม

- เจอ principle ที่ใช้ได้ข้าม repo ≥ 2 แห่ง
- ไม่ผูกกับ specific library/framework
- พี่แมน confirm ว่าเป็น universal standard

---
*Maintained by Luna + Orion (Architecture)*
*Created 2026-04-27 — Phase 4 Knowledge Depth*
