---
name: backend-api-review-checklist
description: Luna backend/API review checklist (Cloud Functions/Firestore/transactions) — preloaded into Nova
---

> Checklist นี้ถูก **preload เข้า context ของ nova** ผ่าน `skills:` ใน `~/.config/opencode/agents/nova.md`
> ถ้าต้อง deep review (architecture, framework-specific patterns) → อ่าน `reference.md` ข้างไฟล์นี้
# Backend API Review — Summary

> Full version: `C:\Users\sansakritsuk\.config\opencode\luna-workspace\templates\_full\backend-api-review.full.md` (load only when deep review needed)

**Header (fill in):** Date, Reviewer, Repo, Scope, Review Round

---

## Review Checklist (critical 20 items)

### Security (critical)
- [ ] ไม่มี hardcoded credentials/API keys/JWT secrets/DB passwords ใน code
- [ ] Input validation + sanitization ทุก endpoint (กัน SQL injection, XSS, command injection)
- [ ] AuthN/AuthZ ครอบคลุมทุก protected endpoint (JWT validation, scope checks)
- [ ] Rate limiting + security headers (CORS, CSP, HSTS) ตั้งค่าถูกต้อง
- [ ] Sensitive data ไม่ถูก log (passwords, tokens, PII)

### API Design
- [ ] HTTP methods/status codes ใช้ถูก semantic (200/201/204/400/401/403/404/409/422/500)
- [ ] Response shape สม่ำเสมอ + versioning strategy ชัด
- [ ] Pagination/filtering/sorting มาตรฐานเดียวทั้งระบบ

### Database
- [ ] Query มี index ครอบคลุม + ไม่มี N+1
- [ ] Transaction boundaries ถูกต้อง + handle rollback
- [ ] Migration scripts มี rollback plan + ไม่ถูก commit data dump
- [ ] Connection pool size + timeout เหมาะสม

### Error Handling & Reliability
- [ ] Centralized error handler + ไม่ leak stack trace ไป client
- [ ] Context propagation + cancellation (Go context / equivalent)
- [ ] External API calls มี timeout + retry + circuit breaker

### Performance
- [ ] Caching strategy ชัด (Redis/in-memory) + invalidation
- [ ] Heavy ops ใช้ async/background job ไม่ block request

### Testing & Observability
- [ ] Unit + integration tests ครอบ critical path
- [ ] Structured logging (request ID, trace ID)
- [ ] Health check + metrics endpoint (Prometheus/Grafana)

### Deployment Security
- [ ] ไม่มี `.env`, `.claude/`, `.windsurf/`, `.cursor/`, DB dumps, logs ใน repo (เช็ค git history ด้วย)
- [ ] Dockerfile ไม่ copy sensitive files + ใช้ non-root user
- [ ] CI/CD ใช้ secret manager ไม่ hardcode

---

## Severity Rubric
- **Critical:** Security vuln (auth bypass, SQLi, leaked secret), data loss, API down → block merge
- **High:** Missing validation/error handling, N+1 บน hot path, missing retry/timeout บน external call → แก้ก่อน production
- **Medium:** Inconsistent response shape, missing tests, missing index, weak logging → แก้ใน 1-2 สัปดาห์
- **Low:** Code style, naming, minor refactor opportunities → แก้ใน 1-3 เดือน

---

## Dimension Scores

| ด้าน | Score |
|------|-------|
| API Design | /10 |
| Security | /10 |
| Performance | /10 |
| Error Handling | /10 |
| Documentation | /10 |
| Testing | /10 |
| Database Design | /10 |
| Architecture | /10 |
| Code Quality | /10 |
| Production Readiness | /10 |

**Scoring guide:** 10 perfect • 9 missing 1-2 best practices • 8 missing 3-4 • 6-7 acceptable • <6 not ready

---

## Output Format (1-2 บรรทัดต่อ finding)
- `[file]:[line] — [Issue] — [Severity] — [Recommendation]`

ตัวอย่าง:
- `auth/handler.go:42 — JWT secret hardcoded — Critical — ย้ายไป env var + secret manager`
- `repo/user.go:88 — N+1 query loop GetUserOrders — High — preload หรือใช้ JOIN`

---

## TL;DR Block (สำหรับ junior)
- สุขภาพ: ดีมาก/ดี/ปานกลาง/ต้องปรับปรุง — Overall X/10
- Production Ready: ✅/⚠️/❌
- 3 เรื่องสำคัญสุด (1 บรรทัดต่อข้อ + link ไปยัง finding)

---

## Production Readiness Quick-Check
- [ ] ไม่มี Critical/High เหลือ
- [ ] Env vars + secret manager พร้อม
- [ ] Migration + rollback plan
- [ ] Error tracking (Sentry) + monitoring + structured logs
- [ ] Health check + rate limiting + security headers
- [ ] API docs (OpenAPI/Swagger)
- [ ] Test coverage acceptable

**Status:** ✅ Ready / ⚠️ Ready w/ Concerns / ❌ Not Ready

---

## Escalation
ถ้าต้อง deep dive (framework-specific: Go+Fiber, JWT/OAuth2 flow detail, repository pattern, transaction strategy, integration test mocking, full deployment audit 8 categories) ให้ load `C:\Users\sansakritsuk\.config\opencode\luna-workspace\templates\_full\backend-api-review.full.md`

---
*Backend API Review Template (Summary) — Nova (Backend Dev)*
