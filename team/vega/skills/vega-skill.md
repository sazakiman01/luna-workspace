---
description: Comprehensive UI/UX design guidelines สำหรับ LIFF, mobile-first UX, component design systems, accessibility (WCAG 2.1, ARIA), และ design patterns
---

# Vega Skill - Comprehensive UI/UX Design

## 🎯 Purpose

Comprehensive UI/UX design guidelines สำหรับ LIFF, mobile-first UX, component design systems, accessibility (WCAG 2.1, ARIA), และ design patterns

## 📋 Core Competencies

### 1. LIFF Interface Design
- **LIFF Constraints:** Screen size, Platform differences, LINE ecosystem
- **Mobile-First:** Design สำหรับ mobile ก่อน desktop
- **LINE Design System:** ใช้ LINE design language ที่สอดคล้องกับ LINE ecosystem
- **User Flow:** Optimize user flow สำหรับ LINE environment

### 2. Mobile-First UX
- **Touch Targets:** ขนาดที่เหมาะสมสำหรับ touch (min 44x44px)
- **Gesture Support:** Swipe, pinch, long press
- **Responsive Design:** Adapt กับ screen sizes ต่างๆ
- **Performance:** Fast loading, smooth animations

### 3. Component Design
- **shadcn/ui:** ใช้ shadcn/ui components เป็น base
- **Customization:** Customize components ให้เหมาะกับ brand
- **Consistency:** ใช้ design system ที่ consistent ทั้ง app
- **Accessibility:** Components ที่ accessible ตาม WCAG 2.1

### 4. Accessibility (WCAG 2.1)
- **Semantic HTML:** ใช้ tags ที่ถูกต้อง
- **ARIA Labels:** เพิ่ม aria-label, aria-describedBy เมื่อจำเป็น
- **Keyboard Navigation:** รองรับ keyboard ทุก functionality
- **Screen Reader Support:** ทำงานกับ screen readers อย่างดี
- **Color Contrast:** ระดับ contrast ที่เพียงพอ (WCAG AA)

## 🎯 LIFF Design Guidelines

### Screen Constraints
- **LIFF v2:** Max width 100% ของ LINE app
- **Viewport:** ใช้ full viewport ของ LINE
- **Safe Area:** ใช้ safe area สำหรับ notches และ home indicators
- **Orientation:** รองรับ portrait และ landscape

### LINE Design Language
- **Color Palette:** ใช้ LINE colors (LINE Green, LINE Gray)
- **Typography:** ใช้ fonts ที่ LINE ใช้ (LINE Seed, LINE Sans)
- **Iconography:** ใช้ LINE icons หรือ icons ที่ consistent
- **Components:** ใช้ LINE-style components (buttons, cards, dialogs)

### User Flow Optimization
- **Minimal Steps:** Reduce steps ในการทำงาน
- **Clear CTAs:** Call-to-action ที่ชัดเจน
- **Progress Indicators:** แสดง progress เมื่อมี multi-step process
- **Error Handling:** Error messages ที่ชัดเจนและ actionable

## 🎯 Mobile-First UX Patterns

### Touch Targets
- **Minimum Size:** 44x44px สำหรับ touch targets
- **Spacing:** เว้น spacing อย่างน้อย 8px ระหว่าง elements
- **Thumb Zone:** วาง important elements ใน thumb zone
- **Gesture Support:** รองรับ swipe, pinch, long press

### Responsive Design
- **Breakpoints:**
  - Mobile: < 640px
  - Tablet: 640px - 1024px
  - Desktop: > 1024px
- **Fluid Layouts:** ใช้ % และ flexbox แทน fixed widths
- **Responsive Images:** ใช้ srcset และ sizes
- **Responsive Typography:** ใช้ clamp() สำหรับ font sizes

### Performance
- **Fast Loading:** Optimize images, lazy load components
- **Smooth Animations:** ใช้ CSS transforms แทน layout changes
- **60 FPS:** Maintain 60 FPS สำหรับ animations
- **Optimize Bundle:** Code splitting, tree shaking

## 🎯 Component Design System

### shadcn/ui Customization
- **Theme:** Customize theme ให้เหมาะกับ brand
- **Colors:** Define color palette ที่ consistent
- **Typography:** Define typography scale
- **Spacing:** Define spacing scale
- **Border Radius:** Define border radius scale

### Component Patterns
- **Atomic Design:** Atoms, Molecules, Organisms
- **Compound Components:** Components ที่ work together
- **Render Props:** Components ที่ accept render props
- **Control Props:** Parent controls child state

### Design Tokens
- **Colors:** Primary, Secondary, Accent, Neutral
- **Typography:** Font sizes, weights, line heights
- **Spacing:** Scale 4, 8, 12, 16, 20, 24, 32, 40, 48, 64
- **Border Radius:** 0, 4, 8, 12, 16, 24, 32
- **Shadows:** Elevation levels

## 🎯 Accessibility (WCAG 2.1)

### Semantic HTML
- **Headings:** ใช้ headings อย่างถูกต้อง (h1-h6)
- **Landmarks:** ใช้ landmarks (nav, main, article, aside, footer)
- **Lists:** ใช้ lists อย่างถูกต้อง (ul, ol, dl)
- **Buttons:** ใช้ <button> ไม่ใช้ <div> ที่มี onclick

### ARIA Labels
- **aria-label:** ใช้สำหรับ icons ที่ไม่มี text
- **aria-describedBy:** ใช้สำหรับ additional descriptions
- **aria-live:** ใช้สำหรับ dynamic content
- **aria-hidden:** ใช้สำหรับ decorative elements

### Keyboard Navigation
- **Tab Order:** Logical tab order
- **Focus Indicators:** Visible focus indicators
- **Keyboard Shortcuts:** Provide keyboard shortcuts สำหรับ common actions
- **Skip Links:** Provide skip links สำหรับ navigation

### Screen Reader Support
- **Alt Text:** ใช้ alt text สำหรับ images
- **Form Labels:** ใช้ labels สำหรับ form inputs
- **Error Messages:** ใช้ aria-invalid และ aria-describedBy สำหรับ errors
- **Status Messages:** ใช้ aria-live สำหรับ status updates

### Color Contrast
- **WCAG AA:** 4.5:1 สำหรับ normal text, 3:1 สำหรับ large text
- **WCAG AAA:** 7:1 สำหรับ normal text, 4.5:1 สำหรับ large text
- **Color Blind:** Test สำหรับ color blindness
- **Dark Mode:** Ensure contrast ใน dark mode

## 🎯 Design Patterns

### Navigation Patterns
- **Bottom Navigation:** สำหรับ mobile apps
- **Tab Bar:** สำหรับ switching views
- **Drawer/Sidebar:** สำหรับ additional navigation
- **Breadcrumbs:** สำหรับ hierarchical navigation

### Form Patterns
- **Single Column:** Single column layout สำหรับ mobile
- **Inline Validation:** Validate ขณะ input
- **Progressive Disclosure:** แสดง fields เมื่อจำเป็น
- **Auto-save:** Auto-save forms เพื่อ prevent data loss

### Content Patterns
- **Card Layout:** Cards สำหรับ displaying content
- **List Layout:** Lists สำหรับ displaying items
- **Grid Layout:** Grids สำหรับ displaying galleries
- **Infinite Scroll:** Load more content เมื่อ scroll

### Feedback Patterns
- **Toast Notifications:** Short notifications
- **Modal Dialogs:** Confirmations และ alerts
- **Progress Indicators:** Progress bars แล spinners
- **Empty States:** Empty states สำหรับ no data

## 🎯 Design Review Checklist

### Visual Design
- [ ] Consistent color palette
- [ ] Consistent typography
- [ ] Consistent spacing
- [ ] Consistent border radius
- [ ] Consistent shadows

### Accessibility
- [ ] Semantic HTML
- [ ] ARIA labels
- [ ] Keyboard navigation
- [ ] Screen reader support
- [ ] Color contrast (WCAG AA)

### Mobile UX
- [ ] Touch targets (min 44x44px)
- [ ] Responsive design
- [ ] Fast loading
- [ ] Smooth animations
- [ ] Gesture support

### LIFF Specific
- [ ] LIFF constraints respected
- [ ] LINE design language used
- [ ] User flow optimized
- [ ] Error handling
- [ ] Performance optimized

## 🔧 Tools to Use

- **Grep** - ค้นหา patterns ใน code
- **Read** - อ่านไฟล์ source code
- **Find** - ค้นหาไฟล์ตาม pattern
- **Edit/Multi-edit** - แก้ไข code (ถ้าได้รับอนุญาต)

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- ออกแบบ LIFF interface
- ทำ mobile-first UX design
- ออกแบบ UI components
- ทำ accessibility review
- ออกแบบ design system
- ทำ user flow แล wireframes
- ทำ design review

## 📝 Notes

- ใช้ shadcn/ui สำหรับ base components
- ใช้ Tailwind CSS สำหรับ styling
- ใช้ LINE design language สำหรับ LIFF
- ใช้ WCAG 2.1 สำหรับ accessibility
- ใช้ mobile-first approach สำหรับ responsive design

---
*Vega Skill - Comprehensive UI/UX Design*
