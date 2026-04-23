# Repo Index — Centralized Per-Repo Knowledge

*ศูนย์รวม index ของ knowledge/learning ที่กระจายอยู่ใน repo ต่างๆ — อ่านที่เดียว*

---

## 🎯 จุดประสงค์

- **Single source of truth สำหรับ reading** — พี่แมนดูภาพรวมทุก repo ได้จากที่เดียว
- **Hybrid approach** — index + link กลับไปที่ full content ใน repo
- **ไม่ duplicate** — full content ยังอยู่ที่ repo

---

## 📁 Structure

```
repo-index/
├── README.md                       # ไฟล์นี้
└── <repo-name>/
    ├── summary.md                  # Overview + meta + links
    ├── decisions.md                # Digest ของ <repo>/Luna/decisions.md
    ├── knowledge.md                # Digest ของ <repo>/knowledge-package/
    └── custom-roles.md             # List ของ per-repo roles
```

---

## ✅ สิ่งที่ bubble up มา Global (Hybrid Option 2)

| Content | Method | Lives in repo at |
|---------|--------|-------------------|
| Decisions | Summary + link | `<repo>/Luna/decisions.md` |
| Feedback | Summary + link | `<repo>/Luna/feedback.md` |
| Knowledge package | Summary + link | `<repo>/knowledge-package/` or `<repo>/Luna/knowledge-package/` |
| Custom roles | List + link | `<repo>/Luna/team/roles/` |
| Role context extensions | List + link | `<repo>/Luna/team/roles/*-context.md` |

## ❌ สิ่งที่ stay in repo (ไม่ bubble up)

- Daily logs (`<repo>/Luna/daily/`, `<repo>/Luna/team/daily/`)
- Review outputs (`<repo>/Luna/reviews/`)
- Per-repo plans, retrospectives

---

## 🔄 การ Update Index

### เมื่อไหร่ต้อง update?

- เพิ่ม decision สำคัญใน repo
- เพิ่ม knowledge-package ไฟล์ใหม่
- สร้าง custom role / role context
- Monthly review / quarterly audit

### วิธี update

1. **Manual** (ตอนนี้) — Luna/role เพิ่ม entry ใน `repo-index/<repo>/*.md`
2. **Automated** (future) — workflow `/sync-repo-index` (Lyra plan)

---

## 🗂️ Repos ที่ index แล้ว

- `pmam-web/` — PMAM Web (Process Management and Monitoring Audit Management System)

---

## 🔗 Related

- `Luna/insights.md` — cross-repo patterns (promoted from per-repo)
- `team/performance.md` — global team performance
- `team/decision-global-vs-per-repo.md` — when to promote per-repo → global

---
*Managed by Luna + Galaxy (content strategy)*
