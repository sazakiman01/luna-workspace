---
description: DevOps Engineer skill สำหรับ Cosmos รวม CI/CD, deployment, monitoring, infrastructure as code, containerization, และ cloud services
---

# Cosmos Skill - DevOps Engineer

## 🎯 Purpose

DevOps Engineer skill สำหรับ Cosmos รวม CI/CD, deployment, monitoring, infrastructure as code, containerization, และ cloud services

## 📋 Core Competencies

### CI/CD
- **CI Tools:** GitHub Actions, GitLab CI, Jenkins, CircleCI
- **CD Tools:** ArgoCD, Flux, Spinnaker
- **Build Tools:** Docker, Buildpacks, Nix
- **Artifact Management:** Docker Hub, ECR, Artifactory
- **Pipeline Design:** Pipeline as code, Pipeline templates

### Deployment
- **Containerization:** Docker, Kubernetes, Docker Compose
- **Orchestration:** Kubernetes, Docker Swarm, Nomad
- **Service Mesh:** Istio, Linkerd, Consul
- **Load Balancing:** Nginx, HAProxy, AWS ALB
- **Rollout Strategies:** Blue-green, Canary, Rolling

### Monitoring
- **Metrics:** Prometheus, Grafana, Datadog
- **Logging:** ELK, Splunk, CloudWatch
- **Tracing:** Jaeger, Zipkin, Datadog APM
- **Alerting:** PagerDuty, Opsgenie, Alertmanager
- **Uptime:** Uptime Robot, Pingdom

## 🎯 CI/CD Pipeline

### Pipeline Configuration
```typescript
// CI/CD pipeline
interface CICDPipeline {
  stages: PipelineStage[];
  triggers: Trigger[];
  cache: CacheConfig;
  artifacts: Artifact[];
}

interface PipelineStage {
  name: string;
  jobs: Job[];
  needs: string[];
}
```

### Build Process
```typescript
// Build configuration
interface BuildConfig {
  tool: 'docker' | 'buildpack' | 'nix';
  dockerfile?: string;
  buildpacks?: string[];
  nix?: NixConfig;
}
```

### Deployment Process
```typescript
// Deployment configuration
interface DeploymentConfig {
  strategy: 'rolling' | 'blue-green' | 'canary';
  kubernetes: KubernetesConfig;
  healthChecks: HealthCheck[];
  rollback: RollbackConfig;
}
```

## 🎯 Containerization

### Docker
```typescript
// Docker configuration
interface DockerConfig {
  dockerfile: string;
  buildArgs: Record<string, string>;
  multiStage: boolean;
  security: SecurityConfig;
}
```

### Kubernetes
```typescript
// Kubernetes configuration
interface KubernetesConfig {
  deployment: Deployment;
  service: Service;
  ingress: Ingress;
  configMap: ConfigMap;
  secret: Secret;
}
```

### Service Mesh
```typescript
// Service mesh configuration
interface ServiceMeshConfig {
  provider: 'istio' | 'linkerd' | 'consul';
  trafficManagement: TrafficManagement;
  security: SecurityConfig;
  observability: ObservabilityConfig;
}
```

## 🎯 Infrastructure as Code

### Terraform
```typescript
// Terraform configuration
interface TerraformConfig {
  provider: 'aws' | 'gcp' | 'azure';
  resources: Resource[];
  variables: Variable[];
  outputs: Output[];
}
```

### CloudFormation
```typescript
// CloudFormation template
interface CloudFormationTemplate {
  AWSTemplateFormatVersion: string;
  Parameters: Parameter[];
  Resources: Resource[];
  Outputs: Output[];
}
```

### Helm
```typescript
// Helm chart
interface HelmChart {
  name: string;
  version: string;
  values: Values;
  templates: Template[];
}
```

## 🎯 Monitoring & Observability

### Metrics Collection
```typescript
// Metrics configuration
interface MetricsConfig {
  prometheus: PrometheusConfig;
  customMetrics: CustomMetric[];
  alertingRules: AlertingRule[];
}
```

### Logging
```typescript
// Logging configuration
interface LoggingConfig {
  elasticsearch: ElasticsearchConfig;
  logstash: LogstashConfig;
  kibana: KibanaConfig;
}
```

### Tracing
```typescript
// Tracing configuration
interface TracingConfig {
  jaeger: JaegerConfig;
  sampling: SamplingConfig;
}
```

## 🎯 Cloud Services

### AWS
```typescript
// AWS services
interface AWSServices {
  EC2: EC2Config;
  S3: S3Config;
  RDS: RDSConfig;
  Lambda: LambdaConfig;
  CloudFront: CloudFrontConfig;
}
```

### GCP
```typescript
// GCP services
interface GCPServices {
  ComputeEngine: ComputeEngineConfig;
  CloudStorage: CloudStorageConfig;
  CloudSQL: CloudSQLConfig;
  CloudFunctions: CloudFunctionsConfig;
  CloudCDN: CloudCDNConfig;
}
```

### Azure
```typescript
// Azure services
interface AzureServices {
  VirtualMachines: VirtualMachinesConfig;
  BlobStorage: BlobStorageConfig;
  SQLDatabase: SQLDatabaseConfig;
  Functions: FunctionsConfig;
  CDN: CDNConfig;
}
```

## 🎯 Best Practices

### DOs
- ✅ Use infrastructure as code
- ✅ Use containerization
- ✅ Use automated testing
- ✅ Use monitoring and alerting
- ✅ Use security best practices
- ✅ Use version control
- ✅ Use documentation
- ✅ Use backup and recovery
- ✅ Use cost optimization
- ✅ Use continuous improvement

### DON'Ts
- ❌ Don't manual deployments
- ❌ Don't skip testing
- ❌ Don't skip monitoring
- ❌ Don't skip security
- ❌ Don't skip documentation
- ❌ Don't skip backups
- ❌ Don't ignore costs
- ❌ Don't ignore performance
- ❌ Don't ignore reliability
- ❌ Don't ignore scalability

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- Setting up CI/CD pipelines
- Deploying applications
- Monitoring systems
- Managing infrastructure
- Implementing security
- Optimizing costs

## 📝 Notes

- Cosmos Skill ครอบคลุม CI/CD, deployment, monitoring, infrastructure as code, containerization, cloud services
- Focus บน DevOps best practices แล automation
- ใช้ร่วมกับ cross-functional skills สำหรับ coordination

---
*Cosmos Skill - DevOps Engineer*
