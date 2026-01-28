# Tumbuh Iman - Architecture Documentation

## Table of Contents
1. [Overview](#overview)
2. [Architecture Pattern](#architecture-pattern)
3. [Project Structure](#project-structure)
4. [Layer Details](#layer-details)
5. [Dependency Flow](#dependency-flow)
6. [Technology Stack](#technology-stack)
7. [Dependency Injection](#dependency-injection)
8. [Code Generation](#code-generation)
9. [Best Practices](#best-practices)
10. [Implementation Guidelines](#implementation-guidelines)

---

## Overview

**Tumbuh Iman** is a Flutter application built using **Clean Architecture** principles. This architecture ensures:
- **Separation of Concerns**: Each layer has a single responsibility
- **Testability**: Business logic can be tested independently of UI and frameworks
- **Maintainability**: Changes in one layer don't affect others
- **Scalability**: Easy to add new features without breaking existing code
- **Independence**: Core business logic is independent of frameworks and external libraries

---

## Architecture Pattern

This project follows **Clean Architecture** with additional **BLoC** pattern for state management, organized into the following layers:

```
┌─────────────────────────────────────────────────────────┐
│                  PRESENTATION LAYER                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐ │
│  │   Pages      │  │   Widgets    │  │   BLoC/Cubit │ │
│  └──────────────┘  └──────────────┘  └──────────────┘ │
│  • UI Components      • Reusable UI     • State Mgmt   │
│  • Screens            • Custom Widgets  • Events/States│
└────────────────────────┬────────────────────────────────┘
                         │ depends on ↓
┌────────────────────────┴────────────────────────────────┐
│                    USECASE LAYER                        │
│  ┌──────────────────────────────────────────────────┐  │
│  │              Business Use Cases                  │  │
│  │  • GetUserProfile                                │  │
│  │  • SaveUserData                                  │  │
│  │  • Specific business operations                  │  │
│  └──────────────────────────────────────────────────┘  │
└────────────────────────┬────────────────────────────────┘
                         │ depends on ↓
┌────────────────────────┴────────────────────────────────┐
│                     DOMAIN LAYER                        │
│  ┌────────────────┐  ┌────────────────┐                │
│  │   Entities     │  │  Repositories  │                │
│  │                │  │  (Interfaces)  │                │
│  └────────────────┘  └────────────────┘                │
│  • Business Models    • Abstract Contracts              │
│  • Pure Dart Objects  • No Implementation               │
│  • No Dependencies    • Dependency Inversion            │
└────────────────────────┬────────────────────────────────┘
                         │ implemented by ↑
┌────────────────────────┴────────────────────────────────┐
│                      DATA LAYER                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐ │
│  │ Repositories │  │ Data Sources │  │    Models    │ │
│  │ (Implements) │  │              │  │              │ │
│  └──────────────┘  └──────────────┘  └──────────────┘ │
│  • Repo Impl      • Remote (API)     • JSON Mapping   │
│  • Data Handling  • Local (DB/Cache) • Serialization  │
└────────────────────────┬────────────────────────────────┘
                         │ uses ↓
┌────────────────────────┴────────────────────────────────┐
│                     ADAPTERS LAYER                      │
│  ┌──────────────────────────────────────────────────┐  │
│  │        External Service Adapters                 │  │
│  │  • API Clients (Retrofit)                        │  │
│  │  • Database Adapters (Drift)                     │  │
│  │  • Third-party Service Wrappers                  │  │
│  └──────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│                      CORE LAYER                         │
│  • Dependency Injection (GetIt + Injectable)            │
│  • Constants, Extensions, Utils                         │
│  • Error Handling, Exceptions                           │
│  • Shared across all layers                             │
└─────────────────────────────────────────────────────────┘
```

---

## Project Structure

```
lib/
├── main.dart                           # Application entry point
│
├── core/                               # Core utilities & shared code
│   └── (planned: constants, utils, exceptions, Result<T>)
│
├── di/                                 # Dependency Injection
│   ├── injection.dart                 # DI setup (GetIt + Injectable)
│   ├── injection.config.dart          # Generated DI config
│   └── module/                        # Feature-specific DI modules
│       ├── daily_habit_module.dart    # Daily Habit dependencies
│       ├── prayer_times_module.dart   # Prayer Times dependencies
│       └── quran_module.dart          # Quran dependencies
│
├── domain/                            # Domain Layer (Business Logic)
│   └── <feature>/
│       ├── entities/                  # Business entities (pure Dart)
│       └── repositories/              # Repository interfaces (contracts)
│
├── usecase/                           # Use Case Layer (Application Logic)
│   └── <feature>/
│       └── <use_case>.dart            # Specific business operations
│
├── data/                              # Data Layer (Implementation)
│   └── <feature>/
│       ├── models/                    # JSON serializable DTOs
│       ├── datasources/               # Remote/Local data sources
│       └── repositories/              # Repository implementations
│
├── presentation/                      # Presentation Layer (UI + State)
│   └── <feature>/
│       ├── bloc/                      # BLoC/Cubit state management
│       ├── pages/                     # Screen widgets
│       └── widgets/                   # Feature-specific widgets
│
└── ui/                                # Shared UI components
    └── (planned: common widgets, themes, routing)
```

> **Note**: Most feature folders (`domain/`, `data/`, `usecase/`, `presentation/`, `ui/`) are currently placeholders awaiting implementation. The DI setup is complete and ready to register new dependencies.

---

## Layer Details

### 1. **Domain Layer** (`/lib/domain/`)

**Purpose**: Contains pure business logic and rules. This is the heart of the application.

**Components**:
- **Entities**: Pure Dart objects representing business concepts
  ```dart
  // Example: lib/domain/entities/user.dart
  class User {
    final String id;
    final String name;
    final String email;
    
    User({required this.id, required this.name, required this.email});
  }
  ```

- **Repository Interfaces**: Abstract contracts for data operations
  ```dart
  // Example: lib/domain/repositories/user_repository.dart
  abstract class UserRepository {
    Future<Either<Failure, User>> getUserProfile(String id);
    Future<Either<Failure, void>> updateUser(User user);
  }
  ```

- **Failures**: Domain-specific errors
  ```dart
  // Example: lib/domain/failures/failure.dart
  abstract class Failure {
    final String message;
    Failure(this.message);
  }
  
  class ServerFailure extends Failure {
    ServerFailure(super.message);
  }
  ```

**Rules**:
- ✅ No external dependencies (Flutter, Dio, etc.)
- ✅ Only pure Dart code
- ✅ No implementation details
- ❌ Cannot depend on other layers

---

### 2. **UseCase Layer** (`/lib/usecase/`)

**Purpose**: Contains application-specific business rules and orchestrates the flow of data.

**Structure**:
```dart
// Example: lib/usecase/user/get_user_profile.dart
@injectable
class GetUserProfile {
  final UserRepository repository;
  
  GetUserProfile(this.repository);
  
  Future<Either<Failure, User>> call(String userId) async {
    return await repository.getUserProfile(userId);
  }
}
```

**Characteristics**:
- One use case per business operation
- Depends on repository interfaces (from domain)
- Can combine multiple repositories
- Testable without UI or database

**Naming Convention**: Use verb phrases (e.g., `GetUserProfile`, `SaveUserData`, `DeleteAccount`)

---

### 3. **Data Layer** (`/lib/data/`)

**Purpose**: Implements data fetching and storage logic. Provides concrete implementations of repositories.

**Components**:

- **Models**: Data transfer objects with JSON serialization
  ```dart
  // Example: lib/data/models/user_model.dart
  @freezed
  class UserModel with _$UserModel {
    const factory UserModel({
      required String id,
      required String name,
      required String email,
    }) = _UserModel;
    
    factory UserModel.fromJson(Map<String, dynamic> json) => 
        _$UserModelFromJson(json);
  }
  
  // Extension to convert to entity
  extension UserModelX on UserModel {
    User toEntity() => User(id: id, name: name, email: email);
  }
  ```

- **Repository Implementations**: Concrete implementations of domain repositories
  ```dart
  // Example: lib/data/repositories/user_repository_impl.dart
  @LazySingleton(as: UserRepository)
  class UserRepositoryImpl implements UserRepository {
    final UserRemoteDataSource remoteDataSource;
    final UserLocalDataSource localDataSource;
    
    UserRepositoryImpl(this.remoteDataSource, this.localDataSource);
    
    @override
    Future<Either<Failure, User>> getUserProfile(String id) async {
      try {
        final userModel = await remoteDataSource.getUser(id);
        await localDataSource.cacheUser(userModel);
        return Right(userModel.toEntity());
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
  ```

- **Data Sources**:
  - **Remote**: API calls using Dio/Retrofit
  - **Local**: Database operations using Drift or shared preferences

---

### 4. **Adapters Layer** (`/lib/adapters/`)

**Purpose**: Adapts external services and libraries to be used by the data layer.

**Components**:

- **API Clients**: Retrofit interfaces for API calls
  ```dart
  // Example: lib/adapters/api/user_api_client.dart
  @RestApi(baseUrl: "https://api.example.com")
  abstract class UserApiClient {
    factory UserApiClient(Dio dio, {String baseUrl}) = _UserApiClient;
    
    @GET("/users/{id}")
    Future<UserModel> getUser(@Path("id") String id);
    
    @PUT("/users/{id}")
    Future<void> updateUser(@Path("id") String id, @Body() UserModel user);
  }
  ```

- **Database Adapters**: Drift tables and DAOs
  ```dart
  // Example: lib/adapters/database/app_database.dart
  @DriftDatabase(tables: [Users])
  class AppDatabase extends _$AppDatabase {
    AppDatabase() : super(_openConnection());
    
    @override
    int get schemaVersion => 1;
  }
  ```

---

### 5. **Presentation Layer** (`/lib/presentation/`)

**Purpose**: Handles UI and user interactions. Uses BLoC pattern for state management.

**Components**:

- **Pages**: Full-screen widgets/routes
- **Widgets**: Reusable UI components
- **BLoC/Cubit**: State management logic

**Example BLoC Structure**:
```dart
// lib/presentation/bloc/user/user_event.dart
abstract class UserEvent extends Equatable {}

class LoadUserProfile extends UserEvent {
  final String userId;
  LoadUserProfile(this.userId);
  
  @override
  List<Object> get props => [userId];
}

// lib/presentation/bloc/user/user_state.dart
abstract class UserState extends Equatable {}

class UserInitial extends UserState {}
class UserLoading extends UserState {}
class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
  
  @override
  List<Object> get props => [user];
}
class UserError extends UserState {
  final String message;
  UserError(this.message);
  
  @override
  List<Object> get props => [message];
}

// lib/presentation/bloc/user/user_bloc.dart
@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserProfile getUserProfile;
  
  UserBloc(this.getUserProfile) : super(UserInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
  }
  
  Future<void> _onLoadUserProfile(
    LoadUserProfile event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    final result = await getUserProfile(event.userId);
    
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (user) => emit(UserLoaded(user)),
    );
  }
}
```

---

### 6. **Core Layer** (`/lib/core/`)

**Purpose**: Shared utilities, constants, and dependency injection setup.

**Components**:
- **Dependency Injection**: GetIt + Injectable configuration
- **Constants**: App-wide constants
- **Extensions**: Dart extensions
- **Utils**: Helper functions
- **Error Handling**: Global error types

---

## Dependency Flow

```
Dependency Direction: Outer → Inner (toward Domain)

Presentation → UseCase → Domain ← Data ← Adapters
                  ↑                  ↓
            Core supports all     Implements
```

**Key Rules**:
1. **Inner layers never depend on outer layers**
2. **Domain layer has zero external dependencies**
3. **Dependencies point inward** (Dependency Inversion Principle)
4. **Outer layers depend on interfaces**, not implementations

---

## Technology Stack

### Core Technologies
- **Flutter**: UI Framework (SDK ^3.10.7)
- **Dart**: Programming Language

### State Management
- **flutter_bloc**: ^8.1.3 - BLoC pattern implementation
- **equatable**: ^2.0.5 - Value equality for states/events

### Networking
- **dio**: ^5.4.0 - HTTP client
- **retrofit**: ^4.9.0 - Type-safe REST client
- **json_annotation**: ^4.9.0 - JSON serialization annotations

### Dependency Injection
- **get_it**: ^7.6.7 - Service locator
- **injectable**: ^2.3.2 - Code generation for DI

### Local Storage
- **drift**: ^2.14.0 - Type-safe SQLite wrapper
- **sqlite3_flutter_libs**: ^0.5.0 - SQLite libraries
- **path_provider**: ^2.1.5 - File system paths

### Navigation
- **go_router**: ^13.0.0 - Declarative routing

### Code Generation
- **freezed**: ^3.0.0 - Immutable classes and unions
- **build_runner**: ^2.6.0 - Code generation runner
- **retrofit_generator**: ^10.2.1 - Retrofit code generation
- **json_serializable**: ^6.10.0 - JSON serialization
- **injectable_generator**: ^2.4.1 - DI code generation
- **drift_dev**: ^2.14.0 - Drift code generation

---

## Dependency Injection

### Setup

The project uses **GetIt** with **Injectable** for automatic dependency injection.

**Configuration File**: `lib/di/injection.dart`
```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
```

**Feature Module Registration**: `lib/di/module/<feature>_module.dart`

Each feature has its own DI module for third-party or feature-specific dependencies:
- `lib/di/module/daily_habit_module.dart`
- `lib/di/module/prayer_times_module.dart`
- `lib/di/module/quran_module.dart`

```dart
// Example: lib/di/module/prayer_times_module.dart
import 'package:injectable/injectable.dart';

@module
abstract class PrayerTimesModule {
  // Define Prayer Times-specific third-party dependencies here
  // @lazySingleton
  // SomePrayerApiClient prayerClient(Dio dio) => SomePrayerApiClient(dio);
}
```

### Registration Annotations

- `@injectable` - Auto-register with default scope
- `@singleton` - Single instance for app lifetime
- `@lazySingleton` - Single instance, created on first use
- `@module` - Register third-party dependencies

### Usage in Main

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(); // Initialize DI
  runApp(const MyApp());
}
```

### Getting Dependencies

```dart
// In any class
final userBloc = getIt<UserBloc>();

// Or inject via constructor
@injectable
class SomeService {
  final UserRepository repository;
  SomeService(this.repository); // Auto-injected
}
```

---

## Code Generation

### Commands

Run these commands when you add/modify:
- Models with `@freezed` or `@JsonSerializable`
- API clients with `@RestApi`
- Dependencies with `@injectable`
- Drift database tables

```bash
# Generate all code
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate on changes)
flutter pub run build_runner watch --delete-conflicting-outputs

# Clean generated files
flutter pub run build_runner clean
```

---

## Best Practices

### 1. **Layer Isolation**
- ✅ Each layer should be independent
- ✅ Use interfaces for communication between layers
- ❌ Never import presentation code in domain layer
- ❌ Never skip layers (e.g., Page → Repository directly)

### 2. **Error Handling**
- Use `Either<Failure, Success>` pattern (from `dartz` or custom)
- Define domain-specific failures
- Handle errors at the presentation layer

### 3. **Testing Strategy**
```
Domain Layer:    Unit tests (pure logic)
UseCase Layer:   Unit tests with mocked repositories
Data Layer:      Unit tests with mocked data sources
Presentation:    Widget tests and BLoC tests
```

### 4. **Naming Conventions**
- **Entities**: Noun (e.g., `User`, `Product`)
- **UseCases**: Verb phrase (e.g., `GetUser`, `SaveProduct`)
- **Repositories**: Noun + Repository (e.g., `UserRepository`)
- **BLoCs**: Noun + Bloc (e.g., `UserBloc`)
- **Events**: Verb phrase (e.g., `LoadUser`, `UpdateProfile`)
- **States**: Noun + State (e.g., `UserLoaded`, `UserError`)

### 5. **File Organization**
- One class per file
- File name matches class name (snake_case)
- Group related files in folders

---

## Implementation Guidelines

### Adding a New Feature

Follow this workflow (example feature: `product`):

#### Step 1: Define Domain Layer
```dart
// 1. Create entity: lib/domain/product/entities/product.dart
class Product {
  final String id;
  final String name;
  final double price;
  
  Product({required this.id, required this.name, required this.price});
}

// 2. Create repository interface: lib/domain/product/repositories/product_repository.dart
abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProductById(String id);
}
```

#### Step 2: Create Use Case
```dart
// lib/usecase/product/get_products.dart
@injectable
class GetProducts {
  final ProductRepository repository;
  
  GetProducts(this.repository);
  
  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getProducts();
  }
}
```

#### Step 3: Implement Data Layer
```dart
// 1. Create model: lib/data/product/models/product_model.dart
@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required double price,
  }) = _ProductModel;
  
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

extension ProductModelX on ProductModel {
  Product toEntity() => Product(id: id, name: name, price: price);
}

// 2. Implement repository: lib/data/product/repositories/product_repository_impl.dart
@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  
  ProductRepositoryImpl(this.remoteDataSource);
  
  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      return Right(products.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

// 3. Create data source: lib/data/product/datasources/product_remote_datasource.dart
@injectable
class ProductRemoteDataSource {
  final ProductApiClient apiClient;
  
  ProductRemoteDataSource(this.apiClient);
  
  Future<List<ProductModel>> getProducts() async {
    return await apiClient.getProducts();
  }
}
```

#### Step 4: Create API Client (in Data Layer)
```dart
// lib/data/product/api/product_api_client.dart
@RestApi()
abstract class ProductApiClient {
  factory ProductApiClient(Dio dio) = _ProductApiClient;
  
  @GET("/products")
  Future<List<ProductModel>> getProducts();
}
```

#### Step 5: Implement Presentation
```dart
// 1. Create BLoC events: lib/presentation/product/bloc/product_event.dart
abstract class ProductEvent extends Equatable {}

class LoadProducts extends ProductEvent {
  @override
  List<Object> get props => [];
}

// 2. Create BLoC states: lib/presentation/product/bloc/product_state.dart
abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
  
  @override
  List<Object> get props => [products];
}

// 3. Create BLoC: lib/presentation/product/bloc/product_bloc.dart
@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  
  ProductBloc(this.getProducts) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }
  
  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    final result = await getProducts();
    
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductLoaded(products)),
    );
  }
}

// 4. Create page: lib/presentation/product/pages/product_page.dart
class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductBloc>()..add(LoadProducts()),
      child: Scaffold(
        appBar: AppBar(title: Text('Products')),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProductLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price}'),
                  );
                },
              );
            }
            return Center(child: Text('Error loading products'));
          },
        ),
      ),
    );
  }
}
```

#### Step 6: Generate Code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

#### Step 7: Test
- Write unit tests for use cases
- Write tests for BLoC
- Write widget tests for UI

---

## Summary

This architecture provides:
- ✅ **Clear separation** between business logic and UI
- ✅ **Testable code** at every layer
- ✅ **Easy to maintain** and extend
- ✅ **Independent** of frameworks and external services
- ✅ **Scalable** for large applications
- ✅ **Type-safe** with code generation
- ✅ **Consistent** structure across features

By following these guidelines, the Tumbuh Iman project maintains a clean, professional, and maintainable codebase.

---

**Last Updated**: January 28, 2026

