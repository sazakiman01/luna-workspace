# Frontend Coding Standards

## 📋 ESLint Configuration

```json
{
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:react-hooks/recommended",
    "plugin:react/recommended",
    "plugin:jsx-a11y/recommended"
  ],
  "rules": {
    "react/react-in-jsx-scope": "off",
    "@typescript-eslint/no-explicit-any": "error",
    "@typescript-eslint/explicit-module-boundary-types": "warn",
    "react-hooks/rules-of-hooks": "error",
    "react-hooks/exhaustive-deps": "warn"
  }
}
```

## 📋 Prettier Configuration

```json
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 100,
  "tabWidth": 2,
  "useTabs": false
}
```

## 📋 TypeScript Configuration

```json
{
  "compilerOptions": {
    "target": "ES2020",
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "moduleResolution": "bundler",
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "strictFunctionTypes": true,
    "strictBindCallApply": true,
    "strictPropertyInitialization": true,
    "noImplicitThis": true,
    "alwaysStrict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "react-jsx",
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```

## 📋 Code Style Guidelines

### File Organization
- **One component per file** - แต่ละ component อยู่ในไฟล์เดียว
- **File naming** - ใช้ PascalCase สำหรับ components (Button.tsx, UserCard.tsx)
- **Folder structure** - ตาม naming-conventions.md

### Component Structure
```typescript
// 1. Imports (external, internal, types)
import React from 'react';
import { useAuth } from '@/hooks/useAuth';
import type { User } from '@/types/user.types';

// 2. Types/Interfaces
interface Props {
  user: User;
  onEdit: (user: User) => void;
}

// 3. Component
export function UserProfile({ user, onEdit }: Props) {
  // 4. Hooks
  const { isAuthenticated } = useAuth();

  // 5. Event handlers
  const handleEdit = () => {
    onEdit(user);
  };

  // 6. Render
  return (
    <div className="user-profile">
      {/* JSX */}
    </div>
  );
}
```

### Naming Conventions
- **Components:** PascalCase (UserProfile, Button)
- **Functions:** camelCase (handleClick, fetchUser)
- **Variables:** camelCase (userName, isActive)
- **Constants:** UPPER_SNAKE_CASE (API_URL, MAX_RETRIES)
- **Types/Interfaces:** PascalCase (User, ButtonProps)
- **Enums:** PascalCase (UserRole, Status)

### Comments
- **JSDoc** สำหรับ functions ที่ซับซ้อน
```typescript
/**
 * Fetches user data from API
 * @param userId - The user ID to fetch
 * @returns Promise<User> - The user data
 * @throws Error - If the API request fails
 */
async function fetchUser(userId: string): Promise<User> {
  // ...
}
```

- **Inline comments** สำหรับ complex logic
```typescript
// Calculate the total price including tax
const totalPrice = subtotal * (1 + taxRate);
```

### Error Handling
- **Try-catch** สำหรับ async operations
```typescript
try {
  const user = await fetchUser(userId);
  setUser(user);
} catch (error) {
  console.error('Failed to fetch user:', error);
  setError('Failed to load user');
}
```

- **Error boundaries** สำหรับ React components
```typescript
<ErrorBoundary fallback={<ErrorFallback />}>
  <UserProfile />
</ErrorBoundary>
```

## 📋 Best Practices

### Performance
- **Avoid inline functions** in render props
- **Use useMemo** สำหรับ expensive calculations
- **Use useCallback** สำหรับ functions ที่ถูกส่งเป็น props
- **Code split** สำหรับ large components

### Security
- **Validate inputs** ก่อนส่งไป API
- **Sanitize HTML** ก่อน render (ใช้ DOMPurify)
- **Use HTTPS** สำหรับ API calls
- **Store secrets** ใน environment variables

### Accessibility
- **Use semantic HTML** (nav, main, article)
- **Add ARIA labels** สำหรับ icons และ buttons ที่ไม่มี text
- **Ensure keyboard navigation** ทำงาน
- **Check color contrast** (WCAG AA)

---
*Coding Standards - Knowledge Package ของ Stella*
