# Translations

This project supports multiple languages with a Firebase Remote Config-based translation system with local caching and offline fallback.

## Overview

The translation system uses a three-tier approach:
1. **Firebase Remote Config** - Primary source for translations (with versioning)
2. **Local Storage (SharedPreferences)** - Cached translations for offline use
3. **Asset Files** - Fallback mock translations in `assets/translations/` directory
   - `en.json` - English translations (fallback)
   - `id.json` - Indonesian (Bahasa Indonesia) translations (fallback)

## How It Works

### Translation Flow

When the app requests translations:

```
1. Check Remote Config version vs. Local saved version
   ├─ If versions differ OR no local version exists:
   │  └─ Fetch from Firebase Remote Config
   │     ├─ SUCCESS → Save to local cache + Save version → Return translations
   │     └─ FAIL → Continue to step 2
   │
2. Try Local Cache (SharedPreferences)
   ├─ Found & valid → Return cached translations
   └─ Not found → Continue to step 3
   │
3. Load from Asset Files (Fallback)
   └─ Load JSON from assets/translations/{locale}.json
      └─ Cache for future use → Return translations
```

### Version Management

- **Remote Version**: Stored in Firebase Remote Config as `translation_version`
  - Contains: `version`, `updated_at`, `changelog`, `min_required_version`
- **Local Version**: Stored in SharedPreferences as `translation_version`
- When versions differ, the app automatically fetches and updates translations

## Usage

### In Dart Code

Import the translation extension:

```dart
import 'package:tumbuh_iman/core/extensions/translations_extenstion.dart';
```

Use the `.tr` extension on translation keys:

```dart
Text("app_name".tr)
Text("welcome_message".tr)

// With fallback
Text("some_key".trWithFallback("Default Text"))
```

### From BuildContext

```dart
// Get translation service
final translationService = context.translations;

// Quick translate
final text = context.tr("app_name");
final textWithFallback = context.tr("app_name", fallback: "Tumbuh Iman");
```

## Available Translation Keys

### App General

| Key | English | Indonesian | Usage |
|-----|---------|-----------|-------|
| `app_name` | Tumbuh Iman | Tumbuh Iman | Application name |
| `app_tagline` | Iman and Amal in one app | Iman dan Amal dalam satu aplikasi | Application tagline/slogan |
| `welcome_message` | Welcome to Tumbuh Iman! | Selamat datang di Tumbuh Iman! | Welcome greeting |

### Splash Screen

| Key | English | Indonesian | Used In |
|-----|---------|-----------|---------|
| `app_name` | Tumbuh Iman | Tumbuh Iman | `SplashPage` - Main app name display |
| `app_tagline` | Iman and Amal in one app | Iman dan Amal dalam satu aplikasi | `SplashPage` - Tagline below app name |

## Adding New Translations

### For Production (Firebase Remote Config)

1. **Update Firebase Remote Config**:
   - Go to Firebase Console → Remote Config
   - Update the `translations_en` and `translations_id` parameters with new keys
   - Update the `translation_version` parameter:
     ```json
     {
       "version": "1.0.1",
       "updated_at": "2024-01-15T10:30:00Z",
       "changelog": "Added new splash screen translations",
       "min_required_version": "1.0.0"
     }
     ```
   - Publish changes

2. **Update Local Asset Files (Fallback)**:
   - Update `assets/translations/en.json`
   - Update `assets/translations/id.json`
   - These serve as fallback when Firebase is unavailable

3. **Update This Documentation**:
   - Add the new translation keys to the appropriate table below

4. **Use in Code**:
   ```dart
   Text("your_new_key".tr)
   ```

### For Development (Local Testing)

When testing locally before updating Firebase:

**assets/translations/en.json:**
```json
{
  "existing_keys": "...",
  "your_new_key": "English translation"
}
```

**assets/translations/id.json:**
```json
{
  "existing_keys": "...",
  "your_new_key": "Terjemahan Bahasa Indonesia"
}
```

Then clear cache to force reload from assets:
```dart
// In your code or debug menu
final translationService = getIt<TranslationService>();
await translationService.clearCache();
await translationService.initialize();
```

## Best Practices

### Naming Conventions

- Use lowercase with underscores: `snake_case`
- Be descriptive: `error_network_connection` instead of `err1`
- Group related keys with common prefixes:
  - `auth_login`, `auth_logout`, `auth_signup`
  - `error_network`, `error_validation`, `error_server`
  - `button_save`, `button_cancel`, `button_submit`

### Organization

Consider organizing translation keys by feature or screen:

```json
{
  "splash_title": "...",
  "splash_tagline": "...",
  "home_greeting": "...",
  "home_subtitle": "...",
  "auth_login_title": "...",
  "auth_login_button": "..."
}
```

### Consistency

- Always add translations for all supported languages
- Keep translations culturally appropriate
- Maintain consistent tone and style
- Review translations with native speakers when possible

## Translation System Architecture

### Components

1. **TranslationService** (`lib/core/services/translation_service.dart`)
   - Main service for accessing translations
   - Manages current locale and translation state
   - Provides `translate()` method and update checking

2. **TranslationRepository** (`lib/data/repositories/translation_repository_impl.dart`)
   - Orchestrates the three-tier translation flow
   - Handles version comparison and update logic
   - Manages fallback chain: Remote → Cache → Assets

3. **FirebaseRemoteConfigService** (`lib/core/services/firebase_remote_config_service.dart`)
   - Fetches translations from Firebase Remote Config
   - Manages translation versioning
   - Keys in Firebase:
     - `translations_en` - English translations JSON
     - `translations_id` - Indonesian translations JSON
     - `translation_version` - Version metadata JSON

4. **TranslationLocalDataSource** (`lib/data/local/translation/translation_local_datasource.dart`)
   - Caches translations in SharedPreferences
   - Loads fallback translations from `assets/translations/*.json`
   - Manages local version tracking

5. **TranslationRemoteDataSource** (`lib/data/remote/translation/translation_remote_datasource.dart`)
   - Fetches translations from Firebase Remote Config
   - Parses JSON data into TranslationModel

### Data Flow

```
┌─────────────────────────────────────────────────────────────┐
│                      App Initialization                      │
│  main.dart → Initialize Firebase → Initialize Remote Config │
│                  → Initialize TranslationService             │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                   TranslationService.initialize()            │
│  Calls TranslationRepository.getTranslations(locale)         │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│              TranslationRepository (Version Check)           │
│  1. Get Remote Config version (Firebase)                    │
│  2. Get Saved local version (SharedPreferences)             │
│  3. Compare versions                                         │
└──────────────────────────┬──────────────────────────────────┘
                           │
                ┌──────────┴──────────┐
                │  Versions differ?   │
                └──────────┬──────────┘
                  YES ─────┤───── NO
                           │          │
                           ▼          ▼
           ┌───────────────────┐  ┌──────────────────┐
           │ Fetch from Remote │  │ Use Local Cache  │
           │  (Firebase)       │  │ (SharedPreferences)│
           └────────┬──────────┘  └─────────┬────────┘
                    │                       │
              ┌─────┴─────┐                 │
              │  Success? │                 │
              └─────┬─────┘                 │
         YES ───────┤────── NO              │
                    │         │             │
                    ▼         ▼             │
         ┌──────────────┐  ┌─────────────┐ │
         │ Save to Cache│  │ Try Cache   │ │
         │ Save Version │  └──────┬──────┘ │
         └──────┬───────┘         │        │
                │            ┌────┴────┐   │
                │            │ Found?  │   │
                │            └────┬────┘   │
                │        YES──────┤──NO    │
                │                 │    │   │
                ▼                 ▼    ▼   ▼
         ┌─────────────────────────────────────┐
         │       Return Translations           │
         │  OR Load from assets/ (Fallback)    │
         └─────────────────────────────────────┘
```

### Key Features

- **Automatic Updates**: Checks version on app start and fetches new translations
- **Offline Support**: Uses cached translations when network is unavailable
- **Graceful Degradation**: Falls back to asset files if remote and cache fail
- **Version Control**: Tracks translation versions to minimize unnecessary fetches
- **Performance**: Respects minimum fetch interval (1 minute in dev, configurable for prod)

## Testing Translations

### Manual Testing

1. **Test Different Languages**:
   - Change device language to test translations
   - Verify all UI text displays correctly
   - Check for text overflow or truncation issues

2. **Test Remote Config Updates**:
   - Update translations in Firebase Console
   - Increment version number
   - Force refresh in app to fetch new translations
   - Verify new translations appear

3. **Test Offline Mode**:
   - Enable airplane mode
   - Restart app
   - Verify cached translations are used
   - If no cache, verify asset fallback works

4. **Test Version Management**:
   ```dart
   // Check current version
   final translationService = getIt<TranslationService>();
   print('Current version: ${translationService.currentVersion}');
   
   // Check for updates
   final hasUpdate = await translationService.hasUpdateAvailable();
   print('Update available: $hasUpdate');
   
   // Force update
   await translationService.forceUpdate();
   ```

### Debugging

#### View Translation Info
```dart
final service = getIt<TranslationService>();
print('Locale: ${service.currentLocale}');
print('Initialized: ${service.isInitialized}');
print('Loading: ${service.isLoading}');
print('Translation count: ${service.translationCount}');
print('Current version: ${service.currentVersion}');
print('Changelog: ${service.changelog}');
```

#### Check Remote Config Status
```dart
final remoteConfig = getIt<FirebaseRemoteConfigService>();
final debugInfo = remoteConfig.getDebugInfo();
print('Last fetch: ${debugInfo['last_fetch_time']}');
print('Fetch status: ${debugInfo['last_fetch_status']}');
print('Version info: ${debugInfo['version_info']}');
```

#### Clear Cache and Reset
```dart
final service = getIt<TranslationService>();
await service.clearCache();
await service.initialize();
```

### Checking for Missing Translations

Compare the keys in `en.json` and `id.json` to ensure they match:

```bash
# Check if all keys exist in both files
diff <(jq -r 'keys[]' assets/translations/en.json | sort) \
     <(jq -r 'keys[]' assets/translations/id.json | sort)
```

### Automated Testing

Consider adding tests for:

```dart
// Test translation loading
test('should load translations from assets', () async {
  final datasource = TranslationLocalDataSourceImpl(prefs, talker);
  final translations = await datasource.getTranslationsFromFile('en');
  expect(translations.translations, isNotEmpty);
});

// Test version comparison
test('should detect version mismatch', () async {
  // Mock remote version = 1.0.1
  // Mock local version = 1.0.0
  // Should return true for needsUpdate
});

// Test fallback chain
test('should fallback to assets when remote fails', () async {
  // Mock remote fetch failure
  // Verify assets are loaded
});
```

## Future Enhancements

Potential improvements to consider:

- [ ] Add more languages (Arabic, Malay, etc.)
- [ ] Implement pluralization support
- [ ] Add parameterized translations (e.g., "Hello {name}")
- [ ] Create translation validation tests
- [ ] Add context-specific translations
- [ ] Implement in-app translation update notifications
- [ ] Add translation management dashboard
- [ ] Support for regional variants (en-US vs en-GB)
- [ ] A/B testing different translations via Remote Config

## Troubleshooting

### Translations not updating

1. **Check Remote Config version**:
   - Verify version was incremented in Firebase Console
   - Confirm changes were published

2. **Check fetch interval**:
   - Remote Config has minimum fetch interval (1 minute in dev)
   - Use force refresh for immediate updates

3. **Clear cache**:
   ```dart
   await translationService.clearCache();
   await translationService.initialize();
   ```

### Missing translations showing as keys

1. **Check key exists in all language files**
2. **Verify JSON syntax is valid**
3. **Check logs for loading errors**
4. **Use fallback**: `"key".trWithFallback("Default Text")`

### App crashes on startup

1. **Check asset files exist** in `assets/translations/`
2. **Verify pubspec.yaml** includes asset declarations
3. **Check JSON files are valid**
4. **Review initialization logs** in Talker

## Related Files

### Core Files
- `lib/core/services/translation_service.dart` - Main translation service
- `lib/core/services/firebase_remote_config_service.dart` - Remote Config wrapper
- `lib/core/extensions/translations_extenstion.dart` - `.tr` extension methods

### Data Layer
- `lib/data/repositories/translation_repository_impl.dart` - Translation repository
- `lib/data/remote/translation/translation_remote_datasource.dart` - Remote data source
- `lib/data/local/translation/translation_local_datasource.dart` - Local data source
- `lib/data/models/translations_model.dart` - Translation data models

### Domain Layer
- `lib/domain/repositories/translation/translations_repositories.dart` - Repository interface
- `lib/domain/entities/translation/translation_entity.dart` - Translation entities
- `lib/domain/entities/translation/translation_version_entity.dart` - Version entities

### Assets
- `assets/translations/en.json` - English fallback translations
- `assets/translations/id.json` - Indonesian fallback translations

### Configuration
- `pubspec.yaml` - Asset declarations
- Firebase Console - Remote Config parameters

## References

- [Firebase Remote Config Documentation](https://firebase.google.com/docs/remote-config)
- [Flutter Internationalization](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)
- [SharedPreferences Plugin](https://pub.dev/packages/shared_preferences)
- [Dependency Injection with Injectable](https://pub.dev/packages/injectable)

