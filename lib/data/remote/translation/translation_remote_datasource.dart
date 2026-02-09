import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';
import 'package:tumbuh_iman/core/services/firebase_remote_config_service.dart';
import 'package:tumbuh_iman/data/models/translations_model.dart';

abstract class TranslationRemoteDataSource {
  Future<TranslationModel> getTranslations(String locale);
}

@Injectable(as: TranslationRemoteDataSource)
class TranslationRemoteDataSourceImpl implements TranslationRemoteDataSource {
  final FirebaseRemoteConfigService _remoteConfigService;
  final Talker _talker;

  TranslationRemoteDataSourceImpl(
      this._remoteConfigService,
      this._talker,
      );

  @override
  Future<TranslationModel> getTranslations(String locale) async {
    try {
      _talker.debug('Fetching translations from Firebase for locale: $locale');

      // Get translation JSON (no version inside)
      final jsonString = await _remoteConfigService.getTranslationJson(locale);
      final json = jsonDecode(jsonString) as Map<String, dynamic>;

      if (json.isEmpty) {
        throw Exception('Empty translation data from Firebase');
      }

      _talker.info('✅ Fetched translations: $locale (${json.length} keys)');

      return TranslationModel(
        locale: locale,
        translations: json,
        lastUpdated: DateTime.now(),
      );
    } catch (e, stackTrace) {
      _talker.error('❌ Error fetching remote translations', e, stackTrace);
      rethrow;
    }
  }
}