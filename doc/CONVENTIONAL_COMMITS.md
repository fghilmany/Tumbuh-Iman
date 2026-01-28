# Conventional Commits Guide

This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification for commit messages. This leads to more readable messages that are easy to follow when looking through the project history and enables automatic changelog generation.

---

## Commit Message Format

Each commit message consists of a **header**, an optional **body**, and an optional **footer**:

```
<type>(<scope>): <subject>

[optional body]

[optional footer(s)]
```

### Examples

```bash
feat(quran): add surah detail page with ayah list

fix(prayer-times): correct countdown timer calculation

docs(readme): update installation instructions

refactor(daily-habit): extract BMI calculation logic to separate use case

style(ui): format code according to dart guidelines

test(quran): add unit tests for bookmark use case

chore(deps): update flutter_bloc to v8.1.4
```

---

## Types

| Type | Description |
|------|-------------|
| `feat` | A new feature |
| `fix` | A bug fix |
| `docs` | Documentation only changes |
| `style` | Changes that do not affect the meaning of the code (formatting, missing semicolons, etc.) |
| `refactor` | A code change that neither fixes a bug nor adds a feature |
| `perf` | A code change that improves performance |
| `test` | Adding missing tests or correcting existing tests |
| `build` | Changes that affect the build system or external dependencies |
| `ci` | Changes to CI configuration files and scripts |
| `chore` | Other changes that don't modify src or test files |
| `revert` | Reverts a previous commit |

---

## Scopes

Scopes are optional but recommended. Use them to specify which part of the codebase is affected.

### Feature Scopes

| Scope | Description |
|-------|-------------|
| `quran` | Quran module (surah list, ayah detail, bookmarks, calculator) |
| `prayer-times` | Prayer times module (schedules, countdown, notifications) |
| `qibla` | Qibla compass feature |
| `daily-habit` | Daily habit module (activities, timeline) |
| `calories` | Daily calories tracking feature |
| `hydration` | Hydration target feature |
| `bmi` | BMI calculator feature |

### Layer Scopes

| Scope | Description |
|-------|-------------|
| `domain` | Domain layer (entities, repository interfaces) |
| `usecase` | Use case layer |
| `data` | Data layer (repositories, data sources, models) |
| `presentation` | Presentation layer (pages, widgets) |
| `bloc` | BLoC/state management |
| `ui` | Shared UI components |
| `di` | Dependency injection |
| `core` | Core utilities and shared code |

### Other Scopes

| Scope | Description |
|-------|-------------|
| `deps` | Dependencies (pubspec.yaml changes) |
| `config` | Configuration files |
| `android` | Android-specific changes |
| `ios` | iOS-specific changes |
| `readme` | README documentation |

---

## Subject

The subject contains a succinct description of the change:

- Use the imperative, present tense: "add" not "added" nor "adds"
- Don't capitalize the first letter
- No period (.) at the end
- Limit to 50 characters

### Good Examples ✅

```
feat(quran): add bookmark functionality
fix(prayer-times): resolve timezone offset issue
refactor(daily-habit): simplify activity validation logic
```

### Bad Examples ❌

```
feat(quran): Added bookmark functionality.    # Past tense, period, capitalized
fix: fixed bug                                # Vague, past tense
updated stuff                                 # No type, vague
```

---

## Body (Optional)

The body should include the motivation for the change and contrast this with previous behavior:

- Use the imperative, present tense
- Wrap at 72 characters
- Explain **what** and **why** vs. how

```bash
fix(prayer-times): correct countdown timer calculation

The countdown was showing incorrect values when crossing midnight.
This was due to timezone not being considered in the calculation.

The fix ensures UTC time is used for all calculations before
converting to local time for display.
```

---

## Footer (Optional)

The footer is used for:

### Breaking Changes

```bash
feat(api): change prayer times response format

BREAKING CHANGE: The prayer times API now returns times in 24-hour format
instead of 12-hour format. Update all consumers to handle the new format.
```

### Issue References

```bash
fix(quran): resolve audio playback crash on iOS

Fixes #123
Closes #456
```

### GitHub Cards (Co-authors & References)

Use these trailers in the commit footer to link commits with GitHub issues, PRs, and contributors:

#### Link to Issues/PRs

```bash
feat(quran): add bookmark sync feature

Implements bookmark synchronization across devices.

Refs #42
Fixes #123
Closes #456
Part of #789
```

| Keyword | Effect |
|---------|--------|
| `Fixes #123` | Closes issue #123 when merged |
| `Closes #123` | Closes issue #123 when merged |
| `Resolves #123` | Closes issue #123 when merged |
| `Refs #123` | Links to issue #123 (doesn't close) |
| `Part of #123` | Links to issue #123 (doesn't close) |
| `See #123` | Links to issue #123 (doesn't close) |

#### Co-authored Commits

When pair programming or collaborating, add co-author credit:

```bash
feat(prayer-times): add notification scheduling

Implement local notifications for prayer time reminders.

Co-authored-by: Ahmad <ahmad@example.com>
Co-authored-by: Fatimah <fatimah@example.com>
```

> **Note**: Use the contributor's GitHub email to properly link their profile.

#### Reviewed-by / Signed-off-by

```bash
fix(hydration): correct daily target calculation

Reviewed-by: Team Lead <lead@example.com>
Signed-off-by: Developer <dev@example.com>
```

#### Full Example with GitHub Cards

```bash
feat(quran): implement offline audio caching

Add ability to download and cache surah recitations for offline playback.
Uses background download manager with progress tracking.

- Cache audio files in app documents directory
- Show download progress in UI
- Handle download failures gracefully

Fixes #234
Refs #200
Co-authored-by: Ahmad <ahmad@example.com>
```

---

## Breaking Changes

Breaking changes must be indicated by:

1. `!` after the type/scope: `feat(api)!: change response format`
2. Or a `BREAKING CHANGE:` footer

```bash
feat(quran)!: redesign bookmark data structure

BREAKING CHANGE: Bookmarks are now stored with surah and ayah IDs
instead of page numbers. Existing bookmarks will need migration.
```

---

## Commit Examples by Scenario

### Adding a New Feature

```bash
feat(quran): add surah search functionality

Implement search bar in the main Quran page that filters
surahs by name (Arabic and transliteration) and number.
```

### Fixing a Bug

```bash
fix(hydration): prevent negative water intake values

Add validation to reject negative values in the add drink form.
Display error message when user attempts invalid input.

Fixes #89
```

### Refactoring Code

```bash
refactor(daily-habit): extract BMI calculation to use case

Move BMI calculation logic from BLoC to dedicated use case
for better testability and separation of concerns.
```

### Updating Dependencies

```bash
chore(deps): update flutter_bloc to v8.1.4

- Update flutter_bloc from 8.1.3 to 8.1.4
- Update bloc from 8.1.2 to 8.1.3
- Run flutter pub upgrade
```

### Adding Tests

```bash
test(quran): add unit tests for GetSurahList use case

- Test successful surah list retrieval
- Test error handling for network failures
- Test empty list scenario
```

### Documentation Changes

```bash
docs(readme): add installation prerequisites

Add Flutter SDK version requirement and link to
architecture documentation.
```

---

## Git Hooks (Recommended)

Consider using [commitlint](https://commitlint.js.org/) or similar tools to enforce conventional commits:

```bash
# Install commitlint (if using Node.js tooling)
npm install --save-dev @commitlint/cli @commitlint/config-conventional

# Create commitlint.config.js
echo "module.exports = { extends: ['@commitlint/config-conventional'] };" > commitlint.config.js
```

---

## Quick Reference

```
feat:     New feature
fix:      Bug fix
docs:     Documentation
style:    Formatting (no code change)
refactor: Code restructuring
perf:     Performance improvement
test:     Tests
build:    Build system
ci:       CI/CD
chore:    Maintenance
revert:   Revert commit
```

---

**See also**:
- [Conventional Commits Specification](https://www.conventionalcommits.org/)
- [Angular Commit Guidelines](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#commit)

**Last Updated**: January 28, 2026

