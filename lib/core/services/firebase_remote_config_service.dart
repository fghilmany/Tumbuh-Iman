import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';
import 'package:tumbuh_iman/domain/entities/translation/translation_version_entity.dart';
import 'package:tumbuh_iman/gen/assets.gen.dart';

@singleton
class FirebaseRemoteConfigService {
  final FirebaseRemoteConfig remoteConfig;
  final Talker _talker;

  FirebaseRemoteConfigService(this.remoteConfig, this._talker);

  /// Initialize Firebase Remote Config
  Future<void> initialize() async {
    try {
      _talker.info('⚙️ Initializing Firebase Remote Config...');

      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(minutes: 1), // For testing
        ),
      );

      final enJson = await rootBundle.loadString(Assets.translations.en);
      final idJson = await rootBundle.loadString(Assets.translations.id);

      // Set default values
      await remoteConfig.setDefaults( {
        'translations_en': enJson,
        'translations_id': idJson,
        'translation_version': '{"version":"0.0.0","updated_at":"2000-01-01T00:00:00Z","changelog":"Default version"}',
      });

      // Skip Firebase fetch in debug mode - always use assets
      if (kDebugMode) {
        _talker.warning('🔧 DEBUG MODE: Using ASSETS only (skipping Firebase)');
        _talker.info('📦 Using version: 0.0.0 (assets)');
        return; // Exit early, don't fetch from Firebase
      }

      _talker.info('🔄 Fetching from Firebase...');

      final updated = await remoteConfig.fetchAndActivate();

      _talker.info('Fetch status: ${remoteConfig.lastFetchStatus}');
      _talker.info('Updated: $updated');

      if (updated) {
        _talker.info('✅ Fetched NEW values');
      } else {
        _talker.warning('⚠️ Using CACHED values');
      }

      // Log version after fetch
      final version = _getVersionFromConfig(); // Use private method
      if (version != null) {
        _talker.info('📦 Current version: ${version.version}');
      }
    } catch (e, stackTrace) {
      _talker.error('❌ Failed to initialize', e, stackTrace);
      rethrow;
    }
  }

  /// Get translation JSON string for a locale
  Future<String> getTranslationJson(String locale) async {
    try {
      final key = 'translations_$locale';
      final jsonString = remoteConfig.getString(key);

      if (jsonString.isEmpty) {
        throw Exception('No translation found for locale: $locale');
      }

      _talker.debug('Got translation for $locale (${jsonString.length} chars)');
      return jsonString;
    } catch (e, stackTrace) {
      _talker.error('Error getting translation', e, stackTrace);
      rethrow;
    }
  }

  /// Get translation version WITH FETCH
  /// This ensures we always get the latest version from Firebase
  Future<TranslationVersionEntity?> getTranslationVersion() async {
    try {
      _talker.debug('🔍 Getting translation version...');

      // In debug mode, skip fetch and return default version
      if (kDebugMode) {
        _talker.debug('🔧 DEBUG: Returning default version (0.0.0)');
        return _getVersionFromConfig();
      }

      // Production: ALWAYS fetch to get latest version
      await _ensureFreshFetch();

      return _getVersionFromConfig();
    } catch (e, stackTrace) {
      _talker.error('Error getting translation version', e, stackTrace);
      return null;
    }
  }

  /// Get version from current Remote Config (without fetching)
  /// This is called AFTER a fetch has been done
  TranslationVersionEntity? _getVersionFromConfig() {
    try {
      final source = remoteConfig.getValue('translation_version').source;
      final versionString = remoteConfig.getString('translation_version');

      _talker.debug('Version source: $source');
      _talker.debug('Version string: $versionString');

      if (versionString.isEmpty) {
        _talker.warning('No version info found');
        return null;
      }

      final json = jsonDecode(versionString) as Map<String, dynamic>;

      final version = TranslationVersionEntity(
        version: json['version'] as String,
        updatedAt: DateTime.parse(json['updated_at'] as String),
        changelog: json['changelog'] as String?,
        minRequiredVersion: json['min_required_version'] as String?,
      );

      return version;
    } catch (e, stackTrace) {
      _talker.error('Error parsing version', e, stackTrace);
      return null;
    }
  }

  /// Ensure we have fresh data (respects minimumFetchInterval)
  Future<void> _ensureFreshFetch() async {
    try {
      final lastFetchTime = remoteConfig.lastFetchTime;
      final now = DateTime.now();
      final timeSinceLastFetch = now.difference(lastFetchTime);

      // If last fetch was more than 1 minute ago, fetch again
      if (timeSinceLastFetch.inMinutes >= 1) {
        _talker.debug('⏰ Last fetch: ${timeSinceLastFetch.inMinutes}m ago, fetching...');

        final updated = await remoteConfig.fetchAndActivate();

        if (updated) {
          _talker.info('✅ Fetched new values from Firebase');
        } else {
          _talker.debug('📦 No new values (already up to date)');
        }
      } else {
        _talker.debug('⏭️ Skipping fetch (last fetch: ${timeSinceLastFetch.inSeconds}s ago)');
      }
    } catch (e, stackTrace) {
      _talker.warning('⚠️ Fetch failed, using cached', e, stackTrace);
    }
  }

  /// Check if update is available
  Future<bool> hasUpdate(String? currentVersion) async {
    try {
      if (currentVersion == null) return false;

      _talker.debug('🔍 Checking for updates (current: $currentVersion)...');

      // Get latest version (will fetch if needed)
      final remoteVersion = await getTranslationVersion();

      if (remoteVersion == null) {
        _talker.warning('No remote version found');
        return false;
      }

      _talker.info('📦 Remote version: ${remoteVersion.version}');
      _talker.info('💾 Current version: $currentVersion');

      final hasUpdate = remoteVersion.version != currentVersion;

      if (hasUpdate) {
        _talker.info('🆕 Update available: $currentVersion → ${remoteVersion.version}');
      } else {
        _talker.debug('✅ Already on latest: $currentVersion');
      }

      return hasUpdate;
    } catch (e, stackTrace) {
      _talker.error('Error checking for update', e, stackTrace);
      return false;
    }
  }

  /// Force refresh (ignores minimumFetchInterval)
  Future<void> forceRefresh() async {
    try {
      _talker.info('🔄 Force refreshing...');

      // Temporarily set interval to 0
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );

      final updated = await remoteConfig.fetchAndActivate();

      // Reset to normal interval
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(minutes: 1),
        ),
      );

      _talker.info('Fetch status: ${remoteConfig.lastFetchStatus}');

      if (updated) {
        final version = _getVersionFromConfig();
        _talker.info('✅ Force refreshed to: ${version?.version}');
      } else {
        _talker.info('📦 Already on latest version');
      }
    } catch (e, stackTrace) {
      _talker.error('❌ Error force refreshing', e, stackTrace);
      rethrow;
    }
  }

  RemoteConfigFetchStatus get lastFetchStatus => remoteConfig.lastFetchStatus;
  DateTime get lastFetchTime => remoteConfig.lastFetchTime;

  /// Get debug info
  Map<String, dynamic> getDebugInfo() {
    final version = _getVersionFromConfig(); // Use sync version
    final allKeys = remoteConfig.getAll();

    return {
      'version': version?.version ?? 'unknown',
      'version_source': remoteConfig.getValue('translation_version').source.toString(),
      'updated_at': version?.updatedAt.toIso8601String() ?? 'unknown',
      'changelog': version?.changelog ?? 'N/A',
      'last_fetch_time': lastFetchTime.toIso8601String(),
      'last_fetch_status': lastFetchStatus.toString(),
      'all_keys': allKeys.keys.toList(),
      'translations_en_size': remoteConfig.getString('translations_en').length,
      'translations_id_size': remoteConfig.getString('translations_id').length,
    };
  }
}