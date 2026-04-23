# AuthSelector Componentization Plan
This plan identifies the reusable pieces inside `src/pages/AuthSelector/index.tsx` and outlines how to extract them into clean components before refactoring the screen.

1. **Audit current layout & state wiring** – Trace how `AUTH_OPTIONS`, `handleContinue`, and `statusMessage` are used so we know which parts remain in-page (stateful logic) versus what can be dumb presentational components.
2. **Design `AuthProviderCard` component** – Extract the card UI (icon slot, title, status badge, external-link icon, button states) into a parameterized component receiving icon ReactNode, title, caption/description, badge, selected/loading flags, and click handler for reuse anywhere the same style is needed.
3. **Create `AuthProviderIcon` (image) component** – Wrap the CPALL/CONNECT logos in a reusable component that handles the bordered rounded square, hover styles, and swaps the SVG based on a prop (or accepts children) so the visual can be reused independently of the card.
4. **Optional `StatusNotice` helper** – Encapsulate the aria-live status text into a small component that simply receives the `statusMessage` string, keeping accessibility logic centralized for other auth-related pages.
5. **Integration plan** – Update `AuthSelector` to import the new components, pass down props derived from `AUTH_OPTIONS`, and confirm that the visual output matches the current UI while simplifying future reuse.
