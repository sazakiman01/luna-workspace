---
description: Backend Dev skill สำหรับ Nova รวม backend development, API design, database integration, authentication, performance, และ testing
---

# Nova Skill - Backend Dev

## 🎯 Purpose

Backend Dev skill สำหรับ Nova รวม backend development, API design, database integration, authentication, performance, และ testing

## 📋 Core Competencies

### Backend Development
- **Languages:** Node.js, Python, Go, Java
- **Frameworks:** Express, Fastify, Flask, Gin, Spring Boot
- **API Design:** REST, GraphQL, gRPC
- **Authentication:** JWT, OAuth2, Session-based
- **Authorization:** RBAC, ABAC, Policy-based

### Database Integration
- **SQL:** PostgreSQL, MySQL, SQL Server
- **NoSQL:** MongoDB, DynamoDB, Firestore
- **ORM:** Prisma, TypeORM, SQLAlchemy
- **Migrations:** Knex, Flyway, Alembic
- **Query Optimization:** Indexing, Caching, Query planning

### Performance & Scalability
- **Caching:** Redis, Memcached
- **Load Balancing:** Nginx, HAProxy, AWS ALB
- **Rate Limiting:** Token bucket, Sliding window
- **Connection Pooling:** Database, HTTP
- **Async Processing:** Message queues, Background jobs

## 🎯 API Design

### REST API
```typescript
// REST API design
interface RESTAPI {
  endpoints: Endpoint[];
  versioning: 'url' | 'header' | 'query';
  authentication: AuthProvider;
  rateLimiting: RateLimitConfig;
}

interface Endpoint {
  path: string;
  method: 'GET' | 'POST' | 'PUT' | 'DELETE';
  request: RequestSchema;
  response: ResponseSchema;
  errors: ErrorSchema[];
}
```

### GraphQL API
```typescript
// GraphQL schema
type Query {
  users(limit: Int, offset: Int): [User!]!
  user(id: ID!): User
}

type Mutation {
  createUser(input: CreateUserInput!): User!
  updateUser(id: ID!, input: UpdateUserInput!): User!
  deleteUser(id: ID!): Boolean!
}
```

### gRPC API
```typescript
// gRPC service definition
service UserService {
  rpc GetUser(GetUserRequest) returns (User);
  rpc CreateUser(CreateUserRequest) returns (User);
  rpc UpdateUser(UpdateUserRequest) returns (User);
  rpc DeleteUser(DeleteUserRequest) returns (Empty);
}
```

## 🎯 Database Integration

### SQL Database
```typescript
// SQL integration
interface SQLDatabase {
  connection: ConnectionConfig;
  migrations: Migration[];
  models: Model[];
  queries: Query[];
}
```

### NoSQL Database
```typescript
// NoSQL integration
interface NoSQLDatabase {
  connection: ConnectionConfig;
  collections: Collection[];
  indexes: Index[];
}
```

### ORM Integration
```typescript
// ORM integration
interface ORM {
  models: Model[];
  relations: Relation[];
  migrations: Migration[];
  queries: QueryBuilder;
}
```

## 🎯 Authentication & Authorization

### JWT Authentication
```typescript
// JWT implementation
interface JWTAuth {
  secret: string;
  expiresIn: string;
  algorithm: 'HS256' | 'RS256';
  refresh: RefreshTokenConfig;
}
```

### OAuth2
```typescript
// OAuth2 implementation
interface OAuth2Config {
  providers: OAuthProvider[];
  scopes: string[];
  callbackURL: string;
}
```

### RBAC
```typescript
// RBAC implementation
interface RBAC {
  roles: Role[];
  permissions: Permission[];
  policies: Policy[];
}
```

## 🎯 Performance Optimization

### Caching
```typescript
// Cache implementation
interface Cache {
  strategy: 'redis' | 'memcached';
  ttl: number;
  evictionPolicy: 'lru' | 'lfu';
  distribution: 'local' | 'distributed';
}
```

### Rate Limiting
```typescript
// Rate limiting
interface RateLimiter {
  algorithm: 'token-bucket' | 'sliding-window';
  limit: number;
  window: number;
  storage: Storage;
}
```

### Connection Pooling
```typescript
// Connection pool
interface ConnectionPool {
  min: number;
  max: number;
  acquireTimeout: number;
  idleTimeout: number;
}
```

## 🎯 Testing

### Unit Testing
```typescript
// Unit test example
describe('UserService', () => {
  it('should create user', async () => {
    const user = await createUser(userData);
    expect(user).toBeDefined();
  });
});
```

### Integration Testing
```typescript
// Integration test example
describe('API Integration', () => {
  it('should create user via API', async () => {
    const response = await fetch('/api/users', {
      method: 'POST',
      body: JSON.stringify(userData),
    });
    expect(response.status).toBe(201);
  });
});
```

### E2E Testing
```typescript
// E2E test example
describe('User Flow', () => {
  it('should complete user registration flow', async () => {
    await page.goto('/register');
    await page.fill('#email', 'test@example.com');
    await page.fill('#password', 'password123');
    await page.click('#submit');
    await expect(page).toHaveURL('/dashboard');
  });
});
```

## 🎯 Best Practices

### DOs
- ✅ Use proper error handling
- ✅ Validate input
- ✅ Sanitize output
- ✅ Use authentication
- ✅ Use authorization
- ✅ Use caching
- ✅ Use connection pooling
- ✅ Use logging
- ✅ Use monitoring
- ✅ Use testing

### DON'Ts
- ❌ Don't trust user input
- ❌ Don't expose sensitive data
- ❌ Don't ignore errors
- ❌ Don't skip validation
- ❌ Don't skip testing
- ❌ Don't skip logging
- ❌ Don't skip monitoring
- ❌ Don't hardcode secrets
- ❌ Don't ignore performance
- ❌ Don't ignore security

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- Developing backend APIs
- Designing database schema
- Implementing authentication
- Optimizing performance
- Writing tests
- Integrating with third-party services

## 📝 Notes

- Nova Skill ครอบคลุม backend development, API design, database integration, authentication, performance, testing
- Focus บน backend implementation และ best practices
- ใช้ร่วมกับ cross-functional skills สำหรับ coordination

---
*Nova Skill - Backend Dev*
