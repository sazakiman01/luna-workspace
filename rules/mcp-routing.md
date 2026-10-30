# MCP Routing Policy

Use DS, DV, and KM MCP tools only after explicit approval from พี่แมน for each call, even when the request clearly matches a listed capability. Before asking, confirm the required input is present and the supplied data classification. For Confidential data, state what will be sent and ask for masked/dummy material or approval. Never send Restricted data (credentials, real PII, contracts, financial data) to an MCP tool.

Before requesting approval, verify that the tool's prerequisite is available. If it is missing, ask only for the missing prerequisite. Name the selected tool, explain why it fits, state the data that will be sent, and wait for approval. Call one relevant MCP tool first. Do not chain tools unless the user explicitly approves each next call.

Keep R2 actions (production changes, submission/routing, notifications, deployments, destructive operations, payments) behind separate explicit user confirmation even if an MCP tool supports them.

Do not use MCP for simple explanations, local code edits, ordinary code exploration, or a request outside the routes below.

## DS routes

| Intent | Tool | Required input |
|---|---|---|
| Summarize requirements, identify ambiguity/gaps, draft TH/EN minutes or briefing | `ds-requirement_intelligence` | Requirement or SDD content |
| Draft HLDD, LLDD, or Integration Design | `ds-detail_design_authoring` | Approved SDD/SRS/FSD or source code |
| Cross-check cloud account request or cloud estimation | `ds-estimation_cross_check` | SDD and estimation/request material |
| Pre-fill ITSM/cloud forms or cloud estimation workbook | `ds-form_prefill` | Authoritative project data |
| Draft Terraform, CloudFormation, or Kubernetes manifests | `ds-iac_provisioning` | Deployment/network/account specifications |
| Generate CI/CD pipeline configuration from an approved template | `ds-pipeline_engineering` | Approved template and implementation readiness inputs |
| Validate SDD/HLDD/LLDD/Integration documents | `ds-spec_review_validation` | Design document(s) |
| Prepare pen-test scope, plan, or test cases | `ds-security_test_readiness` | System/interface/module inventory |
| Assemble a change/gate evidence pack | `ds-gate_preparation` | Change summary and available evidence |
| Package and route approved documents to Solar/Jira | `ds-submission_routing` | Approved documents and evidence; confirm before routing/notification |

## DV routes

| Intent | Tool | Required input |
|---|---|---|
| Scaffold implementation modules from design | `dv-code_gen` | Approved LLDD and tech stack |
| Design test cases or test-data specification | `dv-test_design` | Approved LLDD for the module |
| Write executable unit tests | `dv-test_writer` | Test Case List and Test Data Spec |
| Check PR implementation against LLDD algorithm steps | `dv-spec_compliance` | Pull request/code and approved LLDD |
| Analyze SIT or CI/CD failures | `dv-test_analysis` | SIT results or CI/CD reports and exit criteria |
| Draft QC handover documents | `dv-lldd_writer` | Approved LLDD and delivery facts |

## KM route

| Intent | Tool | Required input |
|---|---|---|
| Ask about GOSOFT/CP ALL IT systems, services, applications, documents, or Dynatrace logs | `km-gosoft_it` | A focused question |
