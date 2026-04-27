# Accessibility Patterns

## 📋 WCAG 2.1 Compliance

### Level A (Must Have)
- **Perceivable:** Content ต้องเป็นไปได้ที่จะรับรู้ (text alternatives, time-based media, adaptable, distinguishable)
- **Operable:** Interface ต้องสามารถใช้งานได้ (keyboard accessible, enough time, seizures, navigable)
- **Understandable:** Content ต้องเข้าใจได้ (readable, predictable, input assistance)
- **Robust:** Content ต้อง robust สำหรับ technologies ต่างๆ

### Level AA (Should Have)
- **Color Contrast:** 4.5:1 สำหรับ normal text, 3:1 สำหรับ large text
- **Text Resize:** Text ต้อง resize ได้ถึง 200% โดยไม่หัก layout
- **Keyboard Focus:** Focus indicator ต้องชัดเจน
- **Error Identification:** Error messages ต้องชัดเจนและ actionable

### Level AAA (Nice to Have)
- **Color Contrast:** 7:1 สำหรับ normal text, 4.5:1 สำหรับ large text
- **Text Resize:** Text ต้อง resize ได้ถึง 400% โดยไม่หัก layout
- **Audio Description:** Audio description สำหรับ videos

## 📋 Semantic HTML

### Headings
```html
<h1>Main Heading</h1>
<h2>Section Heading</h2>
<h3>Subsection Heading</h3>
```

### Landmarks
```html
<nav aria-label="Main Navigation">
  <!-- Navigation links -->
</nav>

<main aria-label="Main Content">
  <!-- Main content -->
</main>

<aside aria-label="Sidebar">
  <!-- Sidebar content -->
</aside>

<footer aria-label="Footer">
  <!-- Footer content -->
</footer>
```

### Lists
```html
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
</ul>

<ol>
  <li>Step 1</li>
  <li>Step 2</li>
</ol>
```

### Buttons vs Links
```html
<!-- Button สำหรับ actions -->
<button type="button">Submit</button>

<!-- Link สำหรับ navigation -->
<a href="/page">Go to page</a>
```

## 📋 ARIA Labels

### ARIA Labels
```html
<button aria-label="Close dialog">×</button>
<input aria-label="Email address" type="email" />
```

### ARIA DescribedBy
```html
<input
  aria-describedby="password-help"
  type="password"
/>
<p id="password-help">Password must be at least 8 characters</p>
```

### ARIA Live
```html
<div aria-live="polite" aria-atomic="true">
  Status message
</div>

<div aria-live="assertive" aria-atomic="true">
  Error message
</div>
```

### ARIA Hidden
```html
<span aria-hidden="true">Decorative icon</span>
```

## 📋 Keyboard Navigation

### Tab Order
```html
<!-- Logical tab order -->
<button>Button 1</button>
<button>Button 2</button>
<button>Button 3</button>
```

### Focus Management
```html
<!-- Focus trap in modal -->
<div role="dialog" aria-modal="true">
  <button autoFocus>Close</button>
  <!-- Modal content -->
</div>
```

### Keyboard Shortcuts
```typescript
// Add keyboard shortcuts
useEffect(() => {
  const handleKeyDown = (e: KeyboardEvent) => {
    if (e.key === 'Escape') {
      closeModal();
    }
  };

  window.addEventListener('keydown', handleKeyDown);
  return () => window.removeEventListener('keydown', handleKeyDown);
}, []);
```

### Skip Links
```html
<a href="#main-content" class="skip-link">
  Skip to main content
</a>

<main id="main-content">
  <!-- Main content -->
</main>
```

## 📋 Screen Reader Support

### Alt Text
```html
<img src="logo.png" alt="Company Logo" />
<img src="chart.png" alt="Bar chart showing sales data for 2024" />
```

### Form Labels
```html
<label for="email">Email</label>
<input id="email" type="email" />

<!-- Or use aria-label -->
<input aria-label="Email address" type="email" />
```

### Error Messages
```html
<input
  aria-invalid="true"
  aria-describedby="error-message"
  type="email"
/>
<p id="error-message" role="alert">Please enter a valid email</p>
```

### Status Updates
```html
<div aria-live="polite" role="status">
  Your changes have been saved
</div>
```

## 📋 Color Contrast

### WCAG AA Contrast
```css
/* Normal text (4.5:1) */
.text-primary {
  color: #000000; /* #FFFFFF background */
}

/* Large text (3:1) */
.text-large {
  color: #333333; /* #FFFFFF background */
}
```

### Color Blind Testing
- Use tools สำหรับ test color blindness
- Ensure contrast สำหรับ all types of color blindness
- Don't rely on color alone สำหรับ conveying information

### Focus Indicators
```css
button:focus-visible {
  outline: 2px solid #0ea5e9;
  outline-offset: 2px;
}
```

## 📋 Accessibility Testing

### Manual Testing
- **Keyboard navigation:** Test ทุก functionality ด้วย keyboard
- **Screen reader:** Test ด้วย screen readers (NVDA, JAWS, VoiceOver)
- **Color contrast:** Test ด้วย contrast checker tools
- **Zoom:** Test ที่ 200% zoom

### Automated Testing
```typescript
// jest-axe สำหรับ automated accessibility testing
import { axe } from 'jest-axe';

describe('Button', () => {
  it('should have no accessibility violations', async () => {
    const { container } = render(<Button>Click me</Button>);
    const results = await axe(container);
    expect(results).toHaveNoViolations();
  });
});
```

### Lighthouse
```typescript
// Run Lighthouse accessibility audit
// Chrome DevTools → Lighthouse → Accessibility
```

## 📋 Best Practices

### DOs
- ✅ ใช้ semantic HTML
- ✅ ใส่ ARIA labels เมื่อจำเป็น
- ✅ รองรับ keyboard navigation
- ✅ Test ด้วย screen readers
- ✅ Ensure color contrast (WCAG AA)
- ✅ Provide alt text สำหรับ images
- ✅ Use focus indicators ที่ชัดเจน

### DON'Ts
- ❌ ไม่ใช้ div แทน button หรือ link
- ❌ ไม่ลืม alt text สำหรับ images
- ❌ ไม่ใช้ color อย่างเดียวสำหรับ conveying information
- ❌ ไม่ block keyboard navigation
- ❌ ไม่ลืม focus trap ใน modals
- ❌ ไม่ใช้ auto-playing media โดยไม่ controls

---
*Accessibility Patterns - Knowledge Package ของ Vega*
