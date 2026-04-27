# State Management Patterns

## 📋 Zustand Patterns

### Basic Store
```typescript
import { create } from 'zustand';

interface CounterStore {
  count: number;
  increment: () => void;
  decrement: () => void;
}

const useCounterStore = create<CounterStore>((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 })),
  decrement: () => set((state) => ({ count: state.count - 1 })),
}));
```

### Store with Actions
```typescript
interface UserStore {
  user: User | null;
  setUser: (user: User) => void;
  clearUser: () => void;
  updateUser: (updates: Partial<User>) => void;
}

const useUserStore = create<UserStore>((set) => ({
  user: null,
  setUser: (user) => set({ user }),
  clearUser: () => set({ user: null }),
  updateUser: (updates) => set((state) => ({ 
    user: state.user ? { ...state.user, ...updates } : null 
  })),
}));
```

### Store with Selectors
```typescript
interface TodoStore {
  todos: Todo[];
  addTodo: (todo: Todo) => void;
  removeTodo: (id: string) => void;
}

const useTodoStore = create<TodoStore>((set) => ({
  todos: [],
  addTodo: (todo) => set((state) => ({ todos: [...state.todos, todo] })),
  removeTodo: (id) => set((state) => ({ 
    todos: state.todos.filter((todo) => todo.id !== id) 
  })),
}));

// Usage with selector
const todos = useTodoStore((state) => state.todos);
const completedTodos = useTodoStore((state) => 
  state.todos.filter((todo) => todo.completed)
);
```

### Store with Middleware
```typescript
import { devtools, persist } from 'zustand/middleware';

const useStore = create(
  devtools(
    persist(
      (set) => ({
        // ...
      }),
      { name: 'app-storage' }
    )
  )
);
```

## 📋 Context Patterns

### Basic Context
```typescript
import { createContext, useContext, useState, ReactNode } from 'react';

interface AuthContextValue {
  isAuthenticated: boolean;
  login: (credentials: Credentials) => Promise<void>;
  logout: () => void;
}

const AuthContext = createContext<AuthContextValue | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  const login = async (credentials: Credentials) => {
    // Login logic
    setIsAuthenticated(true);
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

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider');
  }
  return context;
}
```

### Context with Reducer
```typescript
import { createContext, useContext, useReducer, ReactNode } from 'react';

type Action = 
  | { type: 'SET_USER'; payload: User }
  | { type: 'CLEAR_USER' };

interface AuthState {
  user: User | null;
  isAuthenticated: boolean;
}

function authReducer(state: AuthState, action: Action): AuthState {
  switch (action.type) {
    case 'SET_USER':
      return { user: action.payload, isAuthenticated: true };
    case 'CLEAR_USER':
      return { user: null, isAuthenticated: false };
    default:
      return state;
  }
}

const AuthContext = createContext<{
  state: AuthState;
  dispatch: React.Dispatch<Action>;
} | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [state, dispatch] = useReducer(authReducer, {
    user: null,
    isAuthenticated: false,
  });

  return (
    <AuthContext.Provider value={{ state, dispatch }}>
      {children}
    </AuthContext.Provider>
  );
}
```

### Context Splitting
```typescript
// Split large context into smaller contexts
const UserContext = createContext<User | null>(null);
const ThemeContext = createContext<Theme>('light');
const AuthContext = createContext<boolean>(false);

// Use separately
const user = useContext(UserContext);
const theme = useContext(ThemeContext);
const isAuthenticated = useContext(AuthContext);
```

## 📋 TanStack Query Patterns

### Basic Query
```typescript
import { useQuery } from '@tanstack/react-query';

const { data, isLoading, error } = useQuery({
  queryKey: ['user', userId],
  queryFn: () => fetchUser(userId),
  staleTime: 5 * 60 * 1000, // 5 minutes
});
```

### Query with Dependencies
```typescript
const { data } = useQuery({
  queryKey: ['user', userId],
  queryFn: () => fetchUser(userId),
  enabled: !!userId, // Only run when userId exists
});
```

### Query with Caching
```typescript
const { data } = useQuery({
  queryKey: ['users'],
  queryFn: fetchUsers,
  staleTime: 10 * 60 * 1000, // 10 minutes
  cacheTime: 30 * 60 * 1000, // 30 minutes
});
```

### Mutation
```typescript
import { useMutation, useQueryClient } from '@tanstack/react-query';

const queryClient = useQueryClient();

const mutation = useMutation({
  mutationFn: updateUser,
  onSuccess: () => {
    queryClient.invalidateQueries({ queryKey: ['users'] });
  },
});

// Usage
mutation.mutate(updatedUser);
```

### Mutation with Optimistic Updates
```typescript
const mutation = useMutation({
  mutationFn: updateUser,
  onMutate: async (newUser) => {
    await queryClient.cancelQueries({ queryKey: ['users'] });
    const previousUsers = queryClient.getQueryData(['users']);
    queryClient.setQueryData(['users'], (old: User[]) => 
      old.map((user) => (user.id === newUser.id ? newUser : user))
    );
    return { previousUsers };
  },
  onError: (err, newUser, context) => {
    queryClient.setQueryData(['users'], context.previousUsers);
  },
  onSettled: () => {
    queryClient.invalidateQueries({ queryKey: ['users'] });
  },
});
```

## 📋 Local State Patterns

### useState Pattern
```typescript
const [count, setCount] = useState(0);
const [user, setUser] = useState<User | null>(null);
```

### useReducer Pattern
```typescript
type Action = { type: 'INCREMENT' } | { type: 'DECREMENT' };

function reducer(state: number, action: Action): number {
  switch (action.type) {
    case 'INCREMENT':
      return state + 1;
    case 'DECREMENT':
      return state - 1;
    default:
      return state;
  }
}

const [count, dispatch] = useReducer(reducer, 0);
```

### useRef Pattern
```typescript
const inputRef = useRef<HTMLInputElement>(null);
const previousValue = useRef(value);

// Access DOM
inputRef.current?.focus();

// Store previous value
useEffect(() => {
  previousValue.current = value;
}, [value]);
```

## 📋 State Management Best Practices

### When to Use What
- **useState:** สำหรับ local state ที่ง่าย
- **useReducer:** สำหรับ complex state logic
- **useContext:** สำหรับ global state ที่ไม่ update บ่อย
- **Zustand:** สำหรับ global state ที่ update บ่อย
- **TanStack Query:** สำหรับ server state (API calls)

### Performance Tips
- **Avoid unnecessary re-renders:** ใช้ selectors ใน Zustand
- **Memoize expensive operations:** ใช้ useMemo
- **Split contexts:** ไม่ให้ context ใหญ่เกินไป
- **Use staleTime:** ใช้ staleTime ใน TanStack Query เพื่อ reduce API calls

---
*State Management Patterns - Knowledge Package ของ Stella*
