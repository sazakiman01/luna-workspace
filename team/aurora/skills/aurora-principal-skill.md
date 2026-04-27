---
description: Principal-level integration (LINE LIFF/Messaging + PromptPay + Logistics) — webhook idempotency, retry/backoff, contract-first design
---

# Aurora Principal Skill (Honest Skeleton)

> **⚠️ Status: SKELETON — evidence pending**
>
> Aurora ยังไม่เคยทำงานจริงในระบบ. Skill นี้มี framework outline + integration patterns แต่ Anti-Patterns + Quality Bar ส่วนใหญ่ "evidence pending"
>
> **Trigger full rewrite:** เมื่อ Aurora ทำ integration task ≥ 1 ครั้ง (LINE webhook, PromptPay, etc.)

---

## 🎯 What ทำให้ Aurora เป็น Principal-Level (theoretical)

**Senior Integrator = call API ทำงานได้.**

**Principal Aurora = webhook idempotency + retry/backoff strategy + contract-first design + failure mode forecasting (3rd-party down ทำยังไง)**

จุดต่าง 3 ข้อ:
1. **Idempotency by default** — webhook receivers ต้อง dedupe by event ID
2. **Retry/backoff explicit** — exponential backoff + max attempts + dead letter
3. **Contract-first** — typed contract (zod schema) ที่ verify request/response shape

---

## 🧭 Decision Framework (skeleton)

### Webhook handling
- **Step 1:** Verify signature ก่อน parse body
- **Step 2:** Dedupe by event ID (Firestore lookup)
- **Step 3:** Process + ack < 10s (LINE timeout)
- **Step 4:** Heavy work → enqueue to background

### Retry strategy
- **Idempotent op** (read, dedupe-able write) → exponential backoff (1s, 2s, 4s, 8s, max 5)
- **Non-idempotent** → single attempt + manual review
- **Critical (payment)** → enqueue + retry until ack หรือ alert

### 3rd-party failure mode
- LINE API down → degraded mode (cache user profile, queue messages)
- Payment API down → block transaction + clear user feedback
- Logistics API down → fallback manual + email ops team

---

## 📏 Quality Bar (skeleton)

| มิติ | Senior | Principal |
|------|--------|-----------|
| Webhook | Process | Verify + dedupe + ack < 10s |
| Retry | Try once | Exponential backoff + DLQ |
| Contract | Trust input | zod schema validation |
| Failure mode | Pray | Documented + tested degraded mode |
| Secrets | env file | Secret Manager + rotation policy |

---

## ⚠️ Anti-Patterns (template — evidence pending)

- **AP-1:** Webhook process > 10s → LINE timeout → duplicate webhook
- **AP-2:** No idempotency → duplicate side effects (payment double-charge)
- **AP-3:** Trust external response shape → runtime crash on schema drift
- **AP-4:** Hardcode credentials in code/firebase.json
- **AP-5:** No retry strategy → flaky integration appears as bug

---

## 🛠️ Tech Stack
- **LINE:** `@line/bot-sdk` (Messaging API), LIFF SDK (frontend pair with Stella+Vega)
- **Payment:** PromptPay (TH) — likely via gateway (Omise, Stripe TH)
- **Logistics:** TH carriers API (Kerry, Flash, J&T)
- **Validation:** zod schema at every boundary

---

## 🤝 Cross-Role Boundaries

| Role | Boundary |
|------|----------|
| Nova | Nova = internal API. Aurora = 3rd-party API |
| Stella | LIFF UI = Stella build, LINE API integration = Aurora |
| Vega | Vega = LIFF design, Aurora = LIFF integration logic |
| Sirius | Aurora = mock 3rd-party design, Sirius = test execution |
| Orion | Aurora consult Orion สำหรับ integration boundary design |

---

## 📚 Required Reading
- `team/roles/aurora.md`
- LINE Messaging API + LIFF SDK docs
- PromptPay specification (Bank of Thailand)
- Webhook signature verification (LINE: x-line-signature)

---

## 🔄 When to Use
- LINE webhook handler design
- Payment integration
- Logistics API integration
- 3rd-party retry/backoff strategy
- Failure mode planning

---

## 📝 Authoring Notes
- **Author:** Luna 🌙 (skeleton)
- **Version:** 2026-04-27-v0.1
- **Next rewrite trigger:** Aurora ทำ integration task จริง 1 ครั้ง
