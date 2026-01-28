# Clean Architecture Recap

Clean Architecture is a software design philosophy that separates the software solutions into layers. This separation aids in managing complexity and enhances maintainability. Here's a recap of the core principles and components of Clean Architecture:

## Core Principles
1. **Dependency Rule**: Depend on abstractions, not concretions. In other words, the inner layers of the architecture should not depend on the outer layers.
2. **Separation of Concerns**: Different aspects of the software should be managed separately. This helps to isolate changes and maintain a clean codebase.
3. **Independence**: Business rules should remain independent of frameworks, UI, and databases. This enhances testability and flexibility.

## Layers of Clean Architecture

### 1. Domain Layer (Entities)
- Represents the business logic and rules of the system.
- Contains the essential data and methods that represent the business's core functionality.
- **In this project**: `lib/domain/<feature>/entities/` and `lib/domain/<feature>/repositories/` (interfaces)

### 2. Application Layer (Use Cases)
- Contains application-specific business rules.
- Defines what the application can do and how different entities will interact with them.
- **In this project**: `lib/usecase/<feature>/`

### 3. Interface Adapters Layer
- Adapts data between the Use Cases layer and the external interfaces (UI, Database, etc.).
- Contains controllers, presenters, and gateways.
- **In this project**: 
  - Presentation adapters (BLoC/Cubit): `lib/presentation/<feature>/bloc/`
  - Data adapters (Repository implementations): `lib/data/<feature>/repositories/`

### 4. Frameworks and Drivers Layer
- Contains everything that is external to the application.
- This includes the UI, database, frameworks, and any external systems the application interacts with.
- **In this project**:
  - UI/Widgets: `lib/presentation/<feature>/pages/` and `lib/ui/`
  - Data sources: `lib/data/<feature>/datasources/`
  - DI/External config: `lib/di/`

## Benefits of Clean Architecture
- **Testability**: Each layer can be tested independently.
- **Maintainability**: Changes in external components have minimal impact on the core business logic.
- **Flexibility**: Can easily switch frameworks or technologies without major changes to the application.

## How This Project Applies Clean Architecture

| Layer | Folder | Contents |
|-------|--------|----------|
| Domain | `lib/domain/` | Entities, Repository interfaces |
| Application | `lib/usecase/` | Use case classes |
| Interface Adapters | `lib/presentation/*/bloc/`, `lib/data/*/repositories/` | BLoCs, Repository implementations |
| Frameworks/Drivers | `lib/presentation/*/pages/`, `lib/data/*/datasources/`, `lib/di/` | UI, Data sources, DI modules |
| Core/Shared | `lib/core/` | Utils, constants, exceptions |

## Dependency Injection in This Project

- Uses `get_it` + `injectable` for service location and DI
- Configuration: `lib/di/injection.dart`
- Feature modules: `lib/di/module/*.dart` (e.g., `prayer_times_module.dart`, `quran_module.dart`, `daily_habit_module.dart`)

## Conclusion
Implementing Clean Architecture can significantly enhance the quality and structure of software development projects. By adhering to these principles, developers can create systems that are robust, scalable, and easy to maintain.

---

**See also**: [ARCHITECTURE.md](./ARCHITECTURE.md) for detailed implementation guidelines and examples.

**Last Updated**: January 28, 2026
