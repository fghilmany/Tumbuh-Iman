# Tumbuh Iman - Debug Tools Documentation

Complete guide to the Debug Tools feature for developers working on the Tumbuh Iman app.

---

## Table of Contents

1. [Overview](#overview)
2. [Accessing Debug Tools](#accessing-debug-tools)
3. [Features](#features)
4. [Talker Integration](#talker-integration)
5. [Component Showcase](#component-showcase)
6. [Usage Guide](#usage-guide)
7. [Development Tips](#development-tips)

---

## Overview

The Debug Tools page provides developers with quick access to debugging utilities, logs, and UI component references. This feature is designed to streamline development and testing workflows.

### Key Features

- **🔍 Log Viewer**: Access comprehensive app logs via Talker
- **🎨 Component Showcase**: View and test all UI components
- **🐛 Test Log Generation**: Generate sample logs for testing
- **📊 App Information**: View environment and configuration details
- **🧹 Log Management**: Clear log history

---

## Accessing Debug Tools

### Method 1: Double-Tap Anywhere

The easiest way to access the Debug Tools page is through the **double-tap gesture**:

1. **Double-tap anywhere** on any screen in the app
2. The Debug Tools page will open immediately

This works on all pages except:
- The Debug Tools page itself
- The Talker log viewer
- The Component Showcase page

### Method 2: Direct Navigation

For programmatic access:

```dart
import 'package:go_router/go_router.dart';
import 'package:tumbuh_iman/core/router/app_router_const.dart';

// Navigate to debug page
context.push(AppRouterConst.debug);
```

### Implementation Details

The double-tap feature is implemented using a `ShellRoute` wrapper in the router configuration:

**File**: `lib/core/router/app_router.dart`

```dart
class DoubleTapNavigator extends StatelessWidget {
  final Widget child;

  const DoubleTapNavigator({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onDoubleTap: () {
        context.push(AppRouterConst.debug);
      },
      child: child,
    );
  }
}
```

All routes are wrapped with this widget via `ShellRoute`, ensuring the double-tap gesture works globally.

---

## Features

### 1. Logging Section

#### View Logs
- **Icon**: 📜 Receipt
- **Action**: Opens the Talker logs viewer
- **Use Case**: View detailed application logs, errors, warnings, and debug messages

#### Generate Test Logs
- **Icon**: 🐛 Bug Report
- **Action**: Creates sample logs at different severity levels
- **Generated Logs**:
  - Debug log: `🐛 Debug log from Debug Screen`
  - Info log: `ℹ️ Info log from Debug Screen`
  - Warning log: `⚠️ Warning log from Debug Screen`
  - Error log: `❌ Error log from Debug Screen`
  - Critical log: `🔥 Critical log from Debug Screen`

**Code Example**:
```dart
final talker = getIt<Talker>();

talker.debug('🐛 Debug log from Debug Screen');
talker.info('ℹ️ Info log from Debug Screen');
talker.warning('⚠️ Warning log from Debug Screen');
talker.error('❌ Error log from Debug Screen');
talker.critical('🔥 Critical log from Debug Screen');
```

### 2. Component Showcase

- **Icon**: 🎨 Widgets
- **Action**: Opens the Component Showcase page
- **Purpose**: View and interact with all UI components in one place
- **Contents**:
  - Colors
  - Typography
  - Buttons
  - Cards
  - Input fields
  - Dialogs
  - Loading indicators
  - State views (error, empty, success)
  - Misc components

See [COMPONENTS.md](./COMPONENTS.md) for detailed component documentation.

### 3. App Information

Displays key app details:

| Label | Description | Example Value |
|-------|-------------|---------------|
| **Environment** | Current build environment | Development |
| **Flutter Version** | Flutter version manager | Using FVM |
| **Logs Count** | Number of logs in history | Dynamic count |

### 4. Actions Section

#### Clear Logs
- **Icon**: 🗑️ Delete
- **Action**: Removes all logs from Talker history
- **Confirmation**: Shows success snackbar
- **Use Case**: Clean up logs during testing

**Code Example**:
```dart
talker.cleanHistory();
```

---

## Talker Integration

### What is Talker?

[Talker](https://pub.dev/packages/talker) is a powerful logging and error handling tool for Flutter apps. It provides:

- Beautiful log viewer UI
- Multiple log levels (debug, info, warning, error, critical)
- Error tracking
- Network request logging
- BLoC events/states logging
- Crash analytics integration

### Talker Setup

**Dependency** (`pubspec.yaml`):
```yaml
dependencies:
  talker: ^latest
  talker_flutter: ^latest
  talker_bloc_logger: ^latest
```

**Initialization** (`lib/di/injection.dart`):
```dart
// Register Talker as singleton
getIt.registerLazySingleton<Talker>(
  () => Talker(
    settings: TalkerSettings(
      enabled: true,
      useConsoleLogs: true,
    ),
  ),
);
```

**BLoC Integration** (`lib/main.dart`):
```dart
Bloc.observer = MultiBlocObserver(
  observers: [
    TalkerBlocObserver(
      talker: getIt<Talker>(),
    ),
    CcrashlyticsBlocObserver(),
  ],
);
```

### Using Talker in Code

```dart
import 'package:talker/talker.dart';
import 'package:tumbuh_iman/di/injection.dart';

final talker = getIt<Talker>();

// Log levels
talker.debug('Debug message');
talker.info('Info message');
talker.warning('Warning message');
talker.error('Error message');
talker.critical('Critical message');

// Log exceptions
try {
  // risky code
} catch (e, st) {
  talker.handle(e, st);
}

// Custom logs
talker.log('Custom message', logLevel: LogLevel.verbose);
```

### Talker Screen

The Talker screen (`TalkerScreen`) provides:

- **Filterable logs**: Filter by log level (all, debug, info, warning, error)
- **Search**: Search through log messages
- **Copy**: Copy log content
- **Share**: Share logs for debugging
- **Clear**: Clear all logs
- **Expandable entries**: Tap to see full stack traces

---

## Component Showcase

The Component Showcase page is a visual catalog of all reusable UI components in the app.

### Sections

1. **Colors** - App color palette
2. **Typography** - Text styles (Latin & Arabic)
3. **Buttons** - All button variants
4. **Cards** - Information, stat, feature, and action cards
5. **Inputs** - Text fields and search bars
6. **Dialogs** - Confirmation, info, and custom dialogs
7. **Indicators** - Loading spinners and progress bars
8. **States** - Error, empty, and success views
9. **Misc** - Avatars, badges, chips, dividers

### Usage

```dart
// Navigate to component showcase
context.push(AppRouterConst.componentShowcase);
```

**File Location**: `lib/presentation/features/debug/component_showcase_page.dart`

See [COMPONENTS.md](./COMPONENTS.md) for detailed component documentation.

---

## Usage Guide

### For Developers

#### During Development

1. **Access logs quickly**: Double-tap anywhere to open Debug Tools
2. **Check errors**: View Talker logs for exceptions and errors
3. **Test components**: Use Component Showcase to verify UI consistency
4. **Generate test logs**: Test log filtering and display

#### During Testing

1. **Monitor behavior**: Keep Talker open to watch real-time logs
2. **Reproduce bugs**: Use test log generation to simulate scenarios
3. **Clear logs**: Clean history between test runs
4. **Verify UI**: Check Component Showcase for visual regression

#### During Debugging

1. **Add log statements**: Use `talker.debug()` throughout your code
2. **Track BLoC events**: BLoC events are automatically logged
3. **Catch errors**: Use `talker.handle()` for exception handling
4. **View stack traces**: Tap logs in Talker screen for full details

### For QA/Testers

1. **Report bugs**: Include screenshots from Talker logs
2. **Reproduce issues**: Note the log count and timing
3. **Share logs**: Use Talker's share feature to send logs to developers
4. **Verify fixes**: Check that error logs no longer appear

---

## Development Tips

### Best Practices

#### 1. **Use Appropriate Log Levels**

```dart
// Debug: Development insights
talker.debug('User tapped on surah ${surah.name}');

// Info: General information
talker.info('Prayer times fetched successfully');

// Warning: Potential issues
talker.warning('Location permission not granted');

// Error: Recoverable errors
talker.error('Failed to fetch prayer times');

// Critical: App-breaking errors
talker.critical('Database initialization failed');
```

#### 2. **Add Context to Logs**

```dart
// ❌ Bad
talker.error('Failed');

// ✅ Good
talker.error('Failed to load surah list: Network timeout');
```

#### 3. **Log BLoC Events**

BLoC events are automatically logged, but you can add custom logs:

```dart
class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final Talker _talker;
  
  QuranBloc(this._talker) : super(QuranInitial()) {
    on<LoadSurahList>((event, emit) async {
      _talker.debug('Loading surah list...');
      // implementation
    });
  }
}
```

#### 4. **Clean Logs Regularly**

During development, clear logs periodically to keep history manageable:

```dart
talker.cleanHistory();
```

#### 5. **Use in Production**

For production builds, configure Talker to only log errors and critical issues:

```dart
final talker = Talker(
  settings: TalkerSettings(
    enabled: kDebugMode, // Only in debug mode
    useConsoleLogs: kDebugMode,
  ),
);
```

### Common Scenarios

#### Scenario 1: Debugging Network Requests

```dart
try {
  final response = await apiService.getPrayerTimes();
  talker.info('Prayer times API responded: ${response.statusCode}');
} catch (e, st) {
  talker.error('Prayer times API failed: $e');
  talker.handle(e, st);
}
```

#### Scenario 2: Tracking User Actions

```dart
void onBookmarkTapped(Ayah ayah) {
  talker.debug('Bookmark tapped: Surah ${ayah.surahNumber}, Ayah ${ayah.number}');
  // implementation
}
```

#### Scenario 3: Monitoring State Changes

```dart
on<UpdateHydrationGoal>((event, emit) {
  talker.info('Hydration goal updated: ${event.goal}ml');
  emit(state.copyWith(goal: event.goal));
});
```

---

## File Structure

```
lib/
├── core/
│   └── router/
│       ├── app_router.dart              # Router with DoubleTapNavigator
│       └── app_router_const.dart        # Route constants
├── presentation/
│   └── features/
│       └── debug/
│           ├── debug_page.dart          # Main debug tools page
│           └── component_showcase_page.dart  # UI components catalog
└── di/
    └── injection.dart                   # Talker DI setup
```

---

## Configuration

### Router Constants

**File**: `lib/core/router/app_router_const.dart`

```dart
class AppRouterConst {
  static const String debug = '/debug';
  static const String talker = '/talker';
  static const String componentShowcase = '/component-showcase';
}
```

### Router Setup

**File**: `lib/core/router/app_router.dart`

```dart
GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return DoubleTapNavigator(child: child);
      },
      routes: [
        // All app routes
      ],
    ),
  ],
);
```

---

## Troubleshooting

### Issue: Double-tap not working

**Cause**: Gesture detector conflicts with page-specific gestures

**Solution**: The `DoubleTapNavigator` uses `HitTestBehavior.translucent` to allow gestures to pass through. If a page has its own double-tap handler, it will take precedence.

### Issue: Logs not appearing in Talker

**Cause**: Talker not initialized or disabled

**Solution**: 
1. Verify Talker is registered in DI: `getIt<Talker>()`
2. Check Talker settings: `enabled: true`
3. Ensure BLoC observer is configured

### Issue: Component Showcase route not found

**Cause**: Route not registered or import path incorrect

**Solution**:
1. Verify route in `app_router_const.dart`
2. Check import in `app_router.dart`
3. Ensure `ComponentShowcasePage` exists at correct path

---

## Future Enhancements

Planned improvements for Debug Tools:

- [ ] Performance monitoring dashboard
- [ ] Network request inspector
- [ ] Local database viewer
- [ ] SharedPreferences editor
- [ ] Firebase Analytics event viewer
- [ ] Crashlytics report viewer
- [ ] Build information (version, build number, etc.)
- [ ] Environment switcher (dev, staging, production)
- [ ] Feature flags toggle
- [ ] API endpoint configuration

---

## Related Documentation

- [COMPONENTS.md](./COMPONENTS.md) - UI Components Documentation
- [ARCHITECTURE.md](./ARCHITECTURE.md) - App Architecture
- [CONVENTIONAL_COMMITS.md](./CONVENTIONAL_COMMITS.md) - Commit Guidelines

---

## External Resources

- [Talker Documentation](https://pub.dev/packages/talker)
- [Talker Flutter](https://pub.dev/packages/talker_flutter)
- [Talker BLoC Logger](https://pub.dev/packages/talker_bloc_logger)
- [GoRouter Documentation](https://pub.dev/packages/go_router)

---

**Last Updated**: February 6, 2026
**Version**: 1.0.0

