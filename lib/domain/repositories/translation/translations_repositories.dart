import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/domain/entities/translation/translation_entity.dart';

abstract class TranslationRepository {
  /// Get translations following the flow:
  /// 1. Try remote API (Firebase Remote Config)
  /// 2. If success -> save to local -> return
  /// 3. If fail -> try local cache
  /// 4. If no cache -> load from JSON file
  Future<Result<TranslationEntity>> getTranslations(String locale);

  /// Save translations to local storage
  Future<Result<void>> saveTranslationsToLocal(TranslationEntity entity);

  /// Clear cached translations
  Future<Result<void>> clearCache();
}