# Design System

## 📋 Color Palette

### Primary Colors
```css
--primary-50: #f0f9ff;
--primary-100: #e0f2fe;
--primary-200: #bae6fd;
--primary-300: #7dd3fc;
--primary-400: #38bdf8;
--primary-500: #0ea5e9;
--primary-600: #0284c7;
--primary-700: #0369a1;
--primary-800: #075985;
--primary-900: #0c4a6e;
```

### Secondary Colors
```css
--secondary-50: #fdf4ff;
--secondary-100: #fae8ff;
--secondary-200: #f5d0fe;
--secondary-300: #f0abfc;
--secondary-400: #e879f9;
--secondary-500: #d946ef;
--secondary-600: #c026d3;
--secondary-700: #a21caf;
--secondary-800: #86198f;
--secondary-900: #701a75;
```

### Neutral Colors
```css
--neutral-50: #fafafa;
--neutral-100: #f4f4f5;
--neutral-200: #e4e4e7;
--neutral-300: #d4d4d8;
--neutral-400: #a1a1aa;
--neutral-500: #71717a;
--neutral-600: #52525b;
--neutral-700: #3f3f46;
--neutral-800: #27272a;
--neutral-900: #18181b;
```

### Semantic Colors
```css
--success: #22c55e;
--warning: #f59e0b;
--error: #ef4444;
--info: #3b82f6;
```

## 📋 Typography

### Font Scale
```css
--font-xs: 0.75rem;    /* 12px */
--font-sm: 0.875rem;   /* 14px */
--font-base: 1rem;     /* 16px */
--font-lg: 1.125rem;   /* 18px */
--font-xl: 1.25rem;    /* 20px */
--font-2xl: 1.5rem;    /* 24px */
--font-3xl: 1.875rem;  /* 30px */
--font-4xl: 2.25rem;   /* 36px */
```

### Font Weights
```css
--font-light: 300;
--font-normal: 400;
--font-medium: 500;
--font-semibold: 600;
--font-bold: 700;
```

### Line Heights
```css
--leading-none: 1;
--leading-tight: 1.25;
--leading-normal: 1.5;
--leading-loose: 2;
```

## 📋 Spacing Scale

```css
--space-0: 0;
--space-1: 0.25rem;  /* 4px */
--space-2: 0.5rem;   /* 8px */
--space-3: 0.75rem;  /* 12px */
--space-4: 1rem;     /* 16px */
--space-5: 1.25rem;  /* 20px */
--space-6: 1.5rem;   /* 24px */
--space-8: 2rem;     /* 32px */
--space-10: 2.5rem;  /* 40px */
--space-12: 3rem;    /* 48px */
--space-16: 4rem;    /* 64px */
```

## 📋 Border Radius

```css
--radius-none: 0;
--radius-sm: 0.25rem;  /* 4px */
--radius-md: 0.375rem; /* 6px */
--radius-lg: 0.5rem;   /* 8px */
--radius-xl: 0.75rem;  /* 12px */
--radius-2xl: 1rem;    /* 16px */
--radius-3xl: 1.5rem;  /* 24px */
--radius-full: 9999px;
```

## 📋 Shadows

```css
--shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
--shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
--shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1);
--shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1);
--shadow-2xl: 0 25px 50px -12px rgb(0 0 0 / 0.25);
```

## 📋 shadcn/ui Customization

### Theme Configuration
```typescript
// tailwind.config.ts
export default {
  theme: {
    extend: {
      colors: {
        primary: {
          DEFAULT: 'var(--primary-500)',
          foreground: 'var(--primary-foreground)',
        },
        // ... other colors
      },
      borderRadius: {
        lg: 'var(--radius)',
        md: 'calc(var(--radius) - 2px)',
        sm: 'calc(var(--radius) - 4px)',
      },
    },
  },
};
```

### Component Customization
```typescript
// components/ui/button.tsx
import { cn } from '@/lib/utils';

interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'default' | 'outline' | 'ghost';
}

export function Button({ className, variant = 'default', ...props }: ButtonProps) {
  return (
    <button
      className={cn(
        'px-4 py-2 rounded-md font-medium transition-colors',
        variant === 'default' && 'bg-primary text-white hover:bg-primary-600',
        variant === 'outline' && 'border border-primary text-primary hover:bg-primary-50',
        variant === 'ghost' && 'hover:bg-primary-50 text-primary',
        className
      )}
      {...props}
    />
  );
}
```

## 📋 Design Tokens

### Spacing Tokens
```typescript
const spacing = {
  xs: '4px',
  sm: '8px',
  md: '16px',
  lg: '24px',
  xl: '32px',
  '2xl': '48px',
  '3xl': '64px',
};
```

### Typography Tokens
```typescript
const typography = {
  h1: { fontSize: '36px', fontWeight: 700, lineHeight: 1.2 },
  h2: { fontSize: '30px', fontWeight: 600, lineHeight: 1.3 },
  h3: { fontSize: '24px', fontWeight: 600, lineHeight: 1.4 },
  h4: { fontSize: '20px', fontWeight: 500, lineHeight: 1.5 },
  body: { fontSize: '16px', fontWeight: 400, lineHeight: 1.6 },
  small: { fontSize: '14px', fontWeight: 400, lineHeight: 1.5 },
};
```

### Border Radius Tokens
```typescript
const borderRadius = {
  none: '0',
  sm: '4px',
  md: '8px',
  lg: '12px',
  xl: '16px',
  full: '9999px',
};
```

## 📋 Component Guidelines

### Button
- **Primary:** สำหรับ primary actions
- **Secondary:** สำหรับ secondary actions
- **Ghost:** สำหรับ less important actions
- **Destructive:** สำหรับ destructive actions

### Input
- **Default:** สำหรับ general inputs
- **Error:** สำหรับ invalid inputs
- **Disabled:** สำหรับ disabled inputs

### Card
- **Elevation:** ใช้ shadow สำหรับ elevation
- **Padding:** ใช้ spacing scale สำหรับ padding
- **Border Radius:** ใช้ border radius scale

### Modal
- **Backdrop:** ใช้ backdrop blur สำหรับ backdrop
- **Animation:** ใช้ smooth animation สำหรับ open/close
- **Focus Trap:** ใช้ focus trap สำหรับ accessibility

## 📋 Dark Mode

### Color Mapping
```css
@media (prefers-color-scheme: dark) {
  :root {
    --primary-50: #0c4a6e;
    --primary-100: #075985;
    --primary-200: #0369a1;
    --primary-300: #0284c7;
    --primary-400: #0ea5e9;
    --primary-500: #38bdf8;
    --primary-600: #7dd3fc;
    --primary-700: #bae6fd;
    --primary-800: #e0f2fe;
    --primary-900: #f0f9ff;
  }
}
```

### Component Adaptation
```typescript
// Use CSS variables สำหรับ adaptive colors
.button {
  background-color: var(--primary-500);
  color: var(--primary-foreground);
}
```

---
*Design System - Knowledge Package ของ Vega*
