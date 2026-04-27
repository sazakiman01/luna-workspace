# Frontend Review Checklist

## 🚀 Quick Reference Checklist

ใช้ checklist นี้เป็น quick reference เมื่อทำ frontend review

### Critical (Blocker) 🔴
- [ ] ไม่มี security vulnerabilities (XSS, sensitive data exposure)
- [ ] Core functionality ทำงานถูกต้อง
- [ ] ไม่มี risk เรื่อง data loss
- [ ] Performance ไม่ทำให้ app ใช้ไม่ได้

### Major Issues 🟡
- [ ] Accessibility ถูกต้อง (semantic HTML, ARIA, keyboard nav)
- [ ] Performance อยู่ในระดับที่ยอมรับได้
- [ ] Error handling ครอบคลุม
- [ ] State management เหมาะสม
- [ ] Component architecture ดี

### Minor Issues 🟢
- [ ] Code style consistent
- [ ] Comments/documentation เพียงพอ
- [ ] Naming conventions ถูกต้อง
- [ ] ไม่มี code duplication ที่ไม่จำเป็น

### Testing 🧪
- [ ] Unit tests ครอบคลุม logic สำคัญ
- [ ] Integration tests มีสำหรับ flows สำคัญ
- [ ] Test coverage พอสมควร
- [ ] Tests ไม่ fragile

### Production Readiness 🚀
- [ ] Environment variables ตั้งค่าถูกต้อง
- [ ] Build process พร้อม
- [ ] Error tracking มี (Sentry ฯลฯ)
- [ ] Monitoring พร้อม
- [ ] Documentation สำหรับ deployment มี

## 🎯 Dimension Quick Check

| Dimension | Key Questions | Status |
|-----------|---------------|--------|
| **Functional** | ทำงานตรง requirement ไหม? | ⬜ |
| **Architecture** | Structure ดีไหม? separation of concerns? | ⬜ |
| **Maintainability** | อ่านง่ายไหม? consistent? | ⬜ |
| **Accessibility** | รองรับผู้พิการไหม? ARIA? | ⬜ |
| **Performance** | เร็วพอไหม? bundle size? | ⬜ |
| **Security** | มีช่องโหว่ไหม? data safe? | ⬜ |
| **Testing** | Test เพียงพอไหม? quality? | ⬜ |
| **Production** | พร้อม deploy ไหม? monitoring? | ⬜ |

## 📋 Framework-Specific Checks

### React/Next.js
- [ ] Hooks ใช้ถูกต้อง (rules of hooks)
- [ ] ไม่มี unnecessary re-renders
- [ ] useMemo/useCallback ใช้เหมาะสม
- [ ] Component ไม่ใหญ่เกินไป

### Vue
- [ ] Composition API ใช้ถูกต้อง
- [ ] Reactive state จัดการดี
- [ ] Props/emits มี type ถูกต้อง

### Angular
- [ ] Services แยกจาก components
- [ ] Dependency injection ใช้ถูกต้อง
- [ ] RxJS subscriptions ถูก unsubscribe

### TypeScript
- [ ] Types ถูกต้องและ specific
- [ ] ไม่มี `any` โดยไม่จำเป็น
- [ ] Interface/Type ใช้ถูกต้อง

---
*Quick reference for frontend reviews - Skill ของ Stella*
