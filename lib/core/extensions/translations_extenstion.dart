import 'package:flutter/material.dart';
import 'package:tumbuh_iman/core/services/translation_service.dart';
import 'package:tumbuh_iman/di/injection.dart';

extension TranslationExtension on String {
  /// Translate this string key
  /// Usage: 'welcome'.tr or 'quran.title'.tr
  String get tr {
    final service = getIt<TranslationService>();
    return service.translate(this);
  }

  /// Translate with parameters
  /// Usage: 'welcome_user'.trParams({'name': 'John'})
  String trParams(Map<String, String> params) {
    final service = getIt<TranslationService>();
    String translation = service.translate(this);

    params.forEach((key, value) {
      translation = translation.replaceAll('{$key}', value);
    });

    return translation;
  }

  /// Translate with fallback
  /// Usage: 'welcome'.trWithFallback('Welcome!')
  String trWithFallback(String fallback) {
    final service = getIt<TranslationService>();
    return service.translate(this, fallback: fallback);
  }

  /// Translate with fallback and parameters
  /// Usage: 'welcome_user'.trWithParams('Hello {name}', {'name': 'John'})
  String trWithParams(String fallback, Map<String, String> params) {
    final service = getIt<TranslationService>();
    String translation = service.translate(this, fallback: fallback);

    params.forEach((key, value) {
      translation = translation.replaceAll('{$key}', value);
    });

    return translation;
  }
}

extension TranslationContextExtension on BuildContext {
  /// Get translation service from context
  TranslationService get translations => getIt<TranslationService>();

  /// Quick translate method
  String tr(String key, {String? fallback}) {
    return getIt<TranslationService>().translate(key, fallback: fallback);
  }

  /// Translate with parameters from context
  /// Usage: context.trParams('welcome_user', {'name': 'John'})
  String trParams(String key, Map<String, String> params, {String? fallback}) {
    String translation = getIt<TranslationService>().translate(key, fallback: fallback);

    params.forEach((key, value) {
      translation = translation.replaceAll('{$key}', value);
    });

    return translation;
  }
}