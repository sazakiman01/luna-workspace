---
description: System Architect skill สำหรับ Orion รวม system design, architecture patterns, scalability, reliability, security, และ cross-functional coordination
---

# Orion Skill - System Architect

## 🎯 Purpose

System Architect skill สำหรับ Orion รวม system design, architecture patterns, scalability, reliability, security, และ cross-functional coordination

## 📋 Core Competencies

### System Design
- **Architecture Patterns:** Microservices, Monolith, Event-driven, CQRS
- **Design Principles:** SOLID, DRY, KISS, YAGNI
- **Scalability:** Horizontal scaling, Vertical scaling, Load balancing
- **Reliability:** High availability, Fault tolerance, Disaster recovery
- **Security:** Security by design, Zero trust, Encryption

### Technology Stack
- **Backend:** Node.js, Python, Go, Java
- **Databases:** SQL, NoSQL, Graph, Time-series
- **Messaging:** Kafka, RabbitMQ, SQS
- **Caching:** Redis, Memcached
- **Search:** Elasticsearch, Solr

### Cloud & DevOps
- **Cloud Providers:** AWS, GCP, Azure
- **Containerization:** Docker, Kubernetes
- **CI/CD:** Jenkins, GitHub Actions, GitLab CI
- **Infrastructure as Code:** Terraform, CloudFormation
- **Monitoring:** Prometheus, Grafana, ELK

## 🎯 Architecture Patterns

### Microservices Architecture
```typescript
// Microservices design
interface Microservice {
  name: string;
  responsibility: string;
  api: APIContract;
  database: Database;
  dependencies: Dependency[];
}
```

### Event-Driven Architecture
```typescript
// Event-driven design
interface Event {
  type: string;
  payload: any;
  timestamp: Date;
  source: string;
}

interface EventConsumer {
  eventType: string;
  handler: (event: Event) => void;
}
```

### CQRS Pattern
```typescript
// CQRS implementation
interface Command {
  type: string;
  payload: any;
}

interface Query {
  type: string;
  filter: any;
}

interface CommandHandler {
  handle(command: Command): Promise<void>;
}

interface QueryHandler {
  handle(query: Query): Promise<any>;
}
```

## 🎯 Scalability Patterns

### Horizontal Scaling
```typescript
// Load balancer configuration
interface LoadBalancerConfig {
  algorithm: 'round-robin' | 'least-connections' | 'ip-hash';
  healthCheck: HealthCheck;
  backends: Backend[];
}
```

### Caching Strategy
```typescript
// Cache implementation
interface CacheStrategy {
  ttl: number;
  evictionPolicy: 'lru' | 'lfu' | 'fifo';
  distribution: 'local' | 'distributed';
}
```

### Database Sharding
```typescript
// Sharding strategy
interface ShardingStrategy {
  shardKey: string;
  algorithm: 'hash' | 'range' | 'directory';
  shards: Shard[];
}
```

## 🎯 Reliability Patterns

### High Availability
```typescript
// HA configuration
interface HAConfig {
  replicas: number;
  zones: string[];
  failover: FailoverStrategy;
}
```

### Fault Tolerance
```typescript
// Circuit breaker pattern
interface CircuitBreaker {
  threshold: number;
  timeout: number;
  fallback: () => any;
}
```

### Disaster Recovery
```typescript
// DR plan
interface DisasterRecoveryPlan {
  backup: BackupStrategy;
  replication: ReplicationStrategy;
  recovery: RecoveryProcedure;
}
```

## 🎯 Security Patterns

### Zero Trust Architecture
```typescript
// Zero trust implementation
interface ZeroTrustConfig {
  authentication: AuthProvider;
  authorization: AuthPolicy;
  encryption: EncryptionConfig;
  monitoring: SecurityMonitoring;
}
```

### API Security
```typescript
// API security
interface APISecurity {
  authentication: 'jwt' | 'oauth2' | 'api-key';
  rateLimiting: RateLimitConfig;
  inputValidation: ValidationSchema;
  outputSanitization: SanitizationSchema;
}
```

### Data Security
```typescript
// Data security
interface DataSecurity {
  encryptionAtRest: boolean;
  encryptionInTransit: boolean;
  keyManagement: KeyManagement;
  dataClassification: DataClassification;
}
```

## 🎯 Best Practices

### DOs
- ✅ Design for scalability
- ✅ Design for reliability
- ✅ Design for security
- ✅ Design for maintainability
- ✅ Document architecture
- ✅ Use proven patterns
- ✅ Consider trade-offs
- ✅ Plan for failures
- ✅ Monitor continuously
- ✅ Iterate regularly

### DON'Ts
- ❌ Don't over-engineer
- ❌ Don't ignore edge cases
- ❌ Don't skip documentation
- ❌ Don't ignore performance
- ❌ Don't ignore security
- ❌ Don't ignore monitoring
- ❌ Don't ignore testing
- ❌ Don't ignore maintenance
- ❌ Don't ignore costs
- ❌ Don't ignore team feedback

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- Designing system architecture
- Evaluating architecture decisions
- Conducting architecture reviews
- Planning system migrations
- Designing scalability solutions
- Designing reliability solutions
- Designing security solutions
- Coordinating with other teams

## 📝 Notes

- Orion Skill ครอบคลุม system design, architecture patterns, scalability, reliability, security
- Focus บน architectural decisions และ technical leadership
- ใช้ร่วมกับ cross-functional skills สำหรับ coordination

---
*Orion Skill - System Architect*
