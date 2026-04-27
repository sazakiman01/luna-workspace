# Frontend Best Practices Reference

## 🎯 React Best Practices

### Component Design
- **Single Responsibility** - แต่ละ component ทำอย่างเดียวให้ดี
- **Composition over Inheritance** - ใช้ composition แทน inheritance
- **Keep components small** - ไม่เกิน 200-300 lines ถ้าเป็นไปได้
- **Pure components** - ใช้ React.memo, useMemo, useCallback เหมาะสม

### Hooks
- **Rules of Hooks** - เรียก hooks ที่ top level เท่านั้น
- **Custom hooks** - extract reusable logic
- **useEffect dependencies** - ระบุ dependencies ให้ครบถ้วน
- **Cleanup** - ใส่ cleanup function ใน useEffect

### State Management
- **Lift state up** - state ที่ share ให้ยกขึ้นไป parent
- **Context API** - ใช้สำหรับ global state (theme, auth)
- **Redux/Zustand** - ใช้สำหรับ complex state management
- **Local state** - ใช้ useState สำหรับ component-local state

### Performance
- **Code splitting** - ใช้ React.lazy, Suspense
- **Virtualization** - ใช้ react-window สำหรับ long lists
- **Debounce/Throttle** - สำหรับ search, resize events
- **Avoid inline functions** - ใน render props ถ้าเป็นไปได้

## 🎯 Vue Best Practices

### Component Design
- **Single File Components** - ใช้ .vue format
- **Props validation** - ระบุ types และ validators
- **Emit events** - ใช้ defineEmits พร้อม type
- **Composition API** - ใช้ script setup syntax

### Reactivity
- **ref vs reactive** - ref สำหรับ primitives, reactive สำหรับ objects
- **computed** - ใช้ computed properties สำหรับ derived state
- **watch vs watchEffect** - watch สำหรับ specific sources, watchEffect สำหรับ auto-tracking

### Performance
- **v-if vs v-show** - v-if สำหรับ toggle ไม่บ่อย, v-show สำหรับ toggle บ่อย
- **v-for keys** - ใช้ unique keys เสมอ
- **Async components** - ใช้ defineAsyncComponent

## 🎯 Angular Best Practices

### Component Design
- **Single Responsibility** - แต่ละ component ทำอย่างเดียว
- **Smart vs Dumb components** - Smart components จัดการ state, Dumb components แค่ render
- **Input/Output** - ใช้ @Input, @Output อย่างชัดเจน
- **Change detection** - ใช้ OnPush strategy เมื่อเป็นไปได้

### Services
- **Separation of concerns** - business logic อยู่ใน services
- **Dependency Injection** - ใช้ DI อย่างถูกต้อง
- **Singleton pattern** - services เป็น singleton โดย default

### RxJS
- **Unsubscribe** - ใช้ takeUntil, async pipe หรือ destroy subscription
- **Operators** - ใช้ operators อย่างเหมาะสม (map, filter, switchMap)
- **Memory leaks** - ระวัง subscriptions ที่ไม่ถูก unsubscribe

## 🎯 TypeScript Best Practices

### Types
- **Avoid any** - ใช้ specific types เสมอ
- **Interface vs Type** - interface สำหรับ objects, type สำหรับ unions/primitives
- **Generics** - ใช้ generics สำหรับ reusable components
- **Type inference** - ให้ TypeScript infer types เมื่อเป็นไปได้

### Configuration
- **strict mode** - เปิด strict: true
- **noImplicitAny** - ไม่อนุญาต implicit any
- **esModuleInterop** - สำหรับ compatibility กับ CommonJS

## 🎯 General Frontend Best Practices

### Code Organization
- **Folder structure** - ตรงตาม convention (features-based vs type-based)
- **Import order** - จัด imports อย่างเป็นระเบียบ
- **Naming conventions** - consistent naming (PascalCase สำหรับ components, camelCase สำหรับ functions)

### Accessibility
- **Semantic HTML** - ใช้ tags ที่ถูกต้อง (nav, main, article)
- **ARIA labels** - เพิ่ม aria-label, aria-describedBy เมื่อจำเป็น
- **Keyboard navigation** - รองรับ keyboard ทุก functionality
- **Focus management** - จัดการ focus อย่างถูกต้อง

### Security
- **XSS prevention** - ใช้ frameworks' built-in escaping
- **Content Security Policy** - set CSP headers
- **Input validation** - validate ทั้ง client และ server side
- **Environment variables** - ไม่ hardcode secrets

### Performance
- **Bundle size** - monitor และ optimize bundle size
- **Image optimization** - ใช้ modern formats (WebP, AVIF)
- **Lazy loading** - lazy load components, images
- **Caching** - ใช้ browser caching, service workers

---
*Reference for frontend best practices - Skill ของ Stella*
