# Animation and Micro-interactions

## 📋 Animation Principles

### 12 Principles of Animation
1. **Squash and Stretch** - การบีบและยืด
2. **Anticipation** - การเตรียมตัวก่อนเคลื่อนไหว
3. **Staging** - การจัดฉาก
4. **Straight Ahead Action** - การเคลื่อนไหวแบบต่อเนื่อง
5. **Follow Through** - การตามไปจนจบ
6. **Overlapping Action** - การเคลื่อนไหวแบบซ้อนทับ
7. **Slow In and Out** - การช้าเข้าและช้าออก
8. **Arc** - การเคลื่อนไหวแบบโค้ง
9. **Exaggeration** - การเกินจริง
10. **Secondary Action** - การเคลื่อนไหวรอง
11. **Timing** - การจัดเวลา
12. **Solid Drawing** - การวาดที่แข็งแรง

## 📋 CSS Animations

### Keyframe Animations
```css
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes slideIn {
  from {
    transform: translateX(-100%);
  }
  to {
    transform: translateX(0);
  }
}

@keyframes scaleIn {
  from {
    transform: scale(0);
  }
  to {
    transform: scale(1);
  }
}
```

### Animation Properties
```css
.animated-element {
  animation-name: fadeIn;
  animation-duration: 300ms;
  animation-timing-function: ease-in-out;
  animation-delay: 0ms;
  animation-iteration-count: 1;
  animation-direction: normal;
  animation-fill-mode: forwards;
  animation-play-state: running;
}
```

### Animation Shorthand
```css
.animated-element {
  animation: fadeIn 300ms ease-in-out 0ms 1 normal forwards running;
}
```

## 📋 Micro-interactions

### Button Hover
```css
.button {
  transition: all 0.2s ease-in-out;
}

.button:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.button:active {
  transform: translateY(0);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
```

### Input Focus
```css
.input {
  transition: border-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
}

.input:focus {
  border-color: var(--color-primary-500);
  box-shadow: 0 0 0 3px rgba(14, 165, 233, 0.1);
}
```

### Card Hover
```css
.card {
  transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}
```

## 📋 React Animations

### Framer Motion
```typescript
import { motion } from 'framer-motion';

function AnimatedComponent() {
  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      exit={{ opacity: 0, y: -20 }}
      transition={{ duration: 0.3 }}
    >
      Content
    </motion.div>
  );
}
```

### React Spring
```typescript
import { useSpring, animated } from '@react-spring/web';

function AnimatedComponent() {
  const props = useSpring({
    from: { opacity: 0, transform: 'translateY(20px)' },
    to: { opacity: 1, transform: 'translateY(0)' },
  });

  return (
    <animated.div style={props}>
      Content
    </animated.div>
  );
}
```

### Auto-animate
```typescript
import { useAutoAnimate } from '@formkit/auto-animate/react';

function AnimatedList({ items }: { items: string[] }) {
  const [parent] = useAutoAnimate();

  return (
    <ul ref={parent}>
      {items.map((item) => (
        <li key={item}>{item}</li>
      ))}
    </ul>
  );
}
```

## 📋 Page Transitions

### Page Transition with Framer Motion
```typescript
import { AnimatePresence, motion } from 'framer-motion';
import { useRouter } from 'next/router';

function PageTransition({ children }: { children: React.ReactNode }) {
  const router = useRouter();

  return (
    <AnimatePresence mode="wait">
      <motion.div
        key={router.asPath}
        initial={{ opacity: 0, x: -20 }}
        animate={{ opacity: 1, x: 0 }}
        exit={{ opacity: 0, x: 20 }}
        transition={{ duration: 0.3 }}
      >
        {children}
      </motion.div>
    </AnimatePresence>
  );
}
```

### Page Transition with React Transition Group
```typescript
import { CSSTransition, TransitionGroup } from 'react-transition-group';

function PageTransition({ children }: { children: React.ReactNode }) {
  return (
    <TransitionGroup>
      <CSSTransition
        timeout={300}
        classNames="page"
        unmountOnExit
      >
        {children}
      </CSSTransition>
    </TransitionGroup>
  );
}
```

## 📋 Loading Animations

### Spinner
```css
@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

.spinner {
  border: 2px solid var(--color-neutral-200);
  border-top-color: var(--color-primary-500);
  border-radius: 50%;
  width: 24px;
  height: 24px;
  animation: spin 1s linear infinite;
}
```

### Skeleton Loading
```css
@keyframes shimmer {
  0% {
    background-position: -1000px 0;
  }
  100% {
    background-position: 1000px 0;
  }
}

.skeleton {
  background: linear-gradient(
    90deg,
    var(--color-neutral-200) 0%,
    var(--color-neutral-100) 50%,
    var(--color-neutral-200) 100%
  );
  background-size: 1000px 100%;
  animation: shimmer 2s infinite;
}
```

### Pulse Loading
```css
@keyframes pulse {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.5;
  }
}

.pulse {
  animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
}
```

## 📋 Gesture Animations

### Swipe to Dismiss
```typescript
import { useSwipeable } from 'react-swipeable';

function SwipeableCard({ onDismiss }: { onDismiss: () => void }) {
  const handlers = useSwipeable({
    onSwipedLeft: onDismiss,
    onSwipedRight: onDismiss,
  });

  return <div {...handlers}>Card content</div>;
}
```

### Pull to Refresh
```typescript
import { usePullToRefresh } from '@use-gesture/react';

function PullToRefresh({ onRefresh }: { onRefresh: () => void }) {
  const bind = usePullToRefresh(({ state: { down, movement } }) => {
    if (down && movement > 100) {
      onRefresh();
    }
  });

  return <div {...bind()}>Content</div>;
}
```

## 📋 Performance Optimization

### Use Transforms Instead of Layout Changes
```css
/* Good - uses transforms */
.animated {
  transform: translateX(0);
  transition: transform 0.3s ease;
}

/* Bad - uses layout changes */
.animated {
  left: 0;
  transition: left 0.3s ease;
}
```

### Use will-change
```css
.animated {
  will-change: transform, opacity;
}
```

### Use GPU Acceleration
```css
.animated {
  transform: translateZ(0);
  will-change: transform;
}
```

## 📋 Accessibility

### Respect Reduced Motion
```css
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

### Provide Skip Animation Button
```typescript
function SkipAnimation() {
  const [skip, setSkip] = useState(false);

  useEffect(() => {
    if (skip) {
      // Skip animations
    }
  }, [skip]);

  return (
    <button onClick={() => setSkip(true)}>
      Skip Animation
    </button>
  );
}
```

## 📋 Best Practices

### DOs
- ✅ ใช้ smooth animations
- ✅ ใช้ appropriate timing
- ✅ ใช้ appropriate easing
- ✅ ใช้ transforms แทน layout changes
- ✅ ใช้ GPU acceleration
- ✅ ใช้ reduced motion
- ✅ ใช้ performant animations
- ✅ ใช้ consistent animations
- ✅ ใช้ purposeful animations
- ✅ ใช้ accessible animations

### DON'Ts
- ❌ ไม่ใช้ jarring animations
- ❌ ไม่ใช้ too long animations
- ❌ ไม่ใช้ too fast animations
- ❌ ไม่ใช้ layout changes สำหรับ animations
- ❌ ไม่ใช้ non-GPU accelerated animations
- ❌ ไม่ใช้ animations ที่ไม่ respect reduced motion
- ❌ ไม่ใช้ animations ที่ cause performance issues
- ❌ ไม่ใช้ animations ที่ inconsistent
- ❌ ไม่ใช้ animations ที่ not purposeful
- ❌ ไม่ใช้ animations ที่ not accessible

---
*Animation and Micro-interactions - Reference ของ Vega*
