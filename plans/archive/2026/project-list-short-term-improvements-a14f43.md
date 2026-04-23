# ProjectList Short-term Improvements

This plan implements three key improvements to the Projects section: language consistency fixes, loading states with skeleton UI, and enhanced error handling for milestone updates.

## 1. Language Consistency Fixes

### Current Thai Text to Convert
- `getRelativeDay()` function (lines 32-36): "เลย X วัน", "วันนี้", "พรุ่งนี้", "X วัน"
- `MilestoneTimeline` labels (line 75): "เสร็จ"
- Toast messages (lines 121, 125): "เสร็จ/เปิดใหม่", "ไม่สามารถอัปเดต milestone ได้"
- Empty state (lines 325-335): "ไม่พบโปรเจคตามเงื่อนไข", "ลองปรับคำค้นหา...", "ขั้นตอนเริ่มต้น"

### English Replacements
- Relative days: "X days overdue", "Today", "Tomorrow", "In X days"
- Milestone: "Done"
- Toast: "completed/reopened", "Failed to update milestone"
- Empty state: "No projects found", "Try adjusting search...", "Getting started:"

## 2. Loading States Implementation

### When to Show Loading
1. **Initial Load**: When `projects.length === 0` and not empty state
2. **Milestone Updates**: During `handleMilestoneComplete` async operation

### Skeleton Design
- **Skeleton rows** matching table structure
- 3-5 placeholder rows with shimmer animation
- Preserve table layout and column widths
- Use Tailwind's `animate-pulse` for smooth effect

### Implementation Approach
```javascript
const [isLoading, setIsLoading] = useState(false);
const [updatingMilestone, setUpdatingMilestone] = useState(null);

// Skeleton component matching table structure
const ProjectSkeleton = () => (
  <div className="space-y-2">
    {[1,2,3].map(i => (
      <div key={i} className="animate-pulse">
        <div className="h-16 bg-slate-200 rounded-lg" />
      </div>
    ))}
  </div>
);
```

## 3. Error Boundaries & Enhanced Error Handling

### Current Error Points
- `handleMilestoneComplete` API calls
- Date formatting errors
- Missing project data

### Improvements
1. **Try-catch Enhancement**: More specific error messages
2. **User-friendly Errors**: Convert technical errors to actionable messages
3. **Fallback UI**: Show error state without breaking the entire component
4. **Retry Mechanism**: Allow users to retry failed milestone updates

### Error Message Strategy
```javascript
const errorMessages = {
  network: "Connection error. Please check your internet.",
  permission: "You don't have permission to update this milestone.",
  timeout: "Request timed out. Please try again.",
  unknown: "Something went wrong. Please try again."
};
```

## Implementation Order

### Phase 1: Language Consistency (30 mins)
- Update `getRelativeDay()` function
- Fix milestone labels
- Convert toast messages
- Update empty state text

### Phase 2: Loading States (45 mins)
- Add loading state management
- Create skeleton component
- Implement initial load skeleton
- Add milestone update loading

### Phase 3: Error Handling (30 mins)
- Enhance try-catch blocks
- Add error message mapping
- Implement retry mechanism
- Test error scenarios

## Testing Strategy

### Language Tests
- Verify all English text displays correctly
- Check date formatting edge cases
- Test empty state messages

### Loading Tests
- Verify skeleton appears during initial load
- Test milestone update loading states
- Check loading state timing

### Error Tests
- Simulate network errors
- Test permission errors
- Verify retry functionality
- Check error message clarity

## Expected Outcomes

After implementation:
- **100% English UI** consistency across Projects section
- **Smooth loading experience** with visual feedback
- **Robust error handling** with user-friendly messages
- **Improved perceived performance** through loading states
- **Better user confidence** during operations

## Files to Modify

1. `src/features/projects/ProjectList.jsx` - Main implementation
2. No additional files needed - all improvements contained within component

## Estimated Timeline

**Total: 1.5-2 hours**
- Phase 1: 30 minutes
- Phase 2: 45 minutes  
- Phase 3: 30 minutes
- Testing & Refinement: 15-30 minutes
