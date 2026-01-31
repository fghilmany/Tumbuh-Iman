# Code Generation Required

After pulling this branch, you need to run code generation to update the dependency injection configuration:

## Prerequisites
- Flutter SDK installed and in PATH
- All dependencies installed via `flutter pub get`

## Commands

### Option 1: Run code generation once
```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### Option 2: Watch for changes (for development)
```bash
flutter pub get
dart run build_runner watch --delete-conflicting-outputs
```

## What Gets Generated

The build_runner will:
1. Update `lib/di/injection.config.dart` to include:
   - Firebase Core initialization
   - Firebase Crashlytics instance
   - CrashlyticsService registration
2. Update all Retrofit API clients
3. Update all Drift database schemas

## Verification

After running code generation, verify the integration:

```bash
# Check that injection.config.dart was updated
cat lib/di/injection.config.dart | grep -i firebase

# Check that injection.config.dart was updated
cat lib/di/injection.config.dart | grep -i crashlytics

# Build the app to verify no errors
flutter build apk --debug
```

## Expected Changes in injection.config.dart

You should see new imports and registrations similar to:
```dart
import 'package:firebase_core/firebase_core.dart' as _iXXX;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _iXXX;
import '../core/services/crashlytics_service.dart' as _iXXX;
import 'module/firebase_module.dart' as _iXXX;
```

And in the `init()` method:
```dart
final firebaseModule = _$FirebaseModule();
await gh.lazySingletonAsync<_iXXX.FirebaseApp>(
  () => firebaseModule.firebaseApp,
  preResolve: true,
);
gh.lazySingleton<_iXXX.FirebaseCrashlytics>(
  () => firebaseModule.crashlytics,
);
gh.lazySingleton<_iXXX.CrashlyticsService>(
  () => _iXXX.CrashlyticsService(gh<_iXXX.FirebaseCrashlytics>()),
);
```

## Troubleshooting

If you encounter errors:

1. **Clean build cache:**
   ```bash
   flutter clean
   flutter pub get
   dart run build_runner clean
   dart run build_runner build --delete-conflicting-outputs
   ```

2. **Check for conflicts:**
   - Look for `.dart_tool/build/generated/` directory
   - Remove conflicting `.g.dart` files manually if needed

3. **Verify dependencies:**
   ```bash
   flutter doctor -v
   flutter pub get
   ```

## Next Steps

Once code generation is complete:
1. Run the app: `flutter run`
2. Test crash reporting by triggering a test crash
3. View crashes in Firebase Console -> Crashlytics
