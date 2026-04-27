---
description: Comprehensive frontend development guidelines สำหรับ React, Vite, LIFF, TypeScript, state management, performance optimization, architecture patterns, และ advanced React patterns
---

# Stella Skill - Comprehensive Frontend Development

## 🎯 Purpose

Comprehensive frontend development guidelines สำหรับ React, Vite, LIFF, TypeScript, state management, performance optimization, architecture patterns, และ advanced React patterns

## 📋 Core Competencies

### 1. React Development
- **Component Design:** Single Responsibility, Composition over Inheritance, Pure components
- **Hooks:** Rules of Hooks, Custom hooks, useEffect dependencies, Cleanup
- **State Management:** Lift state up, Context API, Zustand patterns, TanStack Query
- **Performance:** Code splitting, Memoization, Virtualization, Debounce/Throttle

### 2. TypeScript
- **Types:** Avoid any, Interface vs Type, Generics, Type inference
- **Advanced Patterns:** Utility Types, Conditional Types, Generic Components
- **Configuration:** Strict mode, noImplicitAny, esModuleInterop

### 3. LIFF Integration
- **LIFF v2:** LIFF.init(), LIFF.getProfile(), LIFF.login()
- **LINE Login:** OAuth flow, token management
- **LINE APIs:** Messaging API, User profile, Group info
- **Constraints:** Screen size, Platform differences, Permissions

### 4. State Management
- **Zustand:** Store design, Actions, Selectors, Middleware
- **Context API:** Provider pattern, useContext, Context splitting
- **TanStack Query:** Query keys, Mutations, Caching, Refetching
- **Local State:** useState, useReducer, useRef

### 5. Performance Optimization
- **Code Splitting:** React.lazy, Suspense, Dynamic imports
- **Memoization:** React.memo, useMemo, useCallback
- **Virtualization:** react-window, react-virtualized
- **Bundle Analysis:** Bundle size, Tree shaking, Compression

## 🎯 Advanced React Patterns

### HOC (Higher-Order Components)
```typescript
function withAuth(WrappedComponent) {
  return function(props) {
    const { isAuthenticated } = useAuth();
    if (!isAuthenticated) return <Login />;
    return <WrappedComponent {...props} />;
  };
}
```

### Render Props
```typescript
function MouseTracker({ children }) {
  const [position, setPosition] = useState({ x: 0, y: 0 });
  return children(position);
}

// Usage
<MouseTracker>
  {({ x, y }) => <div>Mouse: {x}, {y}</div>}
</MouseTracker>
```

### Custom Hooks
```typescript
function useLocalStorage(key, initialValue) {
  const [storedValue, setStoredValue] = useState(() => {
    const item = window.localStorage.getItem(key);
    return item ? JSON.parse(item) : initialValue;
  });

  const setValue = (value) => {
    setStoredValue(value);
    window.localStorage.setItem(key, JSON.stringify(value));
  };

  return [storedValue, setValue];
}
```

### Compound Components
```typescript
const Card = ({ children }) => <div className="card">{children}</div>;
Card.Header = ({ children }) => <div className="header">{children}</div>;
Card.Body = ({ children }) => <div className="body">{children}</div>;
Card.Footer = ({ children }) => <div className="footer">{children}</div>;

// Usage
<Card>
  <Card.Header>Title</Card.Header>
  <Card.Body>Content</Card.Body>
  <Card.Footer>Footer</Card.Footer>
</Card>
```

## 🎯 Architecture Patterns

### Folder Structure
```
src/
├── components/              # Shared components
│   ├── ui/                  # Base UI components
│   │   ├── Button/
│   │   ├── Input/
│   │   └── Modal/
│   └── layout/              # Layout components
│       ├── Header/
│       └── Footer/
├── pages/                   # Page-specific components
│   ├── Home/
│   │   ├── index.tsx
│   │   ├── components/      # Page-specific components
│   │   └── hooks/           # Page-specific hooks
│   └── UserProfile/
├── hooks/                   # Shared custom hooks
├── lib/                     # Utilities
├── contexts/                # Context providers
├── types/                   # TypeScript types
├── constants/               # Constants
└── App.tsx
```

### Component Patterns
- **Container/Presentational:** Logic vs View separation
- **Smart/Dumb Components:** State management vs Pure UI
- **Compound Components:** Parent-child component composition
- **Control Props:** Parent controls child state
- **State Reducer:** Complex state management with useReducer

## 🎯 State Management Patterns

### Zustand Patterns
```typescript
// Simple store
const useStore = create((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 })),
}));

// With actions
const useStore = create((set) => ({
  user: null,
  setUser: (user) => set({ user }),
  clearUser: () => set({ user: null }),
}));

// With selectors
const useStore = create((set) => ({
  items: [],
  addItem: (item) => set((state) => ({ items: [...state.items, item] })),
}));

// Usage with selector
const items = useStore((state) => state.items);
```

### Context Patterns
```typescript
// Context with reducer
const AuthContext = createContext();

function AuthProvider({ children }) {
  const [state, dispatch] = useReducer(authReducer, initialState);
  return (
    <AuthContext.Provider value={{ state, dispatch }}>
      {children}
    </AuthContext.Provider>
  );
}

// Context splitting (avoid large context)
const UserContext = createContext();
const ThemeContext = createContext();
```

### TanStack Query Patterns
```typescript
// Query with caching
const { data, isLoading, error } = useQuery({
  queryKey: ['user', userId],
  queryFn: () => fetchUser(userId),
  staleTime: 5 * 60 * 1000, // 5 minutes
});

// Mutation with invalidation
const mutation = useMutation({
  mutationFn: updateUser,
  onSuccess: () => {
    queryClient.invalidateQueries({ queryKey: ['users'] });
  },
});

// Dependent queries
const { data: user } = useQuery({
  queryKey: ['user', userId],
  queryFn: fetchUser,
  enabled: !!userId,
});
```

## 🎯 Performance Optimization Techniques

### Code Splitting
```typescript
// Lazy loading
const LazyComponent = React.lazy(() => import('./LazyComponent'));

// Route-based splitting
const Home = React.lazy(() => import('./pages/Home'));
const About = React.lazy(() => import('./pages/About'));

// Component-based splitting
const HeavyComponent = React.lazy(() => import('./HeavyComponent'));
```

### Memoization
```typescript
// React.memo
const ExpensiveComponent = React.memo(({ prop }) => {
  // Component logic
});

// useMemo
const expensiveValue = useMemo(() => {
  return computeExpensiveValue(a, b);
}, [a, b]);

// useCallback
const handleClick = useCallback(() => {
  doSomething(a, b);
}, [a, b]);
```

### Virtualization
```typescript
import { FixedSizeList } from 'react-window';

function VirtualizedList({ items }) {
  return (
    <FixedSizeList
      height={500}
      itemCount={items.length}
      itemSize={35}
      width="100%"
    >
      {({ index, style }) => (
        <div style={style}>{items[index]}</div>
      )}
    </FixedSizeList>
  );
}
```

## 🎯 TypeScript Advanced Patterns

### Utility Types
```typescript
// Partial - make all properties optional
type PartialUser = Partial<User>;

// Required - make all properties required
type RequiredUser = Required<Partial<User>>;

// Pick - pick specific properties
type UserSummary = Pick<User, 'id' | 'name'>;

// Omit - omit specific properties
type CreateUserInput = Omit<User, 'id' | 'createdAt'>;

// Record - create object type with specific keys
type UserMap = Record<string, User>;

// ReturnType - get return type of function
type UserCreator = () => User;
type User = ReturnType<UserCreator>;
```

### Conditional Types
```typescript
type NonNullable<T> = T extends null | undefined ? never : T;

type Extract<T, U> = T extends U ? T : never;
type Exclude<T, U> = T extends U ? never : T;

type ApiResponse<T> = T extends string
  ? { data: string }
  : T extends number
  ? { data: number }
  : { data: unknown };
```

### Generic Components
```typescript
interface Props<T> {
  items: T[];
  renderItem: (item: T) => React.ReactNode;
  keyExtractor: (item: T) => string;
}

function List<T>({ items, renderItem, keyExtractor }: Props<T>) {
  return (
    <ul>
      {items.map((item) => (
        <li key={keyExtractor(item)}>{renderItem(item)}</li>
      ))}
    </ul>
  );
}

// Usage
interface User {
  id: string;
  name: string;
}

<List<User>
  items={users}
  renderItem={(user) => <span>{user.name}</span>}
  keyExtractor={(user) => user.id}
/>
```

## 🎯 Naming Conventions

ตาม `references/naming-conventions.md`:
- Component: PascalCase.tsx (Button.tsx, UserCard.tsx)
- Hook: useXxx.ts (useAuth.ts, useDebounce.ts)
- Context: PascalContext.tsx (AuthContext.tsx)
- Utility: kebab-case.ts (format-date.ts)
- Types: kebab-case.ts หรือ xxx.types.ts (user.types.ts)
- Constants: kebab-case.ts (api-routes.ts)
- Style: PascalCase.module.css (Button.module.css)
- Test: xxx.test.tsx (Button.test.tsx)

## 🎯 Best Practices

### Code Quality
- **Single Responsibility:** แต่ละ component ทำอย่างเดียวให้ดี
- **DRY:** Don't Repeat Yourself
- **Consistency:** ใช้ naming conventions เดียวกันทั้ง project
- **Documentation:** เขียน comments และ documentation สำหรับ complex logic

### Performance
- **Avoid unnecessary re-renders:** ใช้ React.memo, useMemo, useCallback
- **Code splitting:** Lazy load components ที่ไม่จำเป็นต้องโหลดทันที
- **Bundle size:** Monitor และ optimize bundle size
- **Image optimization:** ใช้ modern formats (WebP, AVIF)

### Accessibility
- **Semantic HTML:** ใช้ tags ที่ถูกต้อง
- **ARIA labels:** เพิ่ม aria-label, aria-describedBy เมื่อจำเป็น
- **Keyboard navigation:** รองรับ keyboard ทุก functionality
- **Focus management:** จัดการ focus อย่างถูกต้อง

### Security
- **XSS prevention:** ใช้ frameworks' built-in escaping
- **Input validation:** validate inputs ก่อนส่งไป API
- **Environment variables:** ไม่ hardcode secrets
- **API security:** ใช้ HTTPS, validate responses

## 🔧 Tools to Use

- **Grep** - ค้นหา patterns ใน code
- **Read** - อ่านไฟล์ source code
- **Find** - ค้นหาไฟล์ตาม pattern
- **Edit/Multi-edit** - แก้ไข code (ถ้าได้รับอนุญาต)

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- พัฒนา React components
- ทำ LIFF integration
- จัดการ state management
- Optimize performance
- ทำ code review
- ออกแบบ architecture
- ใช้ TypeScript advanced patterns

## 📝 Notes

- ใช้ Tailwind CSS และ shadcn/ui สำหรับ UI
- ใช้ Vite สำหรับ build tool
- ใช้ Zustand สำหรับ state management
- ใช้ TanStack Query สำหรับ server state
- ใช้ naming conventions ตาม references/naming-conventions.md
- ใช้ best practices ตาม references/best-practices.md

---
*Stella Skill - Comprehensive Frontend Development*
