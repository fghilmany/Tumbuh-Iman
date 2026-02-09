import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker/talker.dart';
import 'package:tumbuh_iman/data/models/translations_model.dart';

abstract class TranslationLocalDataSource {
  Future<TranslationModel?> getCachedTranslations(String locale);
  Future<void> cacheTranslations(TranslationModel model);
  Future<TranslationModel> getTranslationsFromFile(String locale);
  Future<void> clearCache();

  // Version management
  String? getSavedVersion();
  Future<void> saveVersion(String version);
  Future<void> clearVersion();
}

@Injectable(as: TranslationLocalDataSource)
class TranslationLocalDataSourceImpl implements TranslationLocalDataSource {
  final SharedPreferences _prefs;
  final Talker _talker;

  static const String _cacheKeyPrefix = 'translations_';
  static const String _versionKey = 'translation_version'; // Store version separately

  TranslationLocalDataSourceImpl(this._prefs, this._talker);

  @override
  Future<TranslationModel?> getCachedTranslations(String locale) async {
    try {
      _talker.debug('Getting cached translations for locale: $locale');

      final key = '$_cacheKeyPrefix$locale';
      final jsonString = _prefs.getString(key);

      if (jsonString != null) {
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        _talker.info('✅ Found cached translations for locale: $locale');
        return TranslationModel.fromJson(json);
      }

      _talker.debug('No cached translations found for locale: $locale');
      return null;
    } catch (e, stackTrace) {
      _talker.error('Error getting cached translations', e, stackTrace);
      return null;
    }
  }

  @override
  Future<void> cacheTranslations(TranslationModel model) async {
    try {
      _talker.debug('Caching translations for locale: ${model.locale}');

      final key = '$_cacheKeyPrefix${model.locale}';
      final jsonString = jsonEncode(model.toJson());

      await _prefs.setString(key, jsonString);
      _talker.info('✅ Successfully cached translations for locale: ${model.locale}');
    } catch (e, stackTrace) {
      _talker.error('Error caching translations', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<TranslationModel> getTranslationsFromFile(String locale) async {
    try {
      _talker.debug('Loading translations from JSON file for locale: $locale');

      final jsonString = await rootBundle.loadString(
        'assets/translations/$locale.json',
      );

      final json = jsonDecode(jsonString) as Map<String, dynamic>;

      _talker.info('✅ Successfully loaded translations from file: $locale.json');

      return TranslationModel(
        locale: locale,
        translations: json,
        lastUpdated: DateTime.now(),
      );
    } catch (e, stackTrace) {
      _talker.error('Error loading translations from file', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      _talker.debug('Clearing translation cache');

      final keys = _prefs.getKeys().where((key) => key.startsWith(_cacheKeyPrefix));

      for (final key in keys) {
        await _prefs.remove(key);
      }

      _talker.info('✅ Successfully cleared translation cache');
    } catch (e, stackTrace) {
      _talker.error('Error clearing cache', e, stackTrace);
      rethrow;
    }
  }

  // ==================== Version Management ====================

  @override
  String? getSavedVersion() {
    try {
      final version = _prefs.getString(_versionKey);
      if (version != null) {
        _talker.debug('Saved version: $version');
      }
      return version;
    } catch (e) {
      _talker.error('Error getting saved version', e);
      return null;
    }
  }

  @override
  Future<void> saveVersion(String version) async {
    try {
      await _prefs.setString(_versionKey, version);
      _talker.info('✅ Saved version: $version');
    } catch (e, stackTrace) {
      _talker.error('Error saving version', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> clearVersion() async {
    try {
      await _prefs.remove(_versionKey);
      _talker.info('✅ Cleared saved version');
    } catch (e) {
      _talker.error('Error clearing version', e);
    }
  }
}