# Design Tokens

## 📋 Color Tokens

### Semantic Color Tokens
```css
:root {
  /* Primary colors */
  --color-primary-50: #f0f9ff;
  --color-primary-100: #e0f2fe;
  --color-primary-200: #bae6fd;
  --color-primary-300: #7dd3fc;
  --color-primary-400: #38bdf8;
  --color-primary-500: #0ea5e9;
  --color-primary-600: #0284c7;
  --color-primary-700: #0369a1;
  --color-primary-800: #075985;
  --color-primary-900: #0c4a6e;

  /* Semantic colors */
  --color-success: #22c55e;
  --color-warning: #f59e0b;
  --color-error: #ef4444;
  --color-info: #3b82f6;

  /* Neutral colors */
  --color-neutral-50: #fafafa;
  --color-neutral-100: #f4f4f5;
  --color-neutral-200: #e4e4e7;
  --color-neutral-300: #d4d4d8;
  --color-neutral-400: #a1a1aa;
  --color-neutral-500: #71717a;
  --color-neutral-600: #52525b;
  --color-neutral-700: #3f3f46;
  --color-neutral-800: #27272a;
  --color-neutral-900: #18181b;
}
```

### Dark Mode Tokens
```css
@media (prefers-color-scheme: dark) {
  :root {
    --color-primary-50: #0c4a6e;
    --color-primary-100: #075985;
    --color-primary-200: #0369a1;
    --color-primary-300: #0284c7;
    --color-primary-400: #0ea5e9;
    --color-primary-500: #38bdf8;
    --color-primary-600: #7dd3fc;
    --color-primary-700: #bae6fd;
    --color-primary-800: #e0f2fe;
    --color-primary-900: #f0f9ff;

    --color-neutral-50: #18181b;
    --color-neutral-100: #27272a;
    --color-neutral-200: #3f3f46;
    --color-neutral-300: #52525b;
    --color-neutral-400: #71717a;
    --color-neutral-500: #a1a1aa;
    --color-neutral-600: #d4d4d8;
    --color-neutral-700: #e4e4e7;
    --color-neutral-800: #f4f4f5;
    --color-neutral-900: #fafafa;
  }
}
```

## 📋 Typography Tokens

### Font Scale Tokens
```css
:root {
  --font-size-xs: 0.75rem;    /* 12px */
  --font-size-sm: 0.875rem;   /* 14px */
  --font-size-base: 1rem;     /* 16px */
  --font-size-lg: 1.125rem;   /* 18px */
  --font-size-xl: 1.25rem;    /* 20px */
  --font-size-2xl: 1.5rem;    /* 24px */
  --font-size-3xl: 1.875rem;  /* 30px */
  --font-size-4xl: 2.25rem;   /* 36px */
}
```

### Font Weight Tokens
```css
:root {
  --font-weight-light: 300;
  --font-weight-normal: 400;
  --font-weight-medium: 500;
  --font-weight-semibold: 600;
  --font-weight-bold: 700;
}
```

### Line Height Tokens
```css
:root {
  --line-height-none: 1;
  --line-height-tight: 1.25;
  --line-height-normal: 1.5;
  --line-height-loose: 2;
}
```

### Letter Spacing Tokens
```css
:root {
  --letter-spacing-tight: -0.025em;
  --letter-spacing-normal: 0;
  --letter-spacing-wide: 0.025em;
  --letter-spacing-wider: 0.05em;
  --letter-spacing-widest: 0.1em;
}
```

## 📋 Spacing Tokens

### Spacing Scale
```css
:root {
  --spacing-0: 0;
  --spacing-1: 0.25rem;  /* 4px */
  --spacing-2: 0.5rem;   /* 8px */
  --spacing-3: 0.75rem;  /* 12px */
  --spacing-4: 1rem;     /* 16px */
  --spacing-5: 1.25rem;  /* 20px */
  --spacing-6: 1.5rem;   /* 24px */
  --spacing-8: 2rem;     /* 32px */
  --spacing-10: 2.5rem;  /* 40px */
  --spacing-12: 3rem;    /* 48px */
  --spacing-16: 4rem;    /* 64px */
  --spacing-20: 5rem;    /* 80px */
  --spacing-24: 6rem;    /* 96px */
}
```

## 📋 Border Radius Tokens

```css
:root {
  --radius-none: 0;
  --radius-sm: 0.25rem;  /* 4px */
  --radius-md: 0.375rem; /* 6px */
  --radius-lg: 0.5rem;   /* 8px */
  --radius-xl: 0.75rem;  /* 12px */
  --radius-2xl: 1rem;    /* 16px */
  --radius-3xl: 1.5rem;  /* 24px */
  --radius-full: 9999px;
}
```

## 📋 Shadow Tokens

```css
:root {
  --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
  --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1);
  --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1);
  --shadow-2xl: 0 25px 50px -12px rgb(0 0 0 / 0.25);
}
```

## 📋 Z-Index Tokens

```css
:root {
  --z-index-dropdown: 1000;
  --z-index-sticky: 1020;
  --z-index-fixed: 1030;
  --z-index-modal-backdrop: 1040;
  --z-index-modal: 1050;
  --z-index-popover: 1060;
  --z-index-tooltip: 1070;
}
```

## 📋 Animation Tokens

### Duration Tokens
```css
:root {
  --duration-instant: 50ms;
  --duration-fast: 150ms;
  --duration-normal: 300ms;
  --duration-slow: 500ms;
  --duration-slower: 700ms;
}
```

### Easing Tokens
```css
:root {
  --ease-linear: linear;
  --ease-in: cubic-bezier(0.4, 0, 1, 1);
  --ease-out: cubic-bezier(0, 0, 0.2, 1);
  --ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
}
```

## 📋 Breakpoint Tokens

```css
:root {
  --breakpoint-sm: 640px;
  --breakpoint-md: 768px;
  --breakpoint-lg: 1024px;
  --breakpoint-xl: 1280px;
  --breakpoint-2xl: 1536px;
}
```

## 📋 Design Token Management

### Figma Tokens
- Use Figma Variables สำหรับ design tokens
- Export tokens สำหรับ development
- Sync tokens ระหว่าง Figma และ code

### Style Dictionary
```json
{
  "color": {
    "primary": {
      "50": { "value": "#f0f9ff" },
      "500": { "value": "#0ea5e9" },
      "900": { "value": "#0c4a6e" }
    }
  }
}
```

### Token Usage
```typescript
// Use CSS variables
const buttonStyle = {
  backgroundColor: 'var(--color-primary-500)',
  padding: 'var(--spacing-4)',
  borderRadius: 'var(--radius-md)',
};

// Or use token object
const tokens = {
  colors: {
    primary: {
      50: '#f0f9ff',
      500: '#0ea5e9',
      900: '#0c4a6e',
    },
  },
};
```

## 📋 Best Practices

### DOs
- ✅ ใช้ design tokens สำหรับ consistency
- ✅ ใช้ semantic naming สำหรับ tokens
- ✅ ใช้ CSS variables สำหรับ runtime theming
- ✅ ใช้ token management tools (Style Dictionary, Figma)
- ✅ ใช้ dark mode tokens
- ✅ ใช้ responsive tokens
- ✅ ใช้ animation tokens
- ✅ ใช้ spacing scale สำหรับ consistency
- ✅ ใช้ type scale สำหรับ consistency
- ✅ ใช้ consistent naming convention

### DON'Ts
- ❌ ไม่ใช้ hardcoded values
- ❌ ไม่ใช้ magic numbers
- ❌ ไม่ใช้ inconsistent naming
- ❌ ไม่ใช้ non-semantic naming
- ❌ ไม่ใช้ too many token variations
- ❌ ไม่ใช้ non-scalable token system
- ❌ ไม่ใช้ token ที่ไม่ได้ใช้
- ❌ ไม่ใช้ token ที่ไม่จำเป็น
- ❌ ไม่ใช้ token ที่ duplicate
- ❌ ไม่ใช้ token ที่ conflict

---
*Design Tokens - Reference ของ Vega*
