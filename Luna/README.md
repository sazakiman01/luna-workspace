# Luna — Long-Term Memory

*ความทรงจำระยะยาวของ Luna — pattern ของพี่แมน, self-learning, updates*

---

## 📁 ไฟล์ในโฟลเดอร์

| ไฟล์ | ใช้ทำอะไร | Evidence Tier |
|------|-----------|---------------|
| `preferences.md` | ✅ Pattern ยืนยันแล้ว (Evidence ≥ 3) + Confirmed Anti-Patterns | Tier 3 |
| `insights.md` | 🔍 Pattern ที่เริ่มเห็นซ้ำ (Evidence 1-2) | Tier 2 |
| `hypothesis.md` | 💭 Pattern ใหม่ที่ยังไม่ชัดเจน (Evidence 0) | Tier 1 |
| `windsurf-updates.md` | 📰 Track ลูกเล่นใหม่ของ Windsurf (managed by Lyra) | — |
| `retrospective/` | Weekly/Monthly retrospective ของ Luna | — |

---

## 🧠 3-Tier Learning System

```
hypothesis.md (Evidence 0)
    ↓ เจอซ้ำ → Evidence +1
insights.md (Evidence 1-2)
    ↓ Evidence ≥ 3 → promote
preferences.md (Evidence ≥ 3 = Confirmed)
```

### เมื่อไหร่ต้องเขียนอะไร

- **เจอ pattern ใหม่:** บันทึกใน `hypothesis.md`
- **เจอซ้ำครั้งที่ 2-3:** ย้ายไป `insights.md`
- **ยืนยันแล้วชัดเจน:** promote ไป `preferences.md`
- **พี่แมน correct Luna:** Trigger self-correction → บันทึก `hypothesis.md` ทันที

---

## 📝 Per-Repo Equivalent

ไฟล์คู่ขนานที่แต่ละ repo:
- `<repo>/Luna/decisions.md` — บันทึกการตัดสินใจเฉพาะ repo
- `<repo>/Luna/feedback.md` — feedback จากพี่แมนเฉพาะ repo
- `<repo>/Luna/daily/` — daily notes ของ Luna (ส่วนตัว)
- `<repo>/Luna/team/daily/` — daily notes ของทีม
- `<repo>/Luna/retrospective/` — per-repo retrospective

---

## 🔺 Escalation: Per-Repo → Global

ถ้า pattern เฉพาะ repo ใช้ได้ข้าม repo → promote:
1. ยืนยันว่าเจอใน ≥ 2 repos
2. ย้ายจาก `<repo>/Luna/insights.md` → global `Luna/insights.md`
3. ลบจาก per-repo (ย้ายแล้ว)

---

## 🔗 เกี่ยวข้องกับ

- `team/preferences/` — per-role learning (specific)
- `team/performance.md` — team-level tracking
- `team/retrospective/` — team-level patterns

---
*Maintained by Luna — `global_rules.md` คือ source of truth สำหรับ behavior*
