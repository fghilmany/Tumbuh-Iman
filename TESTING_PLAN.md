# Firebase Crashlytics Integration - Testing Plan

## Overview
This document outlines the testing steps to verify the Firebase Crashlytics integration.

## Prerequisites
- Flutter SDK installed
- Android Studio or VS Code with Flutter extensions
- Firebase project with Crashlytics enabled
- Physical device or emulator for testing

## Pre-Testing Setup

### 1. Run Code Generation
```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### 2. Verify Build Configuration
```bash
# Check Android configuration
cat android/app/build.gradle.kts | grep -A 2 "google-services\|crashlytics"
cat android/settings.gradle.kts | grep -A 2 "google-services\|crashlytics"

# Verify DI configuration
cat lib/di/injection.config.dart | grep -i "firebase\|crashlytics"
```

## Testing Steps

### 1. Build Verification
```bash
# Clean build
flutter clean
flutter pub get

# Analyze code for errors
flutter analyze

# Build debug APK
flutter build apk --debug

# OR build iOS (on macOS)
flutter build ios --debug --no-codesign
```

### 2. Runtime Verification

#### Test 1: App Starts Successfully
```bash
flutter run --debug
```
**Expected Result:**
- App launches without errors
- No initialization errors in console
- Firebase and Crashlytics initialize successfully

**Logs to Check:**
```
✓ Firebase initialized
✓ Crashlytics initialized
✓ App running normally
```

#### Test 2: Manual Crash Test
Add a test button to trigger a crash (temporary test code):

```dart
// In MyHomePage widget
ElevatedButton(
  onPressed: () {
    throw Exception('Test crash for Crashlytics');
  },
  child: Text('Test Crash'),
),
```

**Expected Result:**
- App crashes
- Crash is logged to Firebase Console
- After restarting app, crash report is sent

#### Test 3: Custom Error Logging
Add test code to log custom errors:

```dart
// In MyHomePage widget
ElevatedButton(
  onPressed: () async {
    final crashlytics = getIt<CrashlyticsService>();
    await crashlytics.logError(
      Exception('Test error'),
      StackTrace.current,
      reason: 'Testing error logging',
      fatal: false,
    );
    crashlytics.log('Custom log message from test');
  },
  child: Text('Test Error Logging'),
),
```

**Expected Result:**
- Error logged without crashing app
- Custom message appears in Firebase Console
- Error details visible in Crashlytics dashboard

#### Test 4: User Identification
```dart
// Test setting user identifier
final crashlytics = getIt<CrashlyticsService>();
await crashlytics.setUserIdentifier('test_user_123');
await crashlytics.setCustomKey('test_key', 'test_value');
```

**Expected Result:**
- User identifier set successfully
- Custom keys visible in crash reports

### 3. Firebase Console Verification

1. Open Firebase Console: https://console.firebase.google.com
2. Navigate to your project
3. Go to Crashlytics section
4. Verify:
   - ✓ Crashlytics is enabled
   - ✓ Test crashes appear in dashboard
   - ✓ Custom errors are logged
   - ✓ User identifiers are captured
   - ✓ Custom keys are visible

### 4. Integration Testing

#### Test 5: Dependency Injection Works
```dart
// In a test file
void main() {
  test('CrashlyticsService is injectable', () async {
    await configureDependencies();
    
    final service = getIt<CrashlyticsService>();
    expect(service, isNotNull);
  });
}
```

#### Test 6: Error Handling in BLoC
Create a test BLoC that uses CrashlyticsService:

```dart
@injectable
class TestBloc extends Bloc<TestEvent, TestState> {
  final CrashlyticsService _crashlytics;
  
  TestBloc(this._crashlytics) : super(TestInitial()) {
    on<TestErrorEvent>(_onError);
  }
  
  Future<void> _onError(TestErrorEvent event, Emitter<TestState> emit) async {
    try {
      throw Exception('Test error in BLoC');
    } catch (e, stackTrace) {
      await _crashlytics.logError(e, stackTrace, reason: 'BLoC error test');
      emit(TestError(e.toString()));
    }
  }
}
```

**Expected Result:**
- BLoC receives CrashlyticsService via DI
- Errors are logged correctly
- App continues to function

## Success Criteria

### Must Pass:
- [ ] App builds successfully for Android and iOS
- [ ] App launches without errors
- [ ] Firebase initializes correctly
- [ ] Crashlytics initializes correctly
- [ ] CrashlyticsService is injectable via GetIt
- [ ] Manual crashes are captured and sent to Firebase
- [ ] Custom errors are logged correctly
- [ ] User identifiers can be set
- [ ] Custom keys are captured

### Should Pass:
- [ ] Crashes appear in Firebase Console within 5 minutes
- [ ] Non-fatal errors appear in Firebase Console
- [ ] User information is visible in crash reports
- [ ] Custom keys are visible in crash reports
- [ ] Flutter framework errors are captured automatically
- [ ] Async errors are captured automatically

## Troubleshooting

### Issue: Firebase not initializing
**Solution:**
1. Check `firebase_options.dart` is correctly configured
2. Verify `google-services.json` exists in `android/app/`
3. Check Firebase project credentials

### Issue: Crashes not appearing in console
**Solution:**
1. Wait 5-10 minutes for first-time setup
2. Check internet connection
3. Verify Crashlytics is enabled in Firebase Console
4. Check app has correct Firebase configuration

### Issue: DI errors
**Solution:**
1. Run `dart run build_runner clean`
2. Run `dart run build_runner build --delete-conflicting-outputs`
3. Check `injection.config.dart` includes Firebase imports

### Issue: Build errors
**Solution:**
1. Run `flutter clean`
2. Run `flutter pub get`
3. Check Flutter SDK version matches project requirements
4. Check all dependencies are compatible

## Performance Testing

### Memory Usage
Monitor memory usage before and after integration:
```bash
# Android
adb shell dumpsys meminfo <package_name>

# iOS
# Use Xcode Instruments
```

**Expected Result:**
- Minimal memory overhead (< 5MB)
- No memory leaks

### Startup Time
Measure app startup time:
```bash
flutter run --profile --trace-startup
```

**Expected Result:**
- Minimal impact on startup time (< 100ms)

## Cleanup

After testing, remove any test buttons/code added for crash testing:
```bash
git diff lib/main.dart
# Remove test code
# Commit clean version
```

## Documentation Review

Verify documentation is complete:
- [ ] `doc/FIREBASE_CRASHLYTICS.md` exists and is comprehensive
- [ ] Code examples are accurate
- [ ] Architecture explanation is clear
- [ ] Usage instructions are detailed

## Sign-off

Testing completed by: _______________
Date: _______________
Result: ✓ PASS / ✗ FAIL

Notes:
_________________________________
_________________________________
_________________________________
