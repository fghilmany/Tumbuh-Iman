# Tumbuh Iman

**Iman dan Amal dalam Satu Aplikasi**

A Flutter application designed to help Muslims grow their faith (iman) and practice (amal) through integrated Islamic lifestyle features.

---

## Features

### 1. 📖 Quran Module

A comprehensive Quran reading experience with audio recitation and progress tracking.

**Features:**
- **Main Quran Page**
  - Next prayer times with countdown display
  - Quick access buttons: "Last Read" and "Bookmarks"
  - Complete list of surahs for easy navigation
  - Floating Action Button (FAB) for Quran reading calculator
  
- **Surah Detail Page**
  - Surah name and total ayahs displayed
  - List of ayahs with translations
  - Audio playback button for each ayah
  - Bookmark functionality via FAB
  
- **Quran Reading Calculator**
  - Set reading goals (duration, daily targets)
  - Clear calculation results with meaningful breakdown
  - Input validation with error feedback

---

### 2. 🕐 Prayer Times Module

Stay connected with your daily prayers through accurate prayer times and Qibla direction.

**Features:**
- **Prayer Times Page**
  - Next prayer time with countdown
  - Hijri and Gregorian date display
  - Complete daily prayer schedule
  - Date navigation for past/future prayer times
  - Prayer notification toggle
  - Quick access to Qibla page
  
- **Qibla Page**
  - Compass pointing toward Qibla direction
  - Real-time compass adjustments based on device orientation
  - Compass calibration option

---

### 3. 📊 Daily Habit Module

Track your health, activities, and hydration while staying aligned with prayer times.

**Features:**
- **Main Habit Page**
  - Next prayer times display
  - BMI calculator access
  - Daily Calories and Hydration Target CTAs
  - Daily activities timeline
  - Add Activity button
  
- **Daily Calories Page**
  - Track daily calorie intake
  - Nutrient breakdown
  - Meals organized by time slot
  
- **Add Meal Page**
  - Search and add meals
  - View nutrition details
  
- **Hydration Target Page**
  - Set daily water intake target
  - Track water consumption
  - View consumption logs
  - Add drinks via bottom sheet
  
- **BMI Calculator**
  - Calculate body mass index
  - Input: height, weight, gender
  
- **Add Activity Page**
  - Log personal activities
  - Set start/end times
  - Configure reminders

---

### 4. 🛠️ Debug Tools (Developer Only)

Developer tools for debugging, testing, and UI component reference.

**Features:**
- **Double-Tap Access**: Double-tap anywhere in the app to open Debug Tools
- **Talker Log Viewer**: View comprehensive application logs with filtering
- **Component Showcase**: Visual catalog of all UI components
- **Test Log Generation**: Generate sample logs for testing
- **App Information**: Environment details and log statistics
- **Log Management**: Clear log history

**Access Methods:**
- Double-tap anywhere on any screen
- Navigate programmatically: `context.push(AppRouterConst.debug)`

See [DEBUG_TOOLS.md](doc/DEBUG_TOOLS.md) for complete documentation.

---

## Architecture

This project follows **Clean Architecture** principles with the following structure:

```
lib/
├── main.dart                 # App entry point
├── core/                     # Shared utilities, constants, exceptions
├── di/                       # Dependency Injection (GetIt + Injectable)
│   ├── injection.dart
│   ├── injection.config.dart
│   └── module/
│       ├── quran_module.dart
│       ├── prayer_times_module.dart
│       └── daily_habit_module.dart
├── domain/                   # Entities & Repository interfaces
├── usecase/                  # Application business logic
├── data/                     # Repository implementations & Data sources
├── presentation/             # UI (Pages, Widgets, BLoC)
└── ui/                       # Shared UI components
```

For detailed architecture documentation, see:
- [Architecture Documentation](doc/ARCHITECTURE.md)
- [Clean Architecture Recap](doc/CLEAN_ARCHITECTURE_RECAP.md)

---

## Getting Started

### Prerequisites

- Flutter SDK ^3.10.7
- Dart SDK

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd tumbuh_iman
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate code (DI, JSON serialization, etc.):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. Run the app:
   ```bash
   flutter run
   ```

---

## Tech Stack

- **Framework**: Flutter
- **State Management**: flutter_bloc
- **Dependency Injection**: get_it + injectable
- **Networking**: dio + retrofit
- **Local Storage**: drift
- **Code Generation**: freezed, json_serializable, build_runner

---

## Documentation

| Document | Description |
|----------|-------------|
| [ARCHITECTURE.md](doc/ARCHITECTURE.md) | Full architecture guide with examples |
| [CLEAN_ARCHITECTURE_RECAP.md](doc/CLEAN_ARCHITECTURE_RECAP.md) | Project-specific layer mapping |
| [clean_architecture.md](doc/clean_architecture.md) | Clean Architecture concepts |
| [COMPONENTS.md](doc/COMPONENTS.md) | UI components documentation |
| [DEBUG_TOOLS.md](doc/DEBUG_TOOLS.md) | Debug tools and Talker integration guide |
| [CONVENTIONAL_COMMITS.md](doc/CONVENTIONAL_COMMITS.md) | Commit message guidelines |
| [GITFLOW_BRANCHING.md](doc/GITFLOW_BRANCHING.md) | GitFlow branching strategy |
| [ASSETS.md](doc/ASSETS.md) | Assets management guide |

---

## Contributing

1. Follow the Clean Architecture guidelines in `doc/ARCHITECTURE.md`
2. Use [Conventional Commits](doc/CONVENTIONAL_COMMITS.md) for commit messages
3. Run code generation after adding new injectable classes
4. Write tests for new features

---

## License

This project is proprietary.

---

**Last Updated**: January 28, 2026
