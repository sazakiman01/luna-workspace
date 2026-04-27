---
description: Database Designer skill สำหรับ Nebula รวม database design, schema design, indexing, performance optimization, data modeling, และ migration
---

# Nebula Skill - Database Designer

## 🎯 Purpose

Database Designer skill สำหรับ Nebula รวม database design, schema design, indexing, performance optimization, data modeling, และ migration

## 📋 Core Competencies

### Database Design
- **SQL Databases:** PostgreSQL, MySQL, SQL Server
- **NoSQL Databases:** MongoDB, DynamoDB, Firestore
- **Graph Databases:** Neo4j, ArangoDB
- **Time-series Databases:** InfluxDB, TimescaleDB
- **Search Engines:** Elasticsearch, Solr

### Schema Design
- **Normalization:** 1NF, 2NF, 3NF, BCNF
- **Denormalization:** Performance optimization
- **Data Modeling:** ER diagrams, Schema design
- **Constraints:** Primary keys, Foreign keys, Unique constraints
- **Data Types:** Appropriate type selection

### Performance Optimization
- **Indexing:** B-tree, Hash, GIN, GiST
- **Query Optimization:** Query planning, Execution plans
- **Partitioning:** Horizontal, Vertical
- **Sharding:** Hash, Range, Directory
- **Caching:** Query cache, Materialized views

## 🎯 Database Types

### SQL Database
```typescript
// SQL schema design
interface SQLSchema {
  tables: Table[];
  indexes: Index[];
  constraints: Constraint[];
  views: View[];
  triggers: Trigger[];
}

interface Table {
  name: string;
  columns: Column[];
  primaryKey: string[];
  foreignKeys: ForeignKey[];
}
```

### NoSQL Database
```typescript
// NoSQL schema design
interface NoSQLSchema {
  collections: Collection[];
  indexes: Index[];
  validationRules: ValidationRule[];
}

interface Collection {
  name: string;
  schema: Schema;
  indexes: Index[];
}
```

### Graph Database
```typescript
// Graph schema design
interface GraphSchema {
  nodes: Node[];
  edges: Edge[];
  properties: Property[];
}

interface Node {
  label: string;
  properties: Property[];
}
```

## 🎯 Indexing Strategy

### B-tree Index
```typescript
// B-tree index
interface BTreeIndex {
  columns: string[];
  unique: boolean;
  order: 'ASC' | 'DESC';
}
```

### Hash Index
```typescript
// Hash index
interface HashIndex {
  columns: string[];
  unique: boolean;
}
```

### GIN Index
```typescript
// GIN index (PostgreSQL)
interface GINIndex {
  columns: string[];
  include: string[];
}
```

## 🎯 Performance Optimization

### Query Optimization
```typescript
// Query optimization
interface QueryOptimization {
  explain: ExplainPlan;
  indexes: Index[];
  hints: QueryHint[];
  rewrite: RewriteRule[];
}
```

### Partitioning
```typescript
// Partitioning strategy
interface Partitioning {
  type: 'range' | 'list' | 'hash';
  key: string;
  partitions: Partition[];
}
```

### Sharding
```typescript
// Sharding strategy
interface Sharding {
  shardKey: string;
  algorithm: 'hash' | 'range' | 'directory';
  shards: Shard[];
}
```

## 🎯 Data Modeling

### Entity-Relationship Modeling
```typescript
// ER model
interface ERModel {
  entities: Entity[];
  relationships: Relationship[];
  attributes: Attribute[];
}
```

### Document Modeling
```typescript
// Document model
interface DocumentModel {
  collection: string;
  schema: Schema;
  validation: ValidationRule[];
}
```

### Graph Modeling
```typescript
// Graph model
interface GraphModel {
  nodes: Node[];
  edges: Edge[];
  properties: Property[];
}
```

## 🎯 Migration

### Schema Migration
```typescript
// Migration tool
interface Migration {
  version: string;
  up: MigrationScript;
  down: MigrationScript;
}
```

### Data Migration
```typescript
// Data migration
interface DataMigration {
  source: DataSource;
  target: DataSource;
  transform: TransformFunction;
  validation: ValidationFunction;
}
```

## 🎯 Best Practices

### DOs
- ✅ Use appropriate data types
- ✅ Normalize data appropriately
- ✅ Index frequently queried columns
- ✅ Use constraints for data integrity
- ✅ Plan for scalability
- ✅ Monitor performance
- ✅ Use migrations
- ✅ Document schema
- ✅ Test queries
- ✅ Backup regularly

### DON'Ts
- ❌ Don't over-normalize
- ❌ Don't under-index
- ❌ Don't ignore performance
- ❌ Don't skip constraints
- ❌ Don't ignore scalability
- ❌ Don't skip monitoring
- ❌ Don't skip migrations
- ❌ Don't skip documentation
- ❌ Don't skip testing
- ❌ Don't skip backups

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- Designing database schema
- Optimizing database performance
- Planning database migrations
- Designing data models
- Indexing strategies
- Database scaling

## 📝 Notes

- Nebula Skill ครอบคลุม database design, schema design, indexing, performance optimization, data modeling, migration
- Focus บน database architecture แล optimization
- ใช้ร่วมกับ cross-functional skills สำหรับ coordination

---
*Nebula Skill - Database Designer*
