# GitFlow Branching Strategy

This project follows the **GitFlow** branching model for organized and predictable releases. GitFlow provides a robust framework for managing features, releases, and hotfixes.

---

## Branch Overview

```
main ────────●────────────────●────────────────●──────────────▶
             │                │                │
             │    release/1.0 │    release/1.1 │
             │    ┌───●───┐   │    ┌───●───┐   │
develop ─────●────┴───────┴───●────┴───────┴───●──────────────▶
             │                │                │
    feature/quran    feature/prayer    feature/habit
        ┌───●───┐        ┌───●───┐        ┌───●───┐
        └───────┘        └───────┘        └───────┘
```

---

## Branch Types

| Branch | Purpose | Created From | Merges Into |
|--------|---------|--------------|-------------|
| `main` | Production-ready code | - | - |
| `develop` | Integration branch for features | `main` | `release/*`, `main` |
| `feature/*` | New features | `develop` | `develop` |
| `release/*` | Release preparation | `develop` | `main`, `develop` |
| `hotfix/*` | Emergency production fixes | `main` | `main`, `develop` |
| `bugfix/*` | Bug fixes for develop | `develop` | `develop` |

---

## Main Branches

### `main`
- **Purpose**: Always reflects production-ready state
- **Protection**: Protected branch, no direct commits
- **Deployments**: Triggers production deployment
- **Tags**: Every merge is tagged with version number

### `develop`
- **Purpose**: Integration branch for completed features
- **Contains**: Latest delivered development changes
- **Stability**: Should always be in a deployable state
- **Deployments**: Triggers staging/dev deployment

---

## Supporting Branches

### Feature Branches (`feature/*`)

Used for developing new features.

**Naming Convention**:
```
feature/<feature-name>
feature/<issue-number>-<short-description>
```

**Examples**:
```
feature/quran-bookmark
feature/123-prayer-notification
feature/daily-habit-timeline
feature/hydration-tracking
```

**Workflow**:
```bash
# Create feature branch from develop
git checkout develop
git pull origin develop
git checkout -b feature/quran-bookmark

# Work on feature, commit changes
git add .
git commit -m "feat(quran): add bookmark functionality"

# Keep up to date with develop
git fetch origin develop
git rebase origin/develop

# Push and create PR
git push origin feature/quran-bookmark
# Create Pull Request to develop
```

**Rules**:
- ✅ Branch from `develop`
- ✅ Merge back into `develop`
- ✅ Delete after merge
- ❌ Never merge directly to `main`

---

### Release Branches (`release/*`)

Used for preparing a new production release.

**Naming Convention**:
```
release/<version>
```

**Examples**:
```
release/1.0.0
release/1.1.0
release/2.0.0
```

**Workflow**:
```bash
# Create release branch from develop
git checkout develop
git pull origin develop
git checkout -b release/1.0.0

# Bump version, update changelog
# Fix release-specific bugs only

git add .
git commit -m "chore(release): prepare v1.0.0"

# Merge to main
git checkout main
git merge --no-ff release/1.0.0
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin main --tags

# Merge back to develop
git checkout develop
git merge --no-ff release/1.0.0
git push origin develop

# Delete release branch
git branch -d release/1.0.0
git push origin --delete release/1.0.0
```

**Allowed Changes**:
- ✅ Version bumps
- ✅ Changelog updates
- ✅ Minor bug fixes
- ✅ Documentation updates
- ❌ New features

---

### Hotfix Branches (`hotfix/*`)

Used for critical production bug fixes.

**Naming Convention**:
```
hotfix/<version>
hotfix/<issue-number>-<short-description>
```

**Examples**:
```
hotfix/1.0.1
hotfix/456-prayer-time-crash
hotfix/critical-api-fix
```

**Workflow**:
```bash
# Create hotfix branch from main
git checkout main
git pull origin main
git checkout -b hotfix/1.0.1

# Fix the critical bug
git add .
git commit -m "fix(prayer-times): resolve crash on app launch"

# Merge to main
git checkout main
git merge --no-ff hotfix/1.0.1
git tag -a v1.0.1 -m "Hotfix version 1.0.1"
git push origin main --tags

# Merge to develop (or release branch if exists)
git checkout develop
git merge --no-ff hotfix/1.0.1
git push origin develop

# Delete hotfix branch
git branch -d hotfix/1.0.1
git push origin --delete hotfix/1.0.1
```

**Rules**:
- ✅ Branch from `main`
- ✅ Merge to both `main` AND `develop`
- ✅ Increment patch version (1.0.0 → 1.0.1)
- ✅ Deploy immediately after merge

---

### Bugfix Branches (`bugfix/*`)

Used for non-critical bug fixes during development.

**Naming Convention**:
```
bugfix/<issue-number>-<short-description>
bugfix/<short-description>
```

**Examples**:
```
bugfix/789-quran-audio-sync
bugfix/bmi-calculation-error
bugfix/hydration-negative-value
```

**Workflow**:
```bash
# Create bugfix branch from develop
git checkout develop
git pull origin develop
git checkout -b bugfix/789-quran-audio-sync

# Fix the bug
git add .
git commit -m "fix(quran): sync audio with ayah highlight"

# Push and create PR to develop
git push origin bugfix/789-quran-audio-sync
```

---

## Feature-Specific Branch Examples

For this project (Tumbuh Iman), here are typical branch names:

### Quran Module
```
feature/quran-surah-list
feature/quran-ayah-detail
feature/quran-audio-playback
feature/quran-bookmark
feature/quran-reading-calculator
bugfix/quran-translation-display
```

### Prayer Times Module
```
feature/prayer-times-display
feature/prayer-countdown
feature/prayer-notification
feature/qibla-compass
bugfix/prayer-timezone-offset
```

### Daily Habit Module
```
feature/habit-main-page
feature/daily-calories-tracker
feature/hydration-target
feature/bmi-calculator
feature/activity-scheduler
bugfix/calorie-calculation
```

---

## Version Tagging

Follow [Semantic Versioning](https://semver.org/):

```
v<MAJOR>.<MINOR>.<PATCH>
```

| Type | When to Increment | Example |
|------|-------------------|---------|
| MAJOR | Breaking changes | v1.0.0 → v2.0.0 |
| MINOR | New features (backward compatible) | v1.0.0 → v1.1.0 |
| PATCH | Bug fixes (backward compatible) | v1.0.0 → v1.0.1 |

**Tagging Commands**:
```bash
# Create annotated tag
git tag -a v1.0.0 -m "Release version 1.0.0"

# Push tags
git push origin --tags

# List tags
git tag -l

# Delete tag (if needed)
git tag -d v1.0.0
git push origin --delete v1.0.0
```

---

## Pull Request Guidelines

### PR Title Format
Follow [Conventional Commits](./CONVENTIONAL_COMMITS.md):
```
feat(quran): add bookmark functionality
fix(prayer-times): resolve notification timing issue
```

### PR Checklist
- [ ] Branch is up to date with target branch
- [ ] All tests pass
- [ ] Code follows project conventions
- [ ] Documentation updated (if needed)
- [ ] No merge conflicts

### PR Flow
```
feature/* ──PR──▶ develop ──PR──▶ release/* ──PR──▶ main
                                       │
hotfix/* ─────────────────────────────PR──────────▶ main
                                                    │
                                        (also merge to develop)
```

---

## Quick Reference

### Starting New Work
```bash
# New feature
git checkout develop && git pull
git checkout -b feature/my-feature

# Bug fix (non-critical)
git checkout develop && git pull
git checkout -b bugfix/fix-description

# Hotfix (critical)
git checkout main && git pull
git checkout -b hotfix/1.0.1
```

### Finishing Work
```bash
# Feature/Bugfix → Create PR to develop
git push origin feature/my-feature
# Open PR on GitHub

# Release → Merge to main, tag, merge to develop
# Hotfix → Merge to main, tag, merge to develop
```

### Common Commands
```bash
# Update branch with latest develop
git fetch origin develop
git rebase origin/develop

# Resolve conflicts during rebase
git add .
git rebase --continue

# Abort rebase if needed
git rebase --abort
```

---

## Branch Protection Rules (Recommended)

### `main` Branch
- ✅ Require pull request reviews (1-2 reviewers)
- ✅ Require status checks to pass
- ✅ Require branches to be up to date
- ✅ Restrict direct pushes
- ✅ Require signed commits (optional)

### `develop` Branch
- ✅ Require pull request reviews (1 reviewer)
- ✅ Require status checks to pass
- ✅ Restrict direct pushes

---

**See also**:
- [Conventional Commits](./CONVENTIONAL_COMMITS.md) — Commit message guidelines
- [ARCHITECTURE.md](./ARCHITECTURE.md) — Project architecture

**References**:
- [GitFlow Original Article](https://nvie.com/posts/a-successful-git-branching-model/)
- [Semantic Versioning](https://semver.org/)

**Last Updated**: January 28, 2026

