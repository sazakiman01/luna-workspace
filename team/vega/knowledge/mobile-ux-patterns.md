# Mobile UX Patterns

## 📋 Touch Targets

### Minimum Size
```css
.button {
  min-width: 44px;
  min-height: 44px;
  padding: 12px 24px;
}
```

### Spacing Between Elements
```css
.form-group {
  margin-bottom: 16px;
}

.button + .button {
  margin-left: 8px;
}
```

### Thumb Zone
```css
/* Place important elements in thumb zone */
.bottom-navigation {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  height: 60px;
}
```

## 📋 Gesture Support

### Swipe
```typescript
import { useSwipeable } from 'react-swipeable';

function SwipeableComponent() {
  const handlers = useSwipeable({
    onSwipedLeft: () => console.log('Swiped left'),
    onSwipedRight: () => console.log('Swiped right'),
  });

  return <div {...handlers}>Swipe me</div>;
}
```

### Pinch
```typescript
import { usePinch } from '@use-gesture/react';

function PinchableComponent() {
  const bind = usePinch(({ offset: [s] }) => {
    setScale(s);
  });

  return <div {...bind()} style={{ transform: `scale(${scale})` }}>Pinch me</div>;
}
```

### Long Press
```typescript
import { useLongPress } from '@use-gesture/react';

function LongPressComponent() {
  const bind = useLongPress(() => {
    console.log('Long pressed');
  });

  return <button {...bind()}>Long press me</button>;
}
```

## 📋 Responsive Design

### Breakpoints
```css
/* Mobile */
@media (max-width: 640px) {
  .container {
    padding: 16px;
  }
}

/* Tablet */
@media (min-width: 641px) and (max-width: 1024px) {
  .container {
    padding: 24px;
  }
}

/* Desktop */
@media (min-width: 1025px) {
  .container {
    padding: 32px;
    max-width: 1200px;
    margin: 0 auto;
  }
}
```

### Fluid Layouts
```css
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 16px;
}

.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 16px;
}
```

### Responsive Images
```html
<picture>
  <source
    media="(max-width: 640px)"
    srcSet="image-small.jpg"
  />
  <source
    media="(max-width: 1024px)"
    srcSet="image-medium.jpg"
  />
  <img
    src="image-large.jpg"
    alt="Description"
    loading="lazy"
  />
</picture>
```

### Responsive Typography
```css
h1 {
  font-size: clamp(1.5rem, 5vw, 3rem);
  line-height: 1.2;
}

p {
  font-size: clamp(1rem, 2vw, 1.125rem);
  line-height: 1.6;
}
```

## 📋 Mobile-First Design

### Progressive Enhancement
```css
/* Base styles (mobile) */
.button {
  padding: 12px 24px;
  font-size: 16px;
}

/* Tablet enhancements */
@media (min-width: 641px) {
  .button {
    padding: 14px 28px;
    font-size: 18px;
  }
}

/* Desktop enhancements */
@media (min-width: 1025px) {
  .button {
    padding: 16px 32px;
    font-size: 20px;
  }
}
```

### Mobile-First Layout
```html
<!-- Stack layout on mobile, side-by-side on desktop -->
<div class="container">
  <div class="content">
    <!-- Content -->
  </div>
  <div class="sidebar">
    <!-- Sidebar -->
  </div>
</div>

<style>
.container {
  display: flex;
  flex-direction: column;
}

@media (min-width: 1025px) {
  .container {
    flex-direction: row;
  }
}
</style>
```

## 📋 Performance

### Fast Loading
```typescript
// Lazy load components
const LazyComponent = React.lazy(() => import('./LazyComponent'));

// Lazy load images
<img src="placeholder.jpg" data-src="actual.jpg" loading="lazy" alt="Description" />
```

### Smooth Animations
```css
/* Use transforms แทน layout changes */
.animated {
  transform: translateX(0);
  transition: transform 0.3s ease;
}

.animated:hover {
  transform: translateX(10px);
}

/* Avoid animating layout properties */
.bad {
  margin-left: 0; /* Don't animate this */
  transition: margin-left 0.3s ease;
}
```

### 60 FPS
```typescript
// Use requestAnimationFrame สำหรับ animations
function animate() {
  // Animation logic
  requestAnimationFrame(animate);
}

requestAnimationFrame(animate);
```

## 📋 Mobile-Specific Patterns

### Bottom Navigation
```html
<nav class="bottom-navigation">
  <a href="/home" class="nav-item active">
    <span class="icon">🏠</span>
    <span class="label">Home</span>
  </a>
  <a href="/search" class="nav-item">
    <span class="icon">🔍</span>
    <span class="label">Search</span>
  </a>
  <a href="/profile" class="nav-item">
    <span class="icon">👤</span>
    <span class="label">Profile</span>
  </a>
</nav>
```

### Tab Bar
```html
<div class="tab-bar">
  <button class="tab active">Tab 1</button>
  <button class="tab">Tab 2</button>
  <button class="tab">Tab 3</button>
</div>
```

### Drawer/Sidebar
```html
<aside class="drawer">
  <button class="drawer-toggle">☰</button>
  <div class="drawer-content">
    <!-- Drawer content -->
  </div>
</aside>
```

### Swipeable Cards
```typescript
import { useSwipeable } from 'react-swipeable';

function SwipeableCard() {
  const handlers = useSwipeable({
    onSwipedLeft: () => deleteCard(),
  });

  return (
    <div {...handlers} className="card">
      Card content
    </div>
  );
}
```

## 📋 Best Practices

### DOs
- ✅ ใช้ touch targets ขนาดอย่างน้อย 44x44px
- ✅ ใช้ responsive design
- ✅ Optimize สำหรับ mobile performance
- ✅ ใช้ smooth animations
- ✅ รองรับ gestures
- ✅ ใช้ mobile-first approach

### DON'Ts
- ❌ ไม่ใช้ fixed widths
- ❌ ไม่ใช้ hover-only interactions
- ❌ ไม่ใช้ small touch targets
- ❌ ไม่ลืม safe area สำหรับ notches
- ❌ ไม่ใช้ heavy animations บน mobile
- ❌ ไม่ลืม viewport meta tag

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
```

---
*Mobile UX Patterns - Knowledge Package ของ Vega*
