# Remove Caption/Description from AuthSelector
We will update `AuthSelector` and related components so that login options no longer define or render caption/description fields anywhere.

1. **Prune data shape** – Update the `AuthOption` type and `AUTH_OPTIONS` literals in `src/pages/AuthSelector/index.tsx` to drop `caption` and `description`, ensuring no unused props remain.
2. **Simplify reusable card API** – Remove the optional `caption`/`description` props (and rendering branches) from `AuthProviderCard`, keeping only the title/badge/icon/action pieces.
3. **Adjust call sites** – Clean up `AuthSelector` (and any future usages) so they stop passing the removed props and verify the UI still matches the desired simplified layout.
