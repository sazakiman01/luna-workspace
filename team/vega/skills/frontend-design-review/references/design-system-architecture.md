# Design System Architecture

## 📋 Design System Structure

### Atomic Design
```
atoms/      # Basic building blocks (Button, Input, Icon)
molecules/  # Combinations of atoms (SearchBox, Card)
organisms/  # Complex combinations (Header, Sidebar)
templates/  # Page structures (Layout, Dashboard)
pages/      # Complete pages (HomePage, ProfilePage)
```

### Feature-based Structure
```
features/
  auth/
    components/
      LoginForm/
      RegisterForm/
    styles/
  dashboard/
    components/
      StatsCard/
      Chart/
    styles/
```

### Hybrid Structure
```
components/
  ui/              # Reusable UI components (Button, Input)
  layout/          # Layout components (Header, Footer)
  features/       # Feature-specific components
    auth/
    dashboard/
```

## 📋 Component API Design

### Props Interface
```typescript
interface ButtonProps {
  variant?: 'primary' | 'secondary' | 'ghost' | 'destructive';
  size?: 'sm' | 'md' | 'lg';
  disabled?: boolean;
  loading?: boolean;
  icon?: React.ReactNode;
  iconPosition?: 'left' | 'right';
  fullWidth?: boolean;
  children: React.ReactNode;
  onClick?: () => void;
  className?: string;
}
```

### Compound Components
```typescript
interface TabsProps {
  defaultValue?: string;
  onValueChange?: (value: string) => void;
  children: React.ReactNode;
}

interface TabsListProps {
  children: React.ReactNode;
}

interface TabsTriggerProps {
  value: string;
  children: React.ReactNode;
}

interface TabsContentProps {
  value: string;
  children: React.ReactNode;
}

// Usage
<Tabs defaultValue="tab1">
  <TabsList>
    <TabsTrigger value="tab1">Tab 1</TabsTrigger>
    <TabsTrigger value="tab2">Tab 2</TabsTrigger>
  </TabsList>
  <TabsContent value="tab1">Content 1</TabsContent>
  <TabsContent value="tab2">Content 2</TabsContent>
</Tabs>
```

### Render Props
```typescript
interface DropdownProps {
  children: (props: { isOpen: boolean; toggle: () => void }) => React.ReactNode;
}

function Dropdown({ children }: DropdownProps) {
  const [isOpen, setIsOpen] = useState(false);
  const toggle = () => setIsOpen(!isOpen);
  return children({ isOpen, toggle });
}

// Usage
<Dropdown>
  {({ isOpen, toggle }) => (
    <div>
      <button onClick={toggle}>Toggle</button>
      {isOpen && <div>Content</div>}
    </div>
  )}
</Dropdown>
```

## 📋 Theming Architecture

### Theme Provider
```typescript
interface Theme {
  colors: {
    primary: string;
    secondary: string;
    // ...
  };
  spacing: {
    sm: string;
    md: string;
    // ...
  };
  // ...
}

interface ThemeContextValue {
  theme: Theme;
  setTheme: (theme: Theme) => void;
}

const ThemeContext = createContext<ThemeContextValue | null>(null);

export function ThemeProvider({ children, defaultTheme }: ThemeProviderProps) {
  const [theme, setTheme] = useState(defaultTheme);
  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      {children}
    </ThemeContext.Provider>
  );
}
```

### Dark Mode Implementation
```typescript
function useDarkMode() {
  const [isDark, setIsDark] = useState(false);

  useEffect(() => {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    setIsDark(prefersDark);
  }, []);

  const toggle = () => setIsDark(!isDark);

  return { isDark, toggle };
}
```

## 📋 Documentation Architecture

### Storybook
```typescript
// Button.stories.tsx
import type { Meta, StoryObj } from '@storybook/react';
import { Button } from './Button';

const meta: Meta<typeof Button> = {
  title: 'UI/Button',
  component: Button,
  tags: ['autodocs'],
};

export default meta;
type Story = StoryObj<typeof Button>;

export const Primary: Story = {
  args: {
    variant: 'primary',
    children: 'Button',
  },
};

export const Secondary: Story = {
  args: {
    variant: 'secondary',
    children: 'Button',
  },
};
```

### Component Documentation
```typescript
/**
 * Button component
 *
 * @description A versatile button component with multiple variants and sizes
 *
 * @example
 * ```tsx
 * <Button variant="primary" size="md">
 *   Click me
 * </Button>
 * ```
 */
export function Button({ variant, size, children, ...props }: ButtonProps) {
  // Implementation
}
```

## 📋 Versioning Strategy

### Semantic Versioning
```
1.0.0 - Major version (breaking changes)
1.1.0 - Minor version (new features, backward compatible)
1.1.1 - Patch version (bug fixes, backward compatible)
```

### Changelog
```markdown
# Changelog

## [1.1.0] - 2024-01-01
### Added
- New Button variant: "ghost"
- New Input component

### Changed
- Updated primary color palette

### Fixed
- Fixed Button focus state
```

## 📋 Migration Guide

### Breaking Changes
```markdown
# Migration Guide v1.0.0 → v2.0.0

## Button Component
- Renamed `variant="default"` to `variant="primary"`
- Removed `icon` prop, use `iconPosition` instead

## Before
```tsx
<Button variant="default" icon={<Icon />}>Click</Button>
```

## After
```tsx
<Button variant="primary" icon={<Icon />} iconPosition="left">Click</Button>
```
```

## 📋 Design System Governance

### Component Review Process
1. Design review with Vega
2. Implementation review with Stella
3. Accessibility review
4. Performance review
5. Documentation review
6. Approval

### Contribution Guidelines
- Follow component API design principles
- Follow naming conventions
- Include documentation
- Include tests
- Include accessibility features
- Include performance optimizations

## 📋 Design System Best Practices

### DOs
- ✅ ใช้ consistent API design
- ✅ ใช้ semantic naming
- ✅ ใช้ proper TypeScript types
- ✅ ใช้ proper documentation
- ✅ ใช้ proper testing
- ✅ ใช้ proper accessibility
- ✅ ใช้ proper performance
- ✅ ใช้ proper versioning
- ✅ ใช้ proper migration guides
- ✅ ใช้ proper governance

### DON'Ts
- ❌ ไม่ใช้ inconsistent API
- ❌ ไม่ใช้ non-semantic naming
- ❌ ไม่ใช้ any types
- ❌ ไม่ใช้ no documentation
- ❌ ไม่ใช้ no tests
- ❌ ไม่ใช้ no accessibility
- ❌ ไม่ใช้ no performance
- ❌ ไม่ใช้ no versioning
- ❌ ไม่ใช้ no migration guides
- ❌ ไม่ใช้ no governance

---
*Design System Architecture - Reference ของ Vega*
