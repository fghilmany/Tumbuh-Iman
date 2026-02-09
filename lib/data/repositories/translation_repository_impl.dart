import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';
import 'package:tumbuh_iman/core/services/firebase_remote_config_service.dart';
import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/data/local/translation/translation_local_datasource.dart';
import 'package:tumbuh_iman/data/models/translations_model.dart';
import 'package:tumbuh_iman/data/remote/translation/translation_remote_datasource.dart';
import 'package:tumbuh_iman/domain/repositories/translation/translations_repositories.dart';

import '../../domain/entities/translation/translation_entity.dart';

@Injectable(as: TranslationRepository)
class TranslationRepositoryImpl implements TranslationRepository {
  final TranslationRemoteDataSource _remoteDataSource;
  final TranslationLocalDataSource _localDataSource;
  final FirebaseRemoteConfigService _remoteConfigService;
  final Talker _talker;

  TranslationRepositoryImpl(
      this._remoteDataSource,
      this._localDataSource,
      this._remoteConfigService,
      this._talker,
      );

  @override
  Future<Result<TranslationEntity>> getTranslations(String locale) async {
    try {
      _talker.info('🌍 Starting translation flow for locale: $locale');

      // STEP 1: Get Remote Config version (NOW ASYNC!)
      _talker.debug('Step 1: Getting Remote Config version...');
      final remoteVersion = await _remoteConfigService.getTranslationVersion(); // Added await
      final remoteVersionString = remoteVersion?.version;

      // STEP 2: Get saved local version
      final savedVersion = _localDataSource.getSavedVersion();

      _talker.info('📦 Remote version: $remoteVersionString');
      _talker.info('💾 Saved version: $savedVersion');

      // STEP 3: Compare versions
      final needsUpdate = savedVersion == null ||
          remoteVersionString == null ||
          savedVersion != remoteVersionString;

      if (needsUpdate) {
        _talker.info('🔄 Version mismatch, fetching from remote...');

        try {
          final remoteTranslations = await _remoteDataSource.getTranslations(locale);

          if (remoteTranslations.translations.isNotEmpty) {
            _talker.info('✅ Fetched ${remoteTranslations.translations.length} keys');

            await _localDataSource.cacheTranslations(remoteTranslations);

            if (remoteVersionString != null) {
              await _localDataSource.saveVersion(remoteVersionString);
              _talker.info('✅ Saved version: $remoteVersionString');
            }

            return Result.success(remoteTranslations);
          }
        } catch (remoteError, _) {
          _talker.warning('⚠️ Remote fetch failed', remoteError);
        }
      } else {
        _talker.info('✅ Version matches, using cache');
      }

      // Try cache
      final cachedTranslations = await _localDataSource.getCachedTranslations(locale);

      if (cachedTranslations != null && cachedTranslations.translations.isNotEmpty) {
        _talker.info('✅ Using cached translations');
        return Result.success(cachedTranslations);
      }

      // Fallback to file
      final fileTranslations = await _localDataSource.getTranslationsFromFile(locale);

      if (fileTranslations.translations.isNotEmpty) {
        _talker.info('✅ Loaded from file');

        try {
          await _localDataSource.cacheTranslations(fileTranslations);
        } catch (e) {
          _talker.warning('Failed to cache file translations', e);
        }

        return Result.success(fileTranslations);
      }

      return Result.failure(
        'No translations available',
        exception: Exception('Translation not found'),
      );
    } catch (e, stackTrace) {
      _talker.error('❌ Error in translation flow', e, stackTrace);
      return Result.failure(
        'Failed to load translations: ${e.toString()}',
        exception: e is Exception ? e : Exception(e.toString()),
      );
    }
  }

  @override
  Future<Result<void>> saveTranslationsToLocal(TranslationEntity entity) async {
    try {
      _talker.debug('Saving translations to local for locale: ${entity.locale}');

      final model = TranslationModel.fromEntity(entity);
      await _localDataSource.cacheTranslations(model);

      _talker.info('✅ Translations saved to local');
      return const Result.success(null);
    } catch (e, stackTrace) {
      _talker.error('❌ Error saving translations', e, stackTrace);
      return Result.failure(
        'Failed to save translations: ${e.toString()}',
        exception: e is Exception ? e : Exception(e.toString()),
      );
    }
  }

  @override
  Future<Result<void>> clearCache() async {
    try {
      _talker.debug('Clearing translation cache and version');
      await _localDataSource.clearCache();
      await _localDataSource.clearVersion();
      _talker.info('✅ Cache and version cleared');
      return const Result.success(null);
    } catch (e, stackTrace) {
      _talker.error('❌ Error clearing cache', e, stackTrace);
      return Result.failure(
        'Failed to clear cache: ${e.toString()}',
        exception: e is Exception ? e : Exception(e.toString()),
      );
    }
  }
}