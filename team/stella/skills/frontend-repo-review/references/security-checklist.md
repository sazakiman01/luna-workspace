# Frontend Security Checklist

## 🔒 Common Security Vulnerabilities

### XSS (Cross-Site Scripting)
- [ ] ไม่มี user input ที่ render โดยตรงโดยไม่ sanitize
- [ ] ใช้ frameworks' built-in escaping (React, Vue ทำ auto-escape)
- [ ] ใช้ DOMPurify สำหรับ HTML sanitization
- [ ] ใช้ Content Security Policy (CSP)
- [ ] ระวัง dangerouslySetInnerHTML (React) หรือ v-html (Vue)

### CSRF (Cross-Site Request Forgery)
- [ ] ใช้ CSRF tokens สำหรับ state-changing requests
- [ ] ใช้ SameSite cookie attribute
- [ ] Verify origin ของ requests

### Authentication & Authorization
- [ ] JWT/Session tokens เก็บอย่างปลอดภัย (httpOnly cookies หรือ secure storage)
- [ ] ไม่เก็บ sensitive data ใน localStorage/sessionStorage
- [ ] Token expiration handling ดี
- [ ] Role-based access control บน client side (แต่ verify บน server)
- [ ] Logout functionality ทำงานถูกต้อง

### Data Protection
- [ ] ไม่ hardcode API keys, secrets
- [ ] ใช้ environment variables สำหรับ sensitive config
- [ ] Encrypt sensitive data ที่ rest/transport (HTTPS)
- [ ] PII (Personally Identifiable Information) ปกป้องอย่างเหมาะสม

### API Security
- [ ] Validate inputs ก่อนส่งไป API
- [ ] Rate limiting บน client side (nice-to-have, server should enforce)
- [ ] Error messages ไม่ leak sensitive information
- [ ] API responses ไม่ expose unnecessary data

## 🔒 Framework-Specific Security

### React
- [ ] ไม่ใช้ dangerouslySetInnerHTML โดยไม่จำเป็น
- [ ] Validate props ด้วย PropTypes หรือ TypeScript
- [ ] ระวัง eval() หรือ function calls จาก untrusted sources
- [ ] ใช้ React Helmet สำหรับ meta tags/security headers

### Vue
- [ ] ไม่ใช้ v-html โดยไม่ sanitize
- [ ] Validate props ด้วย prop validation
- [ ] ระวัง dynamic component rendering จาก untrusted sources

### Angular
- [ ] ใช้ DomSanitizer สำหรับ untrusted content
- [ ] Enable built-in XSS protection
- [ ] Use HttpClient แทน Http (deprecated)
- [ ] CSRF protection เปิดอยู่โดย default

## 🔒 Third-Party Dependencies

- [ ] Audit dependencies regularly (`npm audit`)
- [ ] ใช้ dependencies ที่ actively maintained
- [ ] Review security advisories
- [ ] Lock dependency versions (package-lock.json, yarn.lock)
- [ ] Remove unused dependencies

## 🔒 Environment & Configuration

- [ ] Environment variables ไม่ expose บน client
- [ ] Different configs สำหรับ dev/staging/prod
- [ ] API endpoints ไม่ hardcode
- [ ] Debug mode ปิดบน production
- [ ] Source maps ไม่ expose บน production

## 🔒 Content Security Policy (CSP)

- [ ] CSP headers configured
- [ ] Script sources restricted
- [ ] Object sources blocked
- [ ] Frame-ancestors controlled
- [ ] Report-only mode ทดสอบก่อน enforce

## 🔒 HTTPS & Transport Security

- [ ] All requests ใช้ HTTPS
- [ ] HSTS (HTTP Strict Transport Security) enabled
- [ ] Certificate pinning (ถ้าจำเป็น)
- [ ] Mixed content ไม่มี

---
*Security checklist for frontend reviews - Skill ของ Stella*
