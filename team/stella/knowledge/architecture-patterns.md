# Frontend Architecture Patterns

## 📋 Folder Structure

```
src/
├── components/              # Shared components
│   ├── ui/                  # Base UI components (Button, Input, Modal)
│   │   ├── Button/
│   │   │   ├── Button.tsx
│   │   │   ├── Button.test.tsx
│   │   │   └── Button.module.css
│   │   └── Input/
│   └── layout/              # Layout components (Header, Footer, Sidebar)
│       ├── Header/
│       └── Footer/
├── pages/                   # Page-specific components
│   ├── Home/
│   │   ├── index.tsx
│   │   ├── Home.module.css
│   │   ├── components/      # Page-specific components
│   │   │   ├── HeroSection.tsx
│   │   │   └── FeatureCard.tsx
│   │   └── hooks/           # Page-specific hooks
│   │       └── useHomeData.ts
│   └── UserProfile/
│       ├── index.tsx
│       └── components/
├── hooks/                   # Shared custom hooks
│   ├── useAuth.ts
│   ├── useDebounce.ts
│   └── useLocalStorage.ts
├── lib/                     # Utilities
│   ├── format-date.ts
│   ├── api-client.ts
│   └── validators.ts
├── contexts/                # Context providers
│   ├── AuthContext.tsx
│   └── ThemeContext.tsx
├── types/                   # TypeScript types
│   ├── user.types.ts
│   ├── api.types.ts
│   └── common.types.ts
├── constants/               # Constants
│   ├── api-routes.ts
│   └── config.ts
├── styles/                  # Global styles
│   ├── globals.css
│   └── variables.css
├── App.tsx
└── main.tsx
```

## 📋 Component Patterns

### Container/Presentational Pattern
```typescript
// Presentational Component (Dumb)
interface UserCardProps {
  user: User;
  onEdit: (user: User) => void;
}

export function UserCard({ user, onEdit }: UserCardProps) {
  return (
    <div className="user-card">
      <h2>{user.name}</h2>
      <p>{user.email}</p>
      <button onClick={() => onEdit(user)}>Edit</button>
    </div>
  );
}

// Container Component (Smart)
export function UserCardContainer() {
  const { user } = useUser();
  const { updateUser } = useUserActions();

  const handleEdit = (updatedUser: User) => {
    updateUser(updatedUser);
  };

  return <UserCard user={user} onEdit={handleEdit} />;
}
```

### Compound Components Pattern
```typescript
const Card = ({ children, className }: { children: React.ReactNode; className?: string }) => (
  <div className={`card ${className}`}>{children}</div>
);

Card.Header = ({ children }: { children: React.ReactNode }) => (
  <div className="card-header">{children}</div>
);

Card.Body = ({ children }: { children: React.ReactNode }) => (
  <div className="card-body">{children}</div>
);

Card.Footer = ({ children }: { children: React.ReactNode }) => (
  <div className="card-footer">{children}</div>
);

// Usage
<Card>
  <Card.Header>Title</Card.Header>
  <Card.Body>Content</Card.Body>
  <Card.Footer>Footer</Card.Footer>
</Card>
```

### Render Props Pattern
```typescript
interface MouseTrackerProps {
  children: (position: { x: number; y: number }) => React.ReactNode;
}

export function MouseTracker({ children }: MouseTrackerProps) {
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

// Usage
<MouseTracker>
  {({ x, y }) => <div>Mouse: {x}, {y}</div>}
</MouseTracker>
```

## 📋 State Management Patterns

### Zustand Pattern
```typescript
// Store definition
interface UserStore {
  user: User | null;
  setUser: (user: User) => void;
  clearUser: () => void;
}

const useUserStore = create<UserStore>((set) => ({
  user: null,
  setUser: (user) => set({ user }),
  clearUser: () => set({ user: null }),
}));

// Usage
function UserProfile() {
  const { user, setUser } = useUserStore();
  // ...
}
```

### Context Pattern
```typescript
// Context definition
interface AuthContextValue {
  isAuthenticated: boolean;
  login: (credentials: Credentials) => Promise<void>;
  logout: () => void;
}

const AuthContext = createContext<AuthContextValue | null>(null);

// Provider
export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  const login = async (credentials: Credentials) => {
    // ...
  };

  const logout = () => {
    setIsAuthenticated(false);
  };

  return (
    <AuthContext.Provider value={{ isAuthenticated, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
}

// Hook
export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider');
  }
  return context;
}
```

## 📋 Data Fetching Patterns

### TanStack Query Pattern
```typescript
// Query
const { data, isLoading, error } = useQuery({
  queryKey: ['user', userId],
  queryFn: () => fetchUser(userId),
  staleTime: 5 * 60 * 1000, // 5 minutes
});

// Mutation
const mutation = useMutation({
  mutationFn: updateUser,
  onSuccess: () => {
    queryClient.invalidateQueries({ queryKey: ['users'] });
  },
});
```

### SWR Pattern (ถ้าใช้ SWR)
```typescript
const { data, error, isLoading } = useSWR(`/api/users/${userId}`, fetchUser);
```

## 📋 Routing Patterns

### React Router Pattern
```typescript
// Route definition
const router = createBrowserRouter([
  {
    path: '/',
    element: <Layout />,
    children: [
      { index: true, element: <Home /> },
      { path: 'profile', element: <UserProfile /> },
      { path: 'settings', element: <Settings /> },
    ],
  },
]);

// Route with params
<Route path="users/:userId" element={<UserDetail />} />

// Access params
const { userId } = useParams<{ userId: string }>();
```

## 📋 Performance Patterns

### Code Splitting Pattern
```typescript
// Route-based splitting
const Home = React.lazy(() => import('./pages/Home'));
const About = React.lazy(() => import('./pages/About'));

// Component-based splitting
const HeavyComponent = React.lazy(() => import('./HeavyComponent'));

// Usage
<Suspense fallback={<Loading />}>
  <HeavyComponent />
</Suspense>
```

### Memoization Pattern
```typescript
// React.memo
const ExpensiveComponent = React.memo(({ prop }) => {
  // ...
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

---
*Architecture Patterns - Knowledge Package ของ Stella*
