# Performance Optimization

## 📋 Code Splitting

### Route-based Splitting
```typescript
import { lazy, Suspense } from 'react';

const Home = lazy(() => import('./pages/Home'));
const About = lazy(() => import('./pages/About'));
const Settings = lazy(() => import('./pages/Settings'));

function App() {
  return (
    <Suspense fallback={<Loading />}>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/settings" element={<Settings />} />
      </Routes>
    </Suspense>
  );
}
```

### Component-based Splitting
```typescript
const HeavyChart = lazy(() => import('./components/HeavyChart'));

function Dashboard() {
  return (
    <div>
      <Suspense fallback={<ChartSkeleton />}>
        <HeavyChart />
      </Suspense>
    </div>
  );
}
```

### Dynamic Imports
```typescript
const loadModule = async () => {
  const module = await import('./heavyModule');
  module.doSomething();
};
```

## 📋 Memoization

### React.memo
```typescript
const ExpensiveComponent = React.memo(({ prop }) => {
  // Component logic
});

// With custom comparison
const MemoizedComponent = React.memo(
  ({ prop }) => {
    // Component logic
  },
  (prevProps, nextProps) => {
    return prevProps.prop === nextProps.prop;
  }
);
```

### useMemo
```typescript
function ExpensiveCalculation({ a, b }) {
  const result = useMemo(() => {
    return computeExpensiveValue(a, b);
  }, [a, b]);

  return <div>{result}</div>;
}
```

### useCallback
```typescript
function ParentComponent({ items }) {
  const handleClick = useCallback((id) => {
    console.log('Clicked:', id);
  }, []);

  return items.map((item) => (
    <ChildComponent key={item.id} item={item} onClick={handleClick} />
  ));
}
```

## 📋 Virtualization

### react-window
```typescript
import { FixedSizeList } from 'react-window';

function VirtualizedList({ items }) {
  const Row = ({ index, style }) => (
    <div style={style}>{items[index]}</div>
  );

  return (
    <FixedSizeList
      height={500}
      itemCount={items.length}
      itemSize={35}
      width="100%"
    >
      {Row}
    </FixedSizeList>
  );
}
```

### react-virtualized
```typescript
import { List } from 'react-virtualized';

function VirtualizedList({ items }) {
  const rowRenderer = ({ index, key, style }) => (
    <div key={key} style={style}>
      {items[index]}
    </div>
  );

  return (
    <List
      width={600}
      height={300}
      rowCount={items.length}
      rowHeight={35}
      rowRenderer={rowRenderer}
    />
  );
}
```

## 📋 Debounce & Throttle

### Debounce
```typescript
import { useDebounce } from '@/hooks/useDebounce';

function SearchComponent() {
  const [query, setQuery] = useState('');
  const debouncedQuery = useDebounce(query, 500);

  useEffect(() => {
    if (debouncedQuery) {
      search(debouncedQuery);
    }
  }, [debouncedQuery]);

  return <input value={query} onChange={(e) => setQuery(e.target.value)} />;
}
```

### Throttle
```typescript
import { useThrottle } from '@/hooks/useThrottle';

function ScrollComponent() {
  const handleScroll = useThrottle(() => {
    // Handle scroll
  }, 100);

  return <div onScroll={handleScroll}>...</div>;
}
```

## 📋 Bundle Optimization

### Tree Shaking
```typescript
// Import specific functions ไม่ใช้ทั้ง module
import { debounce } from 'lodash-es';
// ไม่ใช้
import _ from 'lodash';
```

### Bundle Analysis
```typescript
// vite.config.ts
import { defineConfig } from 'vite';
import { visualizer } from 'rollup-plugin-visualizer';

export default defineConfig({
  plugins: [
    visualizer({ open: true }),
  ],
});
```

### Code Splitting in Vite
```typescript
// vite.config.ts
export default defineConfig({
  build: {
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
          ui: ['@radix-ui/react-dialog', '@radix-ui/react-dropdown-menu'],
        },
      },
    },
  },
});
```

## 📋 Image Optimization

### Modern Formats
```typescript
// Use WebP, AVIF ถ้า supported
<picture>
  <source srcSet="image.avif" type="image/avif" />
  <source srcSet="image.webp" type="image/webp" />
  <img src="image.jpg" alt="Description" loading="lazy" />
</picture>
```

### Lazy Loading Images
```typescript
<img src="placeholder.jpg" data-src="actual.jpg" loading="lazy" alt="Description" />
```

### Responsive Images
```typescript
<img
  srcSet="small.jpg 640w, medium.jpg 1024w, large.jpg 1280w"
  sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
  src="medium.jpg"
  alt="Description"
/>
```

## 📋 Performance Monitoring

### React Profiler
```typescript
import { Profiler } from 'react';

function onRenderCallback(
  id,
  phase,
  actualDuration,
  baseDuration,
  startTime,
  commitTime
) {
  console.log(`${id} ${phase} took ${actualDuration}ms`);
}

<Profiler id="App" onRender={onRenderCallback}>
  <App />
</Profiler>
```

### Web Vitals
```typescript
import { getCLS, getFID, getFCP, getLCP, getTTFB } from 'web-vitals';

getCLS(console.log);
getFID(console.log);
getFCP(console.log);
getLCP(console.log);
getTTFB(console.log);
```

## 📋 Performance Best Practices

### DOs
- ✅ ใช้ code splitting สำหรับ large components
- ✅ ใช้ memoization สำหรับ expensive operations
- ✅ ใช้ virtualization สำหรับ long lists
- ✅ ใช้ debounce/throttle สำหรับ frequent events
- ✅ Optimize images (modern formats, lazy loading)
- ✅ Monitor performance อย่างสม่ำเสมอ

### DON'Ts
- ❌ ไม่ใช้ inline functions ใน render props
- ❌ ไม่ render large lists โดยไม่ virtualize
- ❌ ไม่ load ทุกอย่างทันที
- ❌ ไม่ใช้ large bundle sizes
- ❌ ไม่ ignore performance metrics

---
*Performance Optimization - Knowledge Package ของ Stella*
