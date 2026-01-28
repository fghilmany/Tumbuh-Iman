# Tumbuh Iman — Clean Architecture (project-specific)

This document maps the Clean Architecture principles to the actual structure and files in this repository. It focuses on what currently exists under `lib/` and gives a short, concrete checklist for adding features and registering dependencies.

## 1. Quick summary

- The project follows Clean Architecture concepts (separation of layers, dependency inversion) and uses `injectable` + `get_it` for dependency injection.
- Current code in `lib/` is lightweight: an app entry (`main.dart`) and a DI bootstrap (`lib/di/*`) with module stubs. Most domain/application/infrastructure code folders are present as placeholders and should be populated per feature.

## 2. What currently exists in `lib/` (key files)

- `lib/main.dart` — Flutter app entry point. Calls `configureDependencies()` and starts the app.
- `lib/di/injection.dart` — `GetIt` + `injectable` bootstrap. Exposes `configureDependencies()`.
- `lib/di/injection.config.dart` — Generated injector (currently minimal/generated).
- `lib/di/module/*.dart` — Module stubs for feature-specific third-party dependencies:
  - `lib/di/module/prayer_times_module.dart`
  - `lib/di/module/quran_module.dart`
  - `lib/di/module/daily_habit_module.dart`

Note: Many folders are present (e.g., `lib/core`, `lib/domain`, `lib/presentation`, `lib/data`, `lib/ui`, `lib/usecase`) but currently lack committed Dart files. Treat those as the intended layer folders.

## 3. Layer mapping (how project folders map to Clean Architecture)

- Presentation
  - Where: `lib/` (pages/widgets live under `lib/presentation/` or `lib/ui/`) — currently empty.
  - Responsibility: UI, routing, widgets.

- Presentation adapters (BLoC / Providers)
  - Where: `lib/infrastructure/presentation_adapters/` or `lib/presentation_adapters/` (convention).
  - Responsibility: Translate UI events to use-case calls and emit UI states.

- Application (UseCases)
  - Where: `lib/usecase/` or `lib/application/usecases/` (convention).
  - Responsibility: Orchestrate business flows, call repository interfaces.

- Domain
  - Where: `lib/domain/` (entities, repository contracts).
  - Responsibility: Pure business entities, interfaces, value objects.

- Infrastructure (Data adapters, Repositories)
  - Where: `lib/data/` or `lib/infrastructure/`.
  - Responsibility: Data sources (remote/local), repository implementations, DTO → Entity mapping.

- Core / Shared
  - Where: `lib/core/`.
  - Responsibility: Constants, utils, exceptions, Result<T>.

- Dependency Injection
  - Where: `lib/di/` (actual implementation in this repo). `configureDependencies()` in `main.dart` boots `GetIt`.

## 4. Dependency flow in this project

- Rule followed: inner layers are independent and outer layers depend on abstractions (Domain defines repository interfaces).
- DI wiring: `lib/di/injection.dart` uses `@InjectableInit` and calls generated `init()` from `injection.config.dart`. Concrete implementations (when added) should be annotated with `@Injectable()` or `@module` so `injectable` generates registrations.
- App bootstrap: `main.dart` calls `configureDependencies()` before `runApp()` — this ensures services are available via `GetIt.instance` throughout the app.

## 5. How to add a new feature (concrete checklist)

Follow this concrete file-and-registration checklist for a new feature (example feature: `prayers`):

1. Domain
   - Add entity: `lib/domain/prayers/entities/prayer_entity.dart`
   - Add repository interface: `lib/domain/prayers/repositories/prayer_repository.dart`

2. Application / UseCase
   - Add use case(s): `lib/usecase/prayers/get_prayers_usecase.dart`

3. Infrastructure / Data
   - Add DTOs & models: `lib/data/prayers/models/*`
   - Add data sources: `lib/data/prayers/datasources/prayer_remote_datasource.dart`
   - Add repository implementation: `lib/data/prayers/repositories/prayer_repository_impl.dart`

4. Presentation adapters
   - Add BLoC/Provider: `lib/presentation/prayers/bloc/prayer_bloc.dart` (or provider/riverpod files)

5. Presentation (UI)
   - Add page/widget: `lib/presentation/prayers/prayers_page.dart` and widgets under `lib/presentation/prayers/widgets/`

6. DI registration
   - Annotate concrete classes with `@Injectable()` (or create `@module` providers), then run the codegen: `flutter pub run build_runner build --delete-conflicting-outputs` to update `lib/di/injection.config.dart`.
   - Ensure `main.dart` calls `configureDependencies()` (already present).

7. Tests
   - Add unit tests: `test/domain/prayers/*`, `test/usecase/prayers/*`, `test/presentation/prayers/*`.

## 6. Notes on patterns used / expected

- Dependency Injection: `get_it` + `injectable` (seeded via `lib/di/*`).
- Result<T> pattern, Decorators, Composite: the current repo doc references these patterns as recommended; implement them in `lib/core/` and `lib/data/` as needed.

## 7. Minimal examples / conventions (recommended)

- Repositories live in `lib/domain/...` (interfaces) and `lib/data/...` (implementations).
- UseCases live in `lib/usecase/` with short, focused classes (one use case per file).
- Annotate implementations with `@LazySingleton()` / `@Singleton()` / `@Injectable()` to control lifetime.

## 8. Suggested low-risk documentation improvements

1. Add a short README per major folder (`lib/domain/README.md`, `lib/data/README.md`) explaining responsibilities and naming conventions.
2. Add a small feature scaffold (template files) under `tools/` or `doc/templates/feature_scaffold.md` that shows the exact paths from section 5.
3. Add a CI step that runs `flutter analyze` and `flutter test` and a `build_runner` job for injector generation.

## 9. Appendix — exact files read to produce this mapping

- lib/main.dart
- lib/di/injection.dart
- lib/di/injection.config.dart
- lib/di/module/prayer_times_module.dart
- lib/di/module/quran_module.dart
- lib/di/module/daily_habit_module.dart

---

**See also**:
- [ARCHITECTURE.md](./ARCHITECTURE.md) — Full architecture documentation with examples
- [clean_architecture.md](./clean_architecture.md) — General Clean Architecture concepts

**Last Updated**: January 28, 2026
