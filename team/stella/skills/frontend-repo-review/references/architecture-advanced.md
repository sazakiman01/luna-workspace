# Architecture (Advanced)

## 📋 Micro-frontends

### Module Federation
```javascript
// webpack.config.js
const ModuleFederationPlugin = require('@module-federation/webpack');

module.exports = {
  plugins: [
    new ModuleFederationPlugin({
      name: 'app1',
      filename: 'remoteEntry.js',
      exposes: {
        './Button': './src/Button',
      },
      shared: {
        react: { singleton: true },
        'react-dom': { singleton: true },
      },
    }),
  ],
};
```

### Single-SPA
```typescript
// root-config.ts
import { registerApplication, start } from 'single-spa';

registerApplication({
  name: 'app1',
  app: () => System.import('app1'),
  activeWhen: (location) => location.pathname.startsWith('/app1'),
});

start();
```

### Micro-frontends Best Practices
- Use shared dependencies (React, React DOM)
- Use consistent routing strategy
- Use shared state management
- Use shared styling system
- Use shared error boundaries
- Use shared logging

## 📋 Monorepo Patterns

### Turborepo
```json
// turbo.json
{
  "pipeline": {
    "build": {
      "dependsOn": ["^build"],
      "outputs": ["dist/**"],
    },
    "test": {
      "dependsOn": ["build"],
      "outputs": ["coverage/**"],
    },
  }
}
```

### Nx
```typescript
// nx.json
{
  "projects": {
    "app1": {
      "tags": ["type:app"]
    },
    "lib1": {
      "tags": ["type:lib"]
    }
  }
}
```

### Lerna
```json
// lerna.json
{
  "packages": ["packages/*"],
  "version": "independent",
  "npmClient": "npm",
  "command": {
    "bootstrap": {
      "hoist": true
    }
  }
}
```

## 📋 Design Systems

### Component Library Structure
```
packages/
├── ui/
│   ├── components/
│   │   ├── Button/
│   │   ├── Input/
│   │   └── Modal/
│   ├── hooks/
│   ├── utils/
│   └── styles/
├── tokens/
│   ├── colors.ts
│   ├── typography.ts
│   └── spacing.ts
└── docs/
    └── stories/
```

### Design Tokens
```typescript
// tokens/colors.ts
export const colors = {
  primary: {
    50: '#f0f9ff',
    500: '#0ea5e9',
    900: '#0c4a6e',
  },
  neutral: {
    50: '#fafafa',
    500: '#71717a',
    900: '#18181b',
  },
};

// tokens/typography.ts
export const typography = {
  h1: { fontSize: '36px', fontWeight: 700 },
  h2: { fontSize: '30px', fontWeight: 600 },
  body: { fontSize: '16px', fontWeight: 400 },
};
```

### Component API Design
```typescript
// Button component
interface ButtonProps {
  variant?: 'primary' | 'secondary' | 'ghost';
  size?: 'sm' | 'md' | 'lg';
  disabled?: boolean;
  loading?: boolean;
  icon?: React.ReactNode;
  children: React.ReactNode;
  onClick?: () => void;
}

export function Button({ variant = 'primary', size = 'md', ...props }: ButtonProps) {
  // Implementation
}
```

## 📋 Server-Side Architecture

### Next.js App Router
```typescript
// app/page.tsx
async function Page() {
  const data = await fetchData();
  return <div>{data}</div>;
}

// app/api/route.ts
export async function GET() {
  const data = await fetchData();
  return Response.json(data);
}
```

### Next.js Pages Router
```typescript
// pages/index.tsx
export async function getServerSideProps() {
  const data = await fetchData();
  return { props: { data } };
}

function Page({ data }: { data: Data }) {
  return <div>{data}</div>;
}
```

### Next.js API Routes
```typescript
// pages/api/handler.ts
export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const data = await fetchData();
  res.status(200).json(data);
}
```

## 📋 State Architecture

### Global State with Zustand
```typescript
// store/userStore.ts
interface UserStore {
  user: User | null;
  setUser: (user: User) => void;
  clearUser: () => void;
}

export const useUserStore = create<UserStore>((set) => ({
  user: null,
  setUser: (user) => set({ user }),
  clearUser: () => set({ user: null }),
}));
```

### Server State with TanStack Query
```typescript
// hooks/useUsers.ts
export function useUsers() {
  return useQuery({
    queryKey: ['users'],
    queryFn: fetchUsers,
  });
}
```

### Form State with React Hook Form
```typescript
// components/UserForm.tsx
import { useForm } from 'react-hook-form';

function UserForm() {
  const { register, handleSubmit } = useForm<UserFormData>();
  
  const onSubmit = (data: UserFormData) => {
    submitUser(data);
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <input {...register('email')} />
      <input {...register('password')} />
      <button type="submit">Submit</button>
    </form>
  );
}
```

## 📋 Routing Architecture

### React Router
```typescript
// App.tsx
import { BrowserRouter, Routes, Route } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/users/:id" element={<UserDetail />} />
        <Route path="/settings" element={<Settings />} />
      </Routes>
    </BrowserRouter>
  );
}
```

### Next.js App Router
```typescript
// app/layout.tsx
export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html>
      <body>{children}</body>
    </html>
  );
}

// app/page.tsx
export default function Page() {
  return <div>Home</div>;
}

// app/users/[id]/page.tsx
export default function UserDetail({ params }: { params: { id: string } }) {
  return <div>User {params.id}</div>;
}
```

## 📋 Performance Architecture

### Code Splitting Strategy
```typescript
// Route-based splitting
const Home = lazy(() => import('./pages/Home'));
const About = lazy(() => import('./pages/About'));

// Component-based splitting
const HeavyChart = lazy(() => import('./components/HeavyChart'));
```

### Caching Strategy
```typescript
// Service Worker caching
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open('v1').then((cache) => {
      return cache.addAll([
        '/',
        '/styles.css',
        '/script.js',
      ]);
    })
  );
});
```

### CDN Strategy
```typescript
// Use CDN for static assets
const CDN_URL = 'https://cdn.example.com';

const imageUrl = `${CDN_URL}/images/logo.png`;
const scriptUrl = `${CDN_URL}/scripts/main.js`;
```

## 📋 Architecture Best Practices

### DOs
- ✅ ใช้ micro-frontends สำหรับ large applications
- ✅ ใช้ monorepo สำหรับ shared code
- ✅ ใช้ design system สำหรับ consistency
- ✅ ใช้ server-side rendering สำหรับ SEO
- ✅ ใช้ proper state management
- ✅ ใช้ proper routing strategy
- ✅ ใช้ code splitting สำหรับ performance
- ✅ ใช้ caching สำหรับ performance
- ✅ ใช้ CDN สำหรับ static assets
- ✅ ใช proper error boundaries

### DON'Ts
- ❌ ไม่ใช้ monolithic architecture สำหรับ large apps
- ❌ ไม่ใช้ scattered state management
- ❌ ไม่ใช้ inconsistent design system
- ❌ ไม่ใช้ client-side only สำหรับ SEO-critical pages
- ❌ ไม่ใช้ prop drilling สำหรับ deep state
- ❌ ไม่ใช้ nested routing ที่ซับซ้อน
- ❌ ไม่ใช้ large bundle sizes
- ❌ ไม่ใช้ no caching
- ❌ ไม่ใช้ no CDN
- ❌ ไม่ใช้ no error boundaries

---
*Architecture (Advanced) - Reference ของ Stella*
