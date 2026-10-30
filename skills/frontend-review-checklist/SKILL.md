---
name: frontend-review-checklist
description: Luna frontend review checklist (React/Vite/LIFF/TS) — preloaded into Stella
---

> Checklist นี้ถูก **preload เข้า context ของ stella** ผ่าน `skills:` ใน `~/.config/opencode/agents/stella.md`
> ถ้าต้อง deep review (architecture, framework-specific patterns) → อ่าน `reference.md` ข้างไฟล์นี้
# Frontend Review — Summary

> Full version: `~/.config/opencode/luna-workspace/templates/_full/frontend-review.full.md` (load only when deep review needed)

**Header (fill in):** Date, Reviewer, Repo, Scope, Review Round
**Save Location:** `<repo>/Luna/reviews/frontend/<component>-frontend-review-r<round>-YYYY-MM-DD.md`

---

## Review Checklist (critical 20 items)

### Functional Correctness (critical)
- [ ] State updates ไม่มี race condition / stale closure (deps array ครบ)
- [ ] Error boundaries ครอบ route/feature สำคัญ
- [ ] Loading/empty/error states ครบทุก async UI

### Security (critical)
- [ ] ไม่มี `dangerouslySetInnerHTML` กับ untrusted data + ไม่มี XSS risk
- [ ] Tokens เก็บใน secure storage (ไม่ใช่ localStorage ถ้า sensitive) + auto refresh
- [ ] ไม่มี secrets/API keys ใน bundle (เช็ค `.env` ที่ขึ้นต้น `VITE_`/`REACT_APP_` ที่ leak)

### Architecture & Maintainability
- [ ] Component แยกหน้าที่ชัด (presentational vs container) + ไม่มี god component
- [ ] State management layer เหมาะสม (Redux/Context/local) + ไม่มี prop drilling เกิน 3 ชั้น
- [ ] Custom hooks reusable + naming `use*` ถูกต้อง
- [ ] TypeScript strict mode + ไม่มี `any` ใน public API

### Performance
- [ ] List rendering ใช้ stable `key` + virtualize ถ้ายาว
- [ ] Heavy components ใช้ memo/useMemo/useCallback เมื่อจำเป็น (ไม่ over-memoize)
- [ ] Bundle splitting + lazy load route-level + image optimize

### Accessibility (a11y)
- [ ] Semantic HTML + ARIA attrs ถูกต้อง (button vs div, label-for)
- [ ] Keyboard navigation + focus management (modal, dropdown)
- [ ] Color contrast + form error messages เข้าถึงได้

### Testing
- [ ] Critical user flow มี test (unit + integration ขั้นต่ำ)
- [ ] Test ไม่พึ่ง implementation detail (ใช้ Testing Library queries ที่เหมาะสม)

### Build & Deployment Security
- [ ] ไม่มี `.env`, `.claude/`, `.windsurf/`, `.cursor/`, `.vscode/`, coverage/ ใน repo (เช็ค git history)
- [ ] Dockerfile/nginx serve เฉพาะ build folder + ไม่มี source map ใน production (หรือ upload Sentry only)
- [ ] CSP headers + HTTPS redirect

---

## Severity Rubric
- **Critical:** XSS/leaked secret, app crash บน critical flow, broken auth → block merge
- **High:** Missing error boundary บน critical route, missing a11y บน core UI, performance regression ชัดเจน → แก้ก่อน production
- **Medium:** Missing tests, prop drilling, over-rendering, inconsistent state pattern → แก้ใน 1-2 สัปดาห์
- **Low:** Code style, naming, minor refactor → แก้ใน 1-3 เดือน

---

## Dimension Scores

| ด้าน | Score |
|------|-------|
| Functional Correctness | /10 |
| Architecture | /10 |
| Maintainability | /10 |
| Accessibility | /10 |
| Performance | /10 |
| Security | /10 |
| Testing | /10 |
| Build & Deployment Security | /10 |
| Production Readiness | /10 |

---

## Output Format (1-2 บรรทัดต่อ finding)
- `[file]:[line] — [Issue] — [Severity] — [Recommendation]`

ตัวอย่าง:
- `src/pages/Profile.tsx:55 — dangerouslySetInnerHTML กับ user bio — Critical — sanitize ด้วย DOMPurify หรือ render เป็น text`
- `src/components/AuditList.tsx:120 — list 5k items ไม่มี virtualization — High — ใช้ react-window`

---

## TL;DR Block (สำหรับ junior)
- สุขภาพ: ดีมาก/ดี/ปานกลาง/ต้องปรับปรุง — Overall X/10
- Production Ready: ✅/⚠️/❌
- 3 เรื่องสำคัญสุด (1 บรรทัดต่อข้อ + link ไปยัง finding)

---

## Production Readiness Quick-Check
- [ ] ไม่มี Critical/High เหลือ
- [ ] Build pass + bundle size ยอมรับได้
- [ ] Error tracking (Sentry) + performance monitoring
- [ ] A11y ผ่าน checks ขั้นต่ำ (axe / lighthouse)
- [ ] Test coverage acceptable
- [ ] ไม่มี `.windsurf/`, `.claude/`, `.cursor/`, `.env` ใน deploy artifact
- [ ] Rollback plan + deployment docs

**Status:** ✅ Ready / ⚠️ Ready w/ Concerns / ❌ Not Ready

---

## Escalation
ถ้าต้อง deep dive (framework deep checks: Redux Toolkit store/selector/middleware, React patterns, TypeScript generics, UI library specific, Formik+Yup, BPMN.js integration, accessibility static analysis detail, full deployment audit 8 categories) ให้ load `~/.config/opencode/luna-workspace/templates/_full/frontend-review.full.md`

---
*Frontend Review Template (Summary) — K.Sansakrit (Dev Lead) / Stella (Frontend Dev)*
