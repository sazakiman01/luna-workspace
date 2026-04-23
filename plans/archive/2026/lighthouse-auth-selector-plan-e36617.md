# Lighthouse Remediation Plan for Auth Selector
This plan outlines targeted actions to reduce First Contentful Paint (FCP), Largest Contentful Paint (LCP), and Speed Index on http://localhost:3000/auth-selector/ while validating improvements via Chrome Lighthouse.

## Scope & Goals
- Page: `AuthSelector` (src/pages/AuthSelector/index.tsx)
- Metrics to improve: FCP (6.3s), LCP (13.1s), Speed Index (6.9s) per Chrome Lighthouse mobile run
- Keep functional behavior identical; UI refresh limited to performance tuning

## Action Plan
1. **Reproduce & Baseline**
   - Run Lighthouse (mobile, throttled) on the local dev server to capture a controlled baseline report and export JSON for comparison.
   - Record Network and Performance panels to understand which resources dominate early paint milestones (look for blocking fonts/scripts/images).

2. **Optimize Critical Rendering Path**
   - Inline or preload key assets: the GoFlow logo SVG and primary font to avoid late discovery; convert `<img>` to `<Image>`/`<svg>` inline if feasible to reduce request latency.
   - Add `<link rel="preconnect">` / `<link rel="dns-prefetch">` for Cognito/Eko domains referenced early, ensuring they do not block main thread.

3. **Trim & Defer JavaScript/CSS**
   - Audit `AuthProviderCard`, `AuthProviderIcon`, and react-icons usage; replace heavy icon bundles with tree-shaken SVGs to reduce JS payload.
   - Split out helper logic (e.g., `buildCognitoLoginUrl`, `getEkoLoginUrl`) or move to lazy-loaded module so above-the-fold render requires minimal JS.
   - Verify Tailwind/stylesheets: purge unused classes, ensure critical CSS is small; delay non-critical styles via `media="print" onload="this.media='all'"` if necessary.

4. **Improve Hero Paint (LCP)**
   - Ensure hero content (logo + heading) is server-rendered and not blocked by scripts; add explicit width/height to prevent layout shifts.
   - Use priority loading (e.g., `<link rel="preload" as="image">`) for the hero logo since it likely contributes to LCP.

5. **Validate & Iterate**
   - Re-run Lighthouse after each batch of optimizations, targeting at least <3s FCP / <4s LCP / <4s Speed Index under test profile.
   - Compare with baseline JSON to confirm gains; keep best report for documentation.
