import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker/talker.dart';
import 'package:tumbuh_iman/core/services/firebase_remote_config_service.dart';
import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/domain/entities/translation/translation_entity.dart';
import 'package:tumbuh_iman/domain/repositories/translation/translations_repositories.dart';

@lazySingleton
class TranslationService extends ChangeNotifier {
  final TranslationRepository _repository;
  final FirebaseRemoteConfigService _remoteConfigService;
  final SharedPreferences _prefs;
  final Talker _talker;

  String _currentLocale = 'id';
  TranslationEntity? _currentTranslations;
  bool _isInitialized = false;
  bool _isLoading = false;

  static const String _localeKey = 'selected_locale';
  static const String _versionKey = 'translation_version'; // Add this
  static const List<String> _availableLocales = ['en', 'id'];

  TranslationService(
      this._repository,
      this._remoteConfigService,
      this._prefs,
      this._talker,
      );

  // ==================== Getters ====================

  String get currentLocale => _currentLocale;
  bool get isInitialized => _isInitialized;
  bool get isLoading => _isLoading;
  List<String> get availableLocales => _availableLocales;
  int get translationCount => _currentTranslations?.translations.length ?? 0;

  // Get version from SharedPreferences (saved version)
  String? get currentVersion => _prefs.getString(_versionKey);

  // For changelog, get from Remote Config directly (sync)
  String? get changelog {
    try {
      final versionString = _remoteConfigService.remoteConfig.getString('translation_version');
      if (versionString.isEmpty) return null;

      final json = jsonDecode(versionString) as Map<String, dynamic>;
      return json['changelog'] as String?;
    } catch (e) {
      return null;
    }
  }

  // Add method to get latest version (async)
  Future<String?> getLatestVersion() async {
    final version = await _remoteConfigService.getTranslationVersion();
    return version?.version;
  }

  // ==================== Initialization ====================

  Future<void> initialize({String? locale}) async {
    _talker.info('🌍 Initializing Translation Service...');

    try {
      String targetLocale = locale ?? _getSavedLocale() ?? _currentLocale;

      if (!_availableLocales.contains(targetLocale)) {
        _talker.warning('Invalid locale: $targetLocale, using default');
        targetLocale = _currentLocale;
      }

      final success = await changeLocale(targetLocale, saveToPrefs: false);
      _isInitialized = success;

      if (success) {
        _talker.info('✅ Translation Service initialized');
        _talker.info('📦 Current version: ${currentVersion ?? "unknown"}');
      } else {
        _talker.warning('⚠️ Translation initialization failed');
      }
    } catch (e, stackTrace) {
      _talker.error('❌ Error initializing', e, stackTrace);
      _isInitialized = false;
    }
  }

  // ==================== Locale Management ====================

  Future<bool> changeLocale(String locale, {bool saveToPrefs = true}) async {
    if (!_availableLocales.contains(locale)) {
      _talker.warning('Invalid locale: $locale');
      return false;
    }

    if (locale == _currentLocale && _currentTranslations != null) {
      _talker.debug('Already on locale: $locale');
      return true;
    }

    _talker.info('🔄 Changing locale to: $locale');
    _setLoading(true);

    try {
      final result = await _repository.getTranslations(locale);

      return result.when(
        success: (data) {
          _currentLocale = locale;
          _currentTranslations = data;

          if (saveToPrefs) {
            _saveLocale(locale);
          }

          _talker.info('✅ Locale changed to: $locale (${data.translations.length} keys)');

          _setLoading(false);
          notifyListeners();

          return true;
        },
        failure: (message, exception) {
          _talker.error('❌ Failed: $message', exception);
          _setLoading(false);
          return false;
        },
      );
    } catch (e, stackTrace) {
      _talker.error('❌ Error changing locale', e, stackTrace);
      _setLoading(false);
      return false;
    }
  }

  String getLocaleDisplayName(String locale) {
    switch (locale) {
      case 'en':
        return 'English';
      case 'id':
        return 'Indonesia';
      default:
        return locale;
    }
  }

  String getLocaleFlag(String locale) {
    switch (locale) {
      case 'en':
        return '🇬🇧';
      case 'id':
        return '🇮🇩';
      default:
        return '🌍';
    }
  }

  // ==================== Translation ====================

  String translate(String key, {String? fallback}) {
    if (_currentTranslations == null) {
      return fallback ?? key;
    }

    final keys = key.split('.');
    dynamic value = _currentTranslations!.translations;

    for (final k in keys) {
      if (value is Map<String, dynamic> && value.containsKey(k)) {
        value = value[k];
      } else {
        return fallback ?? key;
      }
    }

    return value.toString();
  }

  String translateWithArgs(String key, Map<String, String> args, {String? fallback}) {
    String translation = translate(key, fallback: fallback);
    args.forEach((placeholder, value) {
      translation = translation.replaceAll('{$placeholder}', value);
    });
    return translation;
  }

  bool hasKey(String key) {
    if (_currentTranslations == null) return false;

    final keys = key.split('.');
    dynamic value = _currentTranslations!.translations;

    for (final k in keys) {
      if (value is Map<String, dynamic> && value.containsKey(k)) {
        value = value[k];
      } else {
        return false;
      }
    }
    return true;
  }

  // ==================== Refresh & Updates ====================

  Future<bool> refreshTranslations() async {
    if (!_isInitialized) return false;

    _talker.info('🔄 Refreshing translations...');
    _setLoading(true);

    try {
      // Force refresh Remote Config
      await _remoteConfigService.forceRefresh();

      // Reload translations (will detect new version and fetch)
      final result = await _repository.getTranslations(_currentLocale);

      return result.when(
        success: (data) {
          _currentTranslations = data;
          _talker.info('✅ Refreshed to version: ${currentVersion}');

          _setLoading(false);
          notifyListeners();

          return true;
        },
        failure: (message, exception) {
          _talker.error('❌ Failed: $message', exception);
          _setLoading(false);
          return false;
        },
      );
    } catch (e, stackTrace) {
      _talker.error('❌ Error refreshing', e, stackTrace);
      _setLoading(false);
      return false;
    }
  }

  Future<bool> clearCacheAndReload() async {
    if (!_isInitialized) return false;

    _talker.info('🗑️ Clearing cache...');
    _setLoading(true);

    try {
      final clearResult = await _repository.clearCache();

      final clearSuccess = clearResult.when(
        success: (_) => true,
        failure: (message, exception) {
          _talker.error('Failed: $message', exception);
          return false;
        },
      );

      if (!clearSuccess) {
        _setLoading(false);
        return false;
      }

      final reloadSuccess = await changeLocale(_currentLocale, saveToPrefs: false);

      _setLoading(false);
      return reloadSuccess;
    } catch (e, stackTrace) {
      _talker.error('Error clearing cache', e, stackTrace);
      _setLoading(false);
      return false;
    }
  }

  Future<bool> hasUpdateAvailable() async {
    try {
      // Get saved version (current)
      final savedVersion = _prefs.getString(_versionKey);

      // Get remote version (latest from Firebase)
      final remoteVersionEntity = await _remoteConfigService.getTranslationVersion();
      final remoteVersion = remoteVersionEntity?.version;

      if (savedVersion == null || remoteVersion == null) {
        _talker.debug('Cannot check update: savedVersion=$savedVersion, remoteVersion=$remoteVersion');
        return false;
      }

      final hasUpdate = savedVersion != remoteVersion;

      if (hasUpdate) {
        _talker.info('🆕 Update available: $savedVersion → $remoteVersion');
      } else {
        _talker.debug('✅ Already on latest: $savedVersion');
      }

      return hasUpdate;
    } catch (e, stackTrace) {
      _talker.error('Error checking for updates', e, stackTrace);
      return false;
    }
  }

  // ==================== Private ====================

  void _setLoading(bool loading) {
    if (_isLoading != loading) {
      _isLoading = loading;
      notifyListeners();
    }
  }

  String? _getSavedLocale() {
    try {
      return _prefs.getString(_localeKey);
    } catch (e) {
      return null;
    }
  }

  void _saveLocale(String locale) {
    try {
      _prefs.setString(_localeKey, locale);
    } catch (e) {
      _talker.error('Error saving locale', e);
    }
  }

  DateTime get lastFetchTime => _remoteConfigService.lastFetchTime;
}