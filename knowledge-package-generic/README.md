# Knowledge Package — Generic

*Generic knowledge ที่ใช้ข้าม repo — coding standards, best practices*

---

## 📁 Available Files

| ไฟล์ | Scope | เมื่อไหร่อ่าน |
|------|-------|----------------|
| `03-coding-standards.md` | Generic coding style, naming, structure | ก่อนเขียน code ใหม่ / รีวิว PR |
| `05-best-practices.md` | General best practices (security, performance, DX) | Architecture / design decisions |

---

## 🎯 Scope

**อะไรควรอยู่ที่นี่:**
- ✅ Generic patterns ใช้ได้ข้าม tech stack
- ✅ Universal best practices
- ✅ Cross-language coding standards

**อะไรไม่ควรอยู่ที่นี่:**
- ❌ Tech-specific guidelines (ไปอยู่ใน `<repo>/knowledge-package/` แทน)
- ❌ Business logic / domain knowledge
- ❌ Repo-specific conventions

---

## 🔗 Per-Repo Equivalent

แต่ละ repo ที่ต้องการ knowledge เฉพาะ สร้าง:
```
<repo>/knowledge-package/
├── README.md
├── 01-tech-stack.md
├── 02-schema.md
├── 03-domain-knowledge.md
└── ...
```

ไฟล์ generic อ่านก่อน → per-repo เฉพาะทางอ่านเสริม

---

## ✏️ เมื่อไหร่ต้องเพิ่ม

- เจอ pattern/standard ที่ใช้ได้ข้าม repo ≥ 2 แห่ง
- พี่แมน confirm ว่าเป็น universal rule

---
*Maintained by Luna + Orion (Architecture)*
