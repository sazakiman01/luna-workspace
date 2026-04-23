# WorkloadView Refactor Plan

Refactor `WorkloadView` into a smaller, testable, and higher-performance delivery workload module by separating domain calculations, UI sections, and interaction state while preserving current behavior first.

## Goals

- Make the workload area easier to read, debug, and extend
- Reduce render-time computation pressure and repeated transformations
- Clean up dead code and unreachable sections
- Improve UI structure without forcing a behavior rewrite in phase 1

## Current Issues

- `WorkloadView.jsx` is too large and mixes analytics, UI, and interaction concerns
- `activeSection` is fixed to `daily`, leaving other sections unreachable
- Multiple heavy `useMemo` blocks encode business rules directly inside the component
- State for filters, tooltip behavior, row expansion, and matrices is tightly coupled to data aggregation
- Some props/state appear underused or partially wired, increasing technical debt

## Target Architecture

### 1. Keep `DeliveryHub.jsx` as orchestration layer
- Continue loading `assignments`, `adminEntries`, `allLeaves`, and month context there
- Pass normalized inputs into a slimmer workload module

### 2. Move workload calculations into pure selectors/helpers
Create delivery-specific calculation modules, for example:
- `src/features/delivery/selectors/workloadMonthlySelectors.js`
- `src/features/delivery/selectors/workloadDailySelectors.js`
- `src/features/delivery/selectors/workloadMatrixSelectors.js`
- `src/features/delivery/utils/workloadRules.js`

Expected responsibilities:
- monthly utilization aggregation
- daily cell aggregation
- leave/admin hour normalization
- conflict detection
- role demand summary
- summary cards and derived insight
- daily cell status rules

### 3. Split UI into focused components
Candidate components:
- `WorkloadSummaryStrip`
- `DailyWorkloadMatrix`
- `MemberSourcePanel`
- `TeamLeadMandayMatrix`
- `WorkloadSectionTabs` or remove section abstraction entirely if only `daily` remains
- `PersonDrillDown`

### 4. Add a feature-oriented hook for screen state
Example:
- `useWorkloadViewState`

Scope:
- active section
- filters/search
- expanded rows
- expanded source groups
- tooltip flip state
- selected matrix member

## Refactor Phases

### Phase 1: Stabilize and clean technical debt
- Remove or restore unreachable sections intentionally
- Remove unused props/state/imports after confirming behavior
- Standardize naming around `MH`, `MD`, `utilize`, `admin`, and `leave`
- Extract duplicated rule snippets into helpers without changing output

### Phase 2: Extract domain logic
- Move all non-UI aggregation from `WorkloadView.jsx` into pure selector functions
- Keep functions deterministic and input-driven for easy testing
- Centralize rules such as target hours, under/over thresholds, leave-hour calculation, and workday checks

### Phase 3: Break down the UI
- Extract the daily matrix first, because it carries the highest complexity
- Extract tooltip/source detail as a standalone component
- Extract team lead matrix and summary strip next
- Leave `WorkloadView` as a composition layer only

### Phase 4: Improve performance deliberately
- Reuse precomputed maps/sets across selectors
- Avoid recalculating per-person/per-day structures in multiple places
- Reduce nested loops where shared indexes can be built once
- Ensure derived data is computed at the right layer, not during repeated rendering

### Phase 5: Tighten UX structure
- Decide whether section tabs should truly exist or be removed
- Make filters/search visibly consistent with available state
- Keep current visual design where possible, but reduce interaction complexity and hidden behavior

## Suggested File End State

- `WorkloadView.jsx` becomes a thin container/composer
- Domain rules live in selectors/utils
- Large visual blocks move into components under `src/features/delivery/components/` or a `workload/` subfolder
- Team Lead–specific rendering is isolated from general workload rendering

## Acceptance Criteria

- `WorkloadView.jsx` is substantially smaller and primarily declarative
- No unreachable section branches remain
- Derived workload logic is centralized and reusable
- Main calculations are testable as pure functions
- UI behavior remains functionally equivalent unless intentionally improved
- Performance is at least unchanged and ideally improved on large datasets

## Recommended Implementation Order

1. Remove dead paths and clarify section model
2. Extract rule helpers and selectors with no UI change
3. Extract `DailyWorkloadMatrix`
4. Extract `MemberSourcePanel` and `TeamLeadMandayMatrix`
5. Final pass on naming, props, and memo boundaries

## Risks to Watch

- Silent behavior changes in leave/admin hour calculation
- Differences between SR-mode `dailyManHours` and distributed project-mode hours
- Regressions in tooltip/detail panels because they depend on multiple derived sources
- Team Lead matrix drifting from daily matrix if both stop sharing the same selectors
