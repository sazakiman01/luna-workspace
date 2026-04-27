# Knowledge Package — PMAM Web

*Knowledge เฉพาะ PMAM Web stack: React + Firebase + TypeScript + Firestore*

> ⚠️ **Renamed from `knowledge-package-generic/`** เมื่อ 2026-04-27 (Phase 4 KA1)
> เหตุผล: content ทั้งหมดเป็น PMAM-specific (Firestore, Firebase Functions, React, zod) ไม่ใช่ generic
> Generic knowledge ย้ายไป `knowledge-package-generic/` ใหม่

---

## 📁 Available Files

| ไฟล์ | Scope | เมื่อไหร่อ่าน |
|------|-------|----------------|
| `03-coding-standards.md` | PMAM coding style: TypeScript strict, Firestore patterns, React components | ก่อนเขียน code ใหม่ / รีวิว PR |
| `05-best-practices.md` | PMAM best practices: Firebase Functions, Zustand, TanStack Query, zod | Architecture / design decisions |

---

## 🎯 Scope

**อะไรควรอยู่ที่นี่:**
- ✅ PMAM Web tech stack patterns (React, Firebase, Firestore, TypeScript)
- ✅ PMAM-specific coding standards + best practices
- ✅ Library-specific patterns (zod, Zustand, TanStack Query)

**อะไรไม่ควรอยู่ที่นี่:**
- ❌ Universal principles (ไปอยู่ `knowledge-package-generic/`)
- ❌ Business logic / domain knowledge (ไปอยู่ `repo-index/pmam-web/`)
- ❌ Patterns ของ repo อื่นที่ไม่ใช่ PMAM

---

## 🔗 Related

- **Generic knowledge:** `knowledge-package-generic/` (universal rules ใช้ข้าม repo)
- **PMAM repo-index:** `repo-index/pmam-web/` (decisions, knowledge digest, roles)
- **Full repo knowledge:** `<pmam-web>/Luna/knowledge-package/` (in-repo)

---
*Maintained by Luna + Stella (Frontend) + Nova (Backend)*
*Renamed 2026-04-27 — Phase 4 Knowledge Depth (KA1 Option A)*
