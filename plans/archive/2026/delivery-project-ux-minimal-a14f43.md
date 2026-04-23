# Delivery Project UX Minimal Plan

This plan simplifies the `/delivery` > `Projects` experience to only the essentials so the page feels lighter, faster to scan, and less visually noisy.

## Goal
- Keep only the controls and information needed for finding and acting on projects quickly.
- Move secondary information behind expansion instead of showing it by default.
- Reduce cognitive load without breaking current project workflows.

## Findings
- `src/features/projects/ProjectList.jsx` is the main source of visual density.
- The current page includes multiple competing layers: quick filter pills, AI insight banner, search + status + sort + view toggle, rich cards, and expandable details.
- `src/features/delivery/HelpCard.jsx` adds another full-width block above the project list, which is useful for onboarding but not necessary for daily use.
- `src/features/delivery/DeliveryHub.jsx` itself is relatively clean; most simplification should happen in `ProjectList` and possibly by removing the overview help card.

## Proposed Changes
1. **Remove non-essential top content**
   - Remove `HelpCard` from the `overview` tab.
   - Remove `AiInsightBanner`.
   - Remove the extra quick-filter pill section entirely.

2. **Keep only core controls**
   - Keep `Search`.
   - Keep a single `status` filter.
   - Remove `sort` dropdown.
   - Remove `grid/list` toggle and use one default layout only.

3. **Reduce project card density**
   - Default card shows only:
     - project name
     - status
     - owner
     - one primary deadline signal
     - budget summary
     - edit action
   - Hide service/mode badges unless truly required.
   - Hide description and secondary alert chips from default view.

4. **Push secondary info into expansion**
   - Keep expand/collapse for details.
   - Expanded area contains dates, notes, code/ref, team, full budget details, SharePoint, and delete action.
   - Keep milestone timeline only inside expanded state if still needed.

## Suggested Implementation Order
1. Strip overview-level help and insight blocks.
2. Simplify toolbar to search + status only.
3. Lock project list to one layout and remove unused state/logic.
4. Trim project cards to essential information and relocate secondary actions/details into expand.

## Expected UX Result
- Cleaner first screen with one clear scan path.
- Faster decision-making because each card has fewer competing signals.
- Lower maintenance complexity in `ProjectList.jsx` because several UI branches and controls are removed.

## Risk Notes
- Removing help content may reduce onboarding support for new users.
- Removing sort and alternate views may affect power users who rely on them.
- To balance this, secondary detail remains accessible via expand instead of being deleted completely.
