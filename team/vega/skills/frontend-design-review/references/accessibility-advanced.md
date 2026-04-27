# Advanced Accessibility

## 📋 ARIA Patterns

### ARIA Roles
```html
<!-- Navigation role -->
<nav role="navigation" aria-label="Main navigation">
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/about">About</a></li>
  </ul>
</nav>

<!-- Main role -->
<main role="main" aria-label="Main content">
  <!-- Content -->
</main>

<!-- Complementary role -->
<aside role="complementary" aria-label="Sidebar">
  <!-- Sidebar content -->
</aside>
```

### ARIA Live Regions
```html
<!-- Polite announcements -->
<div aria-live="polite" aria-atomic="true">
  Changes saved successfully
</div>

<!-- Assertive announcements -->
<div aria-live="assertive" aria-atomic="true">
  Error occurred
</div>
```

### ARIA States and Properties
```html
<!-- Expanded/Collapsed state -->
<button aria-expanded="false" aria-controls="menu">
  Menu
</button>
<div id="menu" hidden>
  <!-- Menu items -->
</div>

<!-- Selected state -->
<li role="option" aria-selected="true">Option 1</li>

<!-- Disabled state -->
<button aria-disabled="true">Disabled button</button>

<!-- Busy state -->
<div aria-busy="true">Loading...</div>
```

## 📋 Screen Reader Testing

### NVDA (Windows)
- Download NVDA from https://www.nvaccess.org/
- Use NVDA + Firefox สำหรับ testing
- Navigate with Tab, Arrow keys, and NVDA commands
- Test keyboard navigation
- Test screen reader announcements

### JAWS (Windows)
- Download JAWS from https://www.freedomscientific.com/
- Use JAWS + IE/Edge สำหรับ testing
- Navigate with Tab, Arrow keys, and JAWS commands
- Test keyboard navigation
- Test screen reader announcements

### VoiceOver (macOS)
- Enable VoiceOver: Cmd + F5
- Navigate with Tab, Arrow keys, and VoiceOver commands
- Test keyboard navigation
- Test screen reader announcements

### Testing Checklist
- [ ] All interactive elements are keyboard accessible
- [ ] All images have alt text
- [ ] All forms have labels
- [ ] All dynamic content is announced
- [ ] All error messages are announced
- [ ] All focus indicators are visible
- [ ] All ARIA roles are correct
- [ ] All ARIA labels are descriptive

## 📋 Focus Management

### Focus Trap
```typescript
import { useEffect, useRef } from 'react';

function useFocusTrap(isActive: boolean) {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!isActive || !containerRef.current) return;

    const focusableElements = containerRef.current.querySelectorAll(
      'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
    );
    const firstElement = focusableElements[0] as HTMLElement;
    const lastElement = focusableElements[focusableElements.length - 1] as HTMLElement;

    const handleTab = (e: KeyboardEvent) => {
      if (e.key !== 'Tab') return;

      if (e.shiftKey) {
        if (document.activeElement === firstElement) {
          e.preventDefault();
          lastElement.focus();
        }
      } else {
        if (document.activeElement === lastElement) {
          e.preventDefault();
          firstElement.focus();
        }
      }
    };

    document.addEventListener('keydown', handleTab);
    firstElement.focus();

    return () => {
      document.removeEventListener('keydown', handleTab);
    };
  }, [isActive]);

  return containerRef;
}
```

### Focus Restoration
```typescript
import { useEffect, useRef } from 'react';

function useFocusRestoration(isActive: boolean) {
  const previousFocusRef = useRef<HTMLElement | null>(null);

  useEffect(() => {
    if (isActive) {
      previousFocusRef.current = document.activeElement as HTMLElement;
    } else {
      previousFocusRef.current?.focus();
    }
  }, [isActive]);
}
```

### Skip Links
```html
<a href="#main-content" class="skip-link">
  Skip to main content
</a>

<main id="main-content">
  <!-- Main content -->
</main>

<style>
.skip-link {
  position: absolute;
  top: -40px;
  left: 0;
  background: #000;
  color: #fff;
  padding: 8px;
  z-index: 100;
}

.skip-link:focus {
  top: 0;
}
</style>
```

## 📋 Keyboard Navigation

### Keyboard Shortcuts
```typescript
useEffect(() => {
  const handleKeyDown = (e: KeyboardEvent) => {
    // Escape to close modal
    if (e.key === 'Escape') {
      closeModal();
    }

    // Ctrl/Cmd + K to open search
    if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
      e.preventDefault();
      openSearch();
    }

    // Arrow keys for navigation
    if (e.key === 'ArrowDown') {
      navigateDown();
    }
    if (e.key === 'ArrowUp') {
      navigateUp();
    }
  };

  window.addEventListener('keydown', handleKeyDown);
  return () => window.removeEventListener('keydown', handleKeyDown);
}, []);
```

### Keyboard Navigation Patterns
```typescript
// Tab navigation
<button tabIndex={0}>Button</button>

// Arrow navigation
<div role="listbox" aria-orientation="vertical">
  <div role="option" tabIndex={0}>Option 1</div>
  <div role="option" tabIndex={-1}>Option 2</div>
  <div role="option" tabIndex={-1}>Option 3</div>
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

### Contrast Tools
- WebAIM Contrast Checker: https://webaim.org/resources/contrastchecker/
- Chrome DevTools Accessibility Panel
- axe DevTools
- WAVE

## 📋 Accessibility Testing Tools

### axe DevTools
```typescript
import { axe, toHaveNoViolations } from 'jest-axe';

expect.extend(toHaveNoViolations);

describe('Accessibility', () => {
  it('has no accessibility violations', async () => {
    const { container } = render(<App />);
    const results = await axe(container);
    expect(results).toHaveNoViolations();
  });
});
```

### Lighthouse Accessibility
```typescript
import lighthouse from 'lighthouse';
import chromeLauncher from 'chrome-launcher';

const chrome = await chromeLauncher.launch();
const options = {
  logLevel: 'info',
  output: 'json',
  onlyCategories: ['accessibility'],
  port: chrome.port,
};
const runnerResult = await lighthouse('https://example.com', options);
await chrome.kill();
```

### Pa11y
```javascript
// pa11y configuration
module.exports = {
  defaults: {
    standard: 'WCAG2.1AA',
    runners: ['axe', 'htmlcs'],
    rules: ['best-practice'],
  },
};
```

## 📋 Advanced Accessibility Patterns

### Accessible Modal
```typescript
function AccessibleModal({ isOpen, onClose, children }: ModalProps) {
  const modalRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (isOpen) {
      modalRef.current?.focus();
      document.body.style.overflow = 'hidden';
    } else {
      document.body.style.overflow = 'unset';
    }
  }, [isOpen]);

  return (
    isOpen && (
      <div
        ref={modalRef}
        role="dialog"
        aria-modal="true"
        aria-labelledby="modal-title"
        aria-describedby="modal-description"
      >
        <h2 id="modal-title">Modal Title</h2>
        <p id="modal-description">Modal description</p>
        {children}
        <button onClick={onClose}>Close</button>
      </div>
    )
  );
}
```

### Accessible Tabs
```typescript
function AccessibleTabs({ tabs }: { tabs: Tab[] }) {
  const [activeTab, setActiveTab] = useState(0);

  return (
    <div role="tablist">
      {tabs.map((tab, index) => (
        <button
          key={tab.id}
          role="tab"
          aria-selected={activeTab === index}
          aria-controls={`tabpanel-${tab.id}`}
          onClick={() => setActiveTab(index)}
        >
          {tab.label}
        </button>
      ))}
      {tabs.map((tab, index) => (
        <div
          key={tab.id}
          id={`tabpanel-${tab.id}`}
          role="tabpanel"
          aria-labelledby={`tab-${tab.id}`}
          hidden={activeTab !== index}
        >
          {tab.content}
        </div>
      ))}
    </div>
  );
}
```

### Accessible Carousel
```typescript
function AccessibleCarousel({ items }: { items: CarouselItem[] }) {
  const [currentIndex, setCurrentIndex] = useState(0);

  const handlePrevious = () => {
    setCurrentIndex((prev) => (prev === 0 ? items.length - 1 : prev - 1));
  };

  const handleNext = () => {
    setCurrentIndex((prev) => (prev === items.length - 1 ? 0 : prev + 1));
  };

  return (
    <div role="region" aria-label="Carousel">
      <div aria-live="polite">
        {items[currentIndex].content}
      </div>
      <button onClick={handlePrevious} aria-label="Previous slide">
        Previous
      </button>
      <button onClick={handleNext} aria-label="Next slide">
        Next
      </button>
    </div>
  );
}
```

## 📋 Accessibility Best Practices

### DOs
- ✅ ใช้ semantic HTML
- ✅ ใช้ ARIA labels เมื่อจำเป็น
- ✅ ใช้ keyboard navigation
- ✅ ใช้ screen reader testing
- ✅ ใช้ color contrast (WCAG AA)
- ✅ ใช้ focus management
- ✅ ใช้ skip links
- ✅ ใช้ accessibility testing tools
- ✅ ใช้ accessible patterns (modal, tabs, carousel)
- ✅ ใช้ proper heading structure

### DON'Ts
- ❌ ไม่ใช้ div แทน button หรือ link
- ❌ ไม่ลืม alt text สำหรับ images
- ❌ ไม่ใช้ color อย่างเดียวสำหรับ conveying information
- ❌ ไม่ block keyboard navigation
- ❌ ไม่ลืม focus trap ใน modals
- ❌ ไม่ใช้ auto-playing media โดยไม่ controls
- ❌ ไม่ใช้ insufficient contrast
- ❌ ไม่ใช้ improper heading structure
- ❌ ไม่ใช้ improper ARIA roles
- ❌ ไม่ใช้ improper ARIA labels

---
*Advanced Accessibility - Reference ของ Vega*
