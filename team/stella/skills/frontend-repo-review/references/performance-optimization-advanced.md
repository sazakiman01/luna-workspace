# Performance Optimization (Advanced)

## 📋 Bundle Analysis

### Webpack Bundle Analyzer
```javascript
// webpack.config.js
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

module.exports = {
  plugins: [
    new BundleAnalyzerPlugin({
      analyzerMode: 'static',
      openAnalyzer: false,
    }),
  ],
};
```

### Vite Bundle Analysis
```javascript
// vite.config.ts
import { visualizer } from 'rollup-plugin-visualizer';

export default {
  plugins: [
    visualizer({ open: true }),
  ],
};
```

### Bundle Size Optimization
```javascript
// Tree shaking
export { specificFunction }; // Export specific functions ไม่ใช้ export default

// Dynamic imports
const heavyModule = () => import('./heavyModule');

// Code splitting
const Route1 = lazy(() => import('./routes/Route1'));
const Route2 = lazy(() => import('./routes/Route2'));
```

## 📋 Runtime Performance

### Performance Monitoring
```typescript
import { useEffect } from 'react';

function PerformanceMonitor() {
  useEffect(() => {
    const observer = new PerformanceObserver((list) => {
      for (const entry of list.getEntries()) {
        console.log(entry);
      }
    });
    observer.observe({ entryTypes: ['measure', 'navigation'] });

    return () => observer.disconnect();
  }, []);

  return null;
}
```

### Performance API
```typescript
// Measure performance
performance.mark('start');
// ... code ...
performance.mark('end');
performance.measure('duration', 'start', 'end');

// Get metrics
const navigation = performance.getEntriesByType('navigation')[0];
const paint = performance.getEntriesByType('paint');
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

## 📋 Memory Profiling

### Memory Leaks Detection
```typescript
function App() {
  useEffect(() => {
    const interval = setInterval(() => {
      // ...
    }, 1000);

    return () => clearInterval(interval); // Cleanup
  }, []);
}
```

### Memory Monitoring
```typescript
function MemoryMonitor() {
  useEffect(() => {
    const checkMemory = () => {
      if (performance.memory) {
        const { usedJSHeapSize, totalJSHeapSize, jsHeapSizeLimit } = performance.memory;
        console.log(`Memory: ${usedJSHeapSize / 1024 / 1024} MB`);
      }
    };

    const interval = setInterval(checkMemory, 5000);
    return () => clearInterval(interval);
  }, []);

  return null;
}
```

### WeakMap for Caching
```typescript
const cache = new WeakMap<object, any>();

function memoize<T extends object, R>(fn: (obj: T) => R): (obj: T) => R {
  return (obj: T) => {
    if (cache.has(obj)) {
      return cache.get(obj);
    }
    const result = fn(obj);
    cache.set(obj, result);
    return result;
  };
}
```

## 📋 Advanced Optimization Techniques

### Intersection Observer for Lazy Loading
```typescript
import { useEffect, useRef, useState } from 'react';

function LazyImage({ src, alt }: { src: string; alt: string }) {
  const [isVisible, setIsVisible] = useState(false);
  const imgRef = useRef<HTMLImageElement>(null);

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsVisible(true);
          observer.disconnect();
        }
      },
      { threshold: 0.1 }
    );

    if (imgRef.current) {
      observer.observe(imgRef.current);
    }

    return () => observer.disconnect();
  }, []);

  return (
    <img
      ref={imgRef}
      src={isVisible ? src : undefined}
      alt={alt}
      loading="lazy"
    />
  );
}
```

### Request Animation Frame
```typescript
function useAnimationFrame(callback: () => void) {
  const requestRef = useRef<number>();
  const previousTimeRef = useRef<number>();

  const animate = (time: number) => {
    if (previousTimeRef.current !== undefined) {
      const deltaTime = time - previousTimeRef.current;
      callback();
    }
    previousTimeRef.current = time;
    requestRef.current = requestAnimationFrame(animate);
  };

  useEffect(() => {
    requestRef.current = requestAnimationFrame(animate);
    return () => cancelAnimationFrame(requestRef.current!);
  }, [callback]);
}
```

### Web Workers for Offloading
```typescript
// worker.ts
self.onmessage = (e) => {
  const result = heavyComputation(e.data);
  self.postMessage(result);
};

// component.tsx
function App() {
  const [result, setResult] = useState(null);

  useEffect(() => {
    const worker = new Worker(new URL('./worker.ts', import.meta.url));
    worker.postMessage(data);
    worker.onmessage = (e) => setResult(e.data);
    return () => worker.terminate();
  }, []);

  return <div>{result}</div>;
}
```

## 📋 Network Optimization

### Service Workers
```typescript
// sw.ts
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open('v1').then((cache) => {
      return cache.addAll(['/', '/styles.css', '/script.js']);
    })
  );
});

self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      return response || fetch(event.request);
    })
  );
});
```

### HTTP/2 and HTTP/3
```typescript
// Enable HTTP/2 in server configuration
// Use HTTP/2 push for critical resources
// Use HTTP/3 for better performance
```

### CDN and Edge Computing
```typescript
// Use CDN for static assets
// Use edge computing for dynamic content
// Cache at edge locations
```

## 📋 Rendering Optimization

### Server-Side Rendering (SSR)
```typescript
// Next.js SSR
export async function getServerSideProps() {
  const data = await fetchData();
  return { props: { data } };
}

function Page({ data }: { data: Data }) {
  return <div>{data}</div>;
}
```

### Static Site Generation (SSG)
```typescript
// Next.js SSG
export async function getStaticProps() {
  const data = await fetchData();
  return { props: { data } };
}

function Page({ data }: { data: Data }) {
  return <div>{data}</div>;
}
```

### Incremental Static Regeneration (ISR)
```typescript
// Next.js ISR
export async function getStaticProps() {
  const data = await fetchData();
  return {
    props: { data },
    revalidate: 60, // Regenerate every 60 seconds
  };
}
```

## 📋 Best Practices

### DOs
- ✅ ใช้ bundle analysis tools สำหรับ monitor bundle size
- ✅ ใช้ code splitting สำหรับ reduce initial load
- ✅ ใช้ lazy loading สำหรับ images และ components
- ✅ ใช้ performance API สำหรับ monitor runtime performance
- ✅ ใช้ Web Vitals สำหรับ measure user experience
- ✅ ใช้ Intersection Observer สำหรับ lazy loading
- ✅ ใช้ requestAnimationFrame สำหรับ animations
- ✅ ใช้ Web Workers สำหรับ offloading heavy computations
- ✅ ใช้ Service Workers สำหรับ caching
- ✅ ใช้ SSR/SSG/ISR สำหรับ optimize rendering

### DON'Ts
- ❌ ไม่ใช้ large bundle sizes
- ❌ ไม่ใช้ inline styles ที่ large
- ❌ ไม่ใช้ synchronous operations บน main thread
- ❌ ไม่ใช้ memory leaks
- ❌ ไม่ใช้ unnecessary re-renders
- ❌ ไม่ใช้ blocking operations
- ❌ ไม่ใช้ unoptimized images
- ❌ ไม่ใช้ unoptimized fonts
- ❌ ไม่ใช้ unoptimized third-party scripts
- ❌ ไม่ใช้ unoptimized API calls

---
*Performance Optimization (Advanced) - Reference ของ Stella*
