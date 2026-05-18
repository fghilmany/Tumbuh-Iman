# Slicing Rules

## What is a Slice
A slice is one piece of a feature that:
- Is small enough to build in **1 day**
- Delivers something a user can actually see or use
- Has a clear start and end
- Can be built, tested, and reviewed independently

---

## Core Rules

### 1. One slice = one user story
Each slice maps to exactly one user story.
Never combine two user actions into one slice.

### 2. Maximum 1 day of work
If a slice feels bigger than 1 day, break it down further.
When in doubt, make it smaller.

### 3. Each slice must deliver visible user value
No purely technical slices unless marked as **[Enabler]**.
Example of wrong slice: "Set up data layer for prayer times"
Example of right slice: "Show today's prayer times on screen"

### 4. No horizontal slicing by layer only
Do not create slices like:
- "Build the repository for prayer times"
- "Build the BLoC for prayer times"

These are not slices. They are tasks inside a slice.
A slice cuts vertically through all layers for one user outcome.

### 5. Every slice must include all states
Each slice is not done unless it handles:
- Loading state
- Success state
- Error state
- Empty state (if applicable)

### 6. Identify dependencies before writing the slice
If a slice depends on another slice, mark it clearly.
Never start a slice that has an unfinished dependency.

---

## Architecture Alignment Rules

Each slice must respect the architecture defined in `doc/ARCHITECTURE.md`.

Before writing a slice, always check:
- Which layer does this slice touch?
- Does the domain layer stay free of Flutter/external dependencies?
- Is there a repository interface needed in the domain layer?
- Is the use case clearly defined?
- Does the BLoC only talk to the use case, not the repository directly?

If a slice violates any of these — flag it before proceeding.

---

## Slice Checklist

Before finalizing a slice, verify:
- [ ] Delivers visible user value
- [ ] Fits within 1 day
- [ ] Cuts vertically through all layers
- [ ] Handles loading, success, error, empty states
- [ ] Dependencies are identified
- [ ] Does not violate architecture rules
- [ ] Has clear acceptance criteria

---

## Example

**Feature**: Prayer Times

| Slice | Valid? | Reason |
|---|---|---|
| Build prayer times feature | ❌ | Too big |
| Set up repository for prayer times | ❌ | Horizontal, no user value |
| Show today's prayer times on screen | ✅ | Visible value, 1 day, vertical |
| Notify user 10 minutes before prayer | ✅ | Visible value, 1 day, vertical |
| Allow user to change calculation method | ✅ | Visible value, 1 day, vertical |
| Show prayer times for a selected city | ✅ | Visible value, 1 day, vertical |
