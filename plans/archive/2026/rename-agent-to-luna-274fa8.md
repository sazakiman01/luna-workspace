# Plan: Rename Sansakrit Agent to Luna

This plan outlines the steps to rename the "Sansakrit Agent" to "Luna" while maintaining all existing functionality and content.

## Changes Required

### 1. Update Directory Name
- Rename `skill\sansakrit-agent\` to `skill\luna\`

### 2. Update File Contents
- **SKILL.md**: Change `name: sansakrit-agent` to `name: luna`
- **README.md**: Update all references from "Sansakrit Agent" to "Luna"
- **Template files**: Update agent name references
- **Reference files**: Update mentorship guide and other documents

### 3. Update Usage Examples
- Change `@sansakrit-agent` to `@luna` in all examples
- Update command examples throughout documentation

### 4. Maintain Metadata
- Keep `reviewer: Sansakrit Sukhapirom` unchanged
- Keep all other metadata the same
- Preserve version and compatibility information

### 5. Verify References
- Ensure all internal links work after rename
- Check that file references are correct
- Test that the agent can be invoked with new name

## Files to Modify
1. `skill\sansakrit-agent\SKILL.md` - Agent name and metadata
2. `skill\sansakrit-agent\README.md` - Title and references
3. `skill\sansakrit-agent\assets\agent-report-template.md` - Agent name
4. `skill\sansakrit-agent\assets\code-review-template.md` - Agent name
5. `skill\sansakrit-agent\references\frontend-checklist.md` - References
6. `skill\sansakrit-agent\references\skill-standards.md` - References
7. `skill\sansakrit-agent\references\mentorship-guide.md` - References

## Expected Outcome
- Agent can be invoked with `@luna` command
- All functionality remains identical
- Documentation reflects new name consistently
- No broken references or links
