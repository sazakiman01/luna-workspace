# React (TypeScript) Naming Conventions

## 📁 Folder Naming

| ประเภท | รูปแบบ | ตัวอย่าง |
|---------|----------|-----------|
| Folder ทั่วไป | kebab-case | `user-profile/`, `auth-forms/` |
| Folder ของ Component | PascalCase | `Button/`, `UserCard/` |
| Folder ของ Page | PascalCase | `Home/`, `UserProfile/` |

## 📄 File Naming

| ประเภท | รูปแบบ | ตัวอย่าง |
|---------|----------|-----------|
| Component | PascalCase.tsx | `Button.tsx`, `UserCard.tsx` |
| Page (ไฟล์เดียว) | PascalCase.tsx + suffix Page | `HomePage.tsx` |
| Page (folder) | index.tsx | `Home/index.tsx` |
| Hook | useXxx.ts | `useAuth.ts`, `useDebounce.ts` |
| Context | PascalCase.tsx + suffix Context | `AuthContext.tsx` |
| Utility | kebab-case.ts | `format-date.ts` |
| Types | kebab-case.ts หรือ xxx.types.ts | `user.types.ts` |
| Constants | kebab-case.ts | `api-routes.ts` |
| Style module | PascalCase.module.css | `Button.module.css` |
| Test | ตามไฟล์หลัก + .test | `Button.test.tsx` |

## 🗂️ โครงสร้างแนะนำ

```
src/
├── components/              ← ใช้ร่วมทั้งแอป
│   ├── ui/                  (Button, Input, Modal)
│   └── layout/              (Header, Footer)
│
├── pages/                   ← แต่ละหน้า = 1 folder
│   ├── Home/
│   │   ├── index.tsx
│   │   ├── Home.module.css
│   │   └── components/      (component ย่อยเฉพาะหน้า)
│   └── UserProfile/
│       └── index.tsx
│
├── hooks/                   (useAuth, useDebounce)
├── lib/                     (format-date, api-client)
├── contexts/                (AuthContext)
├── types/                   (user.ts)
├── constants/               (api-routes.ts)
│
├── App.tsx
└── main.tsx
```

## ⭐ กฎทองที่ต้องจำ

1. **Component ต้องขึ้นต้นด้วยตัวพิมพ์ใหญ่** — React บังคับ
2. **Hook ต้องขึ้นต้นด้วย use** — React บังคับ
3. **1 component = 1 file** และชื่อไฟล์ตรงกับชื่อ component
4. **เลือก convention แล้วใช้ให้สม่ำเสมอ** ทั้งโปรเจกต์
5. **Page ซับซ้อน → ใช้ folder + index.tsx** / **Page ง่าย → ไฟล์เดียวพอ**
6. **ของใช้ทั่วแอปอยู่ components/** / **ของใช้เฉพาะหน้าอยู่ใน folder ของหน้านั้น**

## 💡 Naming Patterns ที่ควรรู้

### Boolean Props
- ✅ `isOpen`, `hasError`, `shouldRender`, `isLoading`
- ❌ `open`, `error`, `render`, `loading`

### Event Handler (ภายใน component)
- ✅ `handleClick`, `handleSubmit`, `handleChange`
- ❌ `onClick`, `onSubmit`, `onChange` (ใช้สำหรับ props)

### Event Props (ภายนอก component)
- ✅ `onClick`, `onSubmit`, `onChange`
- ❌ `handleClick`, `handleSubmit`, `handleChange` (ใช้สำหรับ internal)

### หลีกเลี่ยงชื่อกว้าง
- ❌ `Utils.tsx`, `Helper.tsx`, `Common.tsx`
- ❌ `Components/`, `Utils/`, `Helpers/`
- ✅ `format-date.ts`, `api-client.ts`, `date-utils.ts`

### Interface vs Type (TypeScript)
- ✅ Interface สำหรับ objects: `interface User { ... }`
- ✅ Type สำหรับ unions/primitives: `type Status = 'active' | 'inactive'`
- ✅ Type สำหรับ function signatures: `type EventHandler = (event: Event) => void`

## 🎯 React-Specific Naming Rules

### Component Names
- ต้องขึ้นต้นด้วยตัวพิมพ์ใหญ่ (PascalCase)
- ควรเป็นคำนาม (Button, UserCard, Modal)
- หลีกเลี่ยงคำกริยา (Click, Submit, Handle)

### Hook Names
- ต้องขึ้นต้นด้วย `use` (camelCase)
- ควรเป็นคำกริยาหรือคำนามที่บ่งบอกการกระทำ (useAuth, useDebounce, useLocalStorage)

### Context Names
- ต้องลงท้ายด้วย `Context` (AuthContext, ThemeContext, UserContext)
- ตัวพิมพ์ใหญ่ (PascalCase)

## 📋 File Organization Best Practices

### Component File Structure
```
Button/
├── Button.tsx          ← Main component
├── Button.module.css   ← Styles
├── Button.test.tsx     ← Tests
└── index.ts            ← Export (ถ้าจำเป็น)
```

หรือ (ถ้า component เล็ก):
```
Button.tsx
Button.module.css
Button.test.tsx
```

### Page File Structure
```
Home/
├── index.tsx              ← Main page component
├── Home.module.css       ← Page styles
├── components/           ← Page-specific components
│   ├── HeroSection.tsx
│   └── FeatureCard.tsx
└── hooks/                ← Page-specific hooks
    └── useHomeData.ts
```

## 🔍 Review Checklist

เมื่อ review code ตรวจสอบ:
- [ ] Component ขึ้นต้นด้วยตัวพิมพ์ใหญ่
- [ ] Hook ขึ้นต้นด้วย `use`
- [ ] ชื่อไฟล์ตรงกับชื่อ component/hook
- [ ] Folder naming consistent (kebab-case หรือ PascalCase)
- [ ] Boolean props ใช้ prefix ที่ถูกต้อง (is/has/should)
- [ ] Event handlers ใช้ `handle` prefix (internal)
- [ ] Event props ใช้ `on` prefix (external)
- [ ] ไม่มีชื่อกว้างอย่าง Utils.tsx, Helper.tsx
- [ ] Context ลงท้ายด้วย `Context`
- [ ] Types อยู่ในไฟล์ `.types.ts` หรือ `types/` folder

---
*Naming Conventions Reference - Skill ของ Stella*
