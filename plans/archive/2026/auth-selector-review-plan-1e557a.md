# AuthSelector Expert Review Plan
This plan outlines how I will audit the AuthSelector page and its supporting components to ensure the implementation meets expert expectations for structure and performance.

1. **Map the current AuthSelector flow** – Read `src/pages/AuthSelector/index.tsx` plus related auth components (`AuthProviderCard`, `AuthProviderIcon`, `AuthStatusNotice`, store/hooks) to understand control flow, data dependencies, and environment-variable usage.
2. **Evaluate structural quality** – Check component boundaries, state management, side effects, and coupling; note duplication, opportunities for custom hooks/utilities, and TypeScript typing gaps.
3. **Assess performance characteristics** – Review preconnect logic, lazy loading, render cost (re-renders, derived data, memoization), and navigation paths (blocking work, synchronous redirects) for both Cognito and EKO flows.
4. **Summarize findings & recommend expert-level improvements** – Categorize issues by severity (structure vs. performance), propose concrete refactors/optimizations, and highlight required env-variable documentation or safeguards.
