# Advanced React Patterns

## 📋 Suspense

### Suspense for Data Fetching
```typescript
import { Suspense } from 'react';

function UserProfile({ userId }: { userId: string }) {
  const data = use(fetchUser(userId));
  return <div>{data.name}</div>;
}

function App() {
  return (
    <Suspense fallback={<Loading />}>
      <UserProfile userId="1" />
    </Suspense>
  );
}
```

### Suspense for Code Splitting
```typescript
import { Suspense, lazy } from 'react';

const LazyComponent = lazy(() => import('./LazyComponent'));

function App() {
  return (
    <Suspense fallback={<Loading />}>
      <LazyComponent />
    </Suspense>
  );
}
```

### Suspense with Error Boundary
```typescript
function App() {
  return (
    <ErrorBoundary fallback={<ErrorFallback />}>
      <Suspense fallback={<Loading />}>
        <LazyComponent />
      </Suspense>
    </ErrorBoundary>
  );
}
```

## 📋 Concurrent Mode

### Concurrent Rendering
```typescript
import { startTransition } from 'react';

function App() {
  const [isPending, startTransition] = useTransition();
  const [query, setQuery] = useState('');

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    // Non-urgent update
    startTransition(() => {
      setQuery(e.target.value);
    });
  };

  return (
    <div>
      <input onChange={handleChange} />
      {isPending && <Spinner />}
      <Results query={query} />
    </div>
  );
}
```

### useDeferredValue
```typescript
import { useDeferredValue } from 'react';

function SearchResults({ query }: { query: string }) {
  const deferredQuery = useDeferredValue(query);
  const results = useSearch(deferredQuery);

  return <div>{results}</div>;
}
```

### useTransition
```typescript
import { useTransition } from 'react';

function Button() {
  const [isPending, startTransition] = useTransition();

  const handleClick = () => {
    startTransition(() => {
      // Non-urgent update
      updatePage();
    });
  };

  return (
    <button onClick={handleClick} disabled={isPending}>
      {isPending ? 'Loading...' : 'Click'}
    </button>
  );
}
```

## 📋 Server Components (React Server Components)

### Server Component
```typescript
// ServerComponent.tsx
async function ServerComponent({ userId }: { userId: string }) {
  const user = await fetchUser(userId);
  return <div>{user.name}</div>;
}
```

### Client Component
```typescript
'use client';

// ClientComponent.tsx
import { useState } from 'react';

function ClientComponent() {
  const [count, setCount] = useState(0);
  return <button onClick={() => setCount(count + 1)}>{count}</button>;
}
```

### Mixing Server and Client Components
```typescript
import ClientComponent from './ClientComponent';

async function ServerComponent() {
  const data = await fetchData();
  return (
    <div>
      <h1>{data.title}</h1>
      <ClientComponent />
    </div>
  );
}
```

## 📋 Advanced Hooks

### useId
```typescript
import { useId } from 'react';

function Input({ label }: { label: string }) {
  const id = useId();
  return (
    <div>
      <label htmlFor={id}>{label}</label>
      <input id={id} />
    </div>
  );
}
```

### useSyncExternalStore
```typescript
import { useSyncExternalStore } from 'react';

function useOnlineStatus() {
  return useSyncExternalStore(
    (callback) => {
      window.addEventListener('online', callback);
      window.addEventListener('offline', callback);
      return () => {
        window.removeEventListener('online', callback);
        window.removeEventListener('offline', callback);
      };
    },
    () => navigator.onLine,
    () => true // Server-side fallback
  );
}
```

### useInsertionEffect
```typescript
import { useInsertionEffect } from 'react';

function useCustomStyle(style: string) {
  useInsertionEffect(() => {
    const styleElement = document.createElement('style');
    styleElement.textContent = style;
    document.head.appendChild(styleElement);
    return () => {
      document.head.removeChild(styleElement);
    };
  }, [style]);
}
```

## 📋 Advanced Patterns

### Compound Components with Context
```typescript
const TabsContext = createContext<{
  activeTab: string;
  setActiveTab: (tab: string) => void;
} | null>(null);

function Tabs({ children }: { children: React.ReactNode }) {
  const [activeTab, setActiveTab] = useState('tab1');
  return (
    <TabsContext.Provider value={{ activeTab, setActiveTab }}>
      {children}
    </TabsContext.Provider>
  );
}

function TabList({ children }: { children: React.ReactNode }) {
  return <div role="tablist">{children}</div>;
}

function Tab({ value, children }: { value: string; children: React.ReactNode }) {
  const { activeTab, setActiveTab } = useContext(TabsContext)!;
  return (
    <button
      role="tab"
      aria-selected={activeTab === value}
      onClick={() => setActiveTab(value)}
    >
      {children}
    </button>
  );
}

function TabPanels({ children }: { children: React.ReactNode }) {
  return <div>{children}</div>;
}

function TabPanel({ value, children }: { value: string; children: React.ReactNode }) {
  const { activeTab } = useContext(TabsContext)!;
  if (activeTab !== value) return null;
  return <div role="tabpanel">{children}</div>;
}
```

### Render Props with Generics
```typescript
interface MouseTrackerProps<T> {
  children: (position: { x: number; y: number }) => React.ReactNode;
}

function MouseTracker<T>({ children }: MouseTrackerProps<T>) {
  const [position, setPosition] = useState({ x: 0, y: 0 });

  const handleMouseMove = (e: MouseEvent) => {
    setPosition({ x: e.clientX, y: e.clientY });
  };

  useEffect(() => {
    window.addEventListener('mousemove', handleMouseMove);
    return () => window.removeEventListener('mousemove', handleMouseMove);
  }, []);

  return children(position);
}
```

### Custom Hook with Generics
```typescript
function useLocalStorage<T>(key: string, initialValue: T) {
  const [storedValue, setStoredValue] = useState<T>(() => {
    const item = window.localStorage.getItem(key);
    return item ? JSON.parse(item) : initialValue;
  });

  const setValue = (value: T | ((val: T) => T)) => {
    const valueToStore = value instanceof Function ? value(storedValue) : value;
    setStoredValue(valueToStore);
    window.localStorage.setItem(key, JSON.stringify(valueToStore));
  };

  return [storedValue, setValue] as const;
}
```

## 📋 Performance Patterns

### Virtual Scrolling
```typescript
import { FixedSizeList } from 'react-window';

function VirtualizedList({ items }: { items: string[] }) {
  const Row = ({ index, style }: { index: number; style: React.CSSProperties }) => (
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

### Lazy Evaluation
```typescript
function ExpensiveComponent({ data }: { data: Data }) {
  const result = useMemo(() => {
    return computeExpensiveValue(data);
  }, [data]);

  return <div>{result}</div>;
}
```

### Debounced Updates
```typescript
import { useDebouncedCallback } from 'use-debounce';

function SearchInput() {
  const debouncedSearch = useDebouncedCallback(
    (value: string) => search(value),
    500
  );

  return <input onChange={(e) => debouncedSearch(e.target.value)} />;
}
```

## 📋 Best Practices

### DOs
- ✅ ใช้ Suspense สำหรับ data fetching และ code splitting
- ✅ ใช้ Concurrent Mode สำหรับ non-urgent updates
- ✅ ใช้ Server Components สำหรับ data-heavy components
- ✅ ใช้ advanced hooks สำหรับ complex logic
- ✅ ใช้ compound components สำหรับ complex UI
- ✅ ใช้ virtual scrolling สำหรับ long lists
- ✅ ใช้ lazy evaluation สำหรับ expensive computations

### DON'Ts
- ❌ ไม่ใช้ Suspense สำหรับ critical data
- ❌ ไม่ใช้ Concurrent Mode สำหรับ urgent updates
- ❌ ไม่ใช้ Server Components สำหรับ interactive components
- ❌ ไม่ใช้ advanced hooks สำหรับ simple logic
- ❌ ไม่ใช้ compound components สำหรับ simple UI
- ❌ ไม่ใช้ virtual scrolling สำหรับ short lists
- ❌ ไม่ใช้ lazy evaluation สำหรับ simple computations

---
*Advanced React Patterns - Reference ของ Stella*
