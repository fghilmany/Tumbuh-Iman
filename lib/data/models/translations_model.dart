import 'package:tumbuh_iman/domain/entities/translation/translation_entity.dart';

class TranslationModel extends TranslationEntity {
  const TranslationModel({
    required super.locale,
    required super.translations,
    super.lastUpdated,
  });

  /// From JSON (for local storage)
  factory TranslationModel.fromJson(Map<String, dynamic> json) {
    return TranslationModel(
      locale: json['locale'] as String,
      translations: json['translations'] as Map<String, dynamic>,
      lastUpdated: json['lastUpdated'] != null
          ? DateTime.parse(json['lastUpdated'] as String)
          : null,
    );
  }

  /// To JSON (for local storage)
  Map<String, dynamic> toJson() {
    return {
      'locale': locale,
      'translations': translations,
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }

  /// From Entity
  factory TranslationModel.fromEntity(TranslationEntity entity) {
    return TranslationModel(
      locale: entity.locale,
      translations: entity.translations,
      lastUpdated: entity.lastUpdated,
    );
  }
}