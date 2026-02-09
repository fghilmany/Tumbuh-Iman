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

  /// Translate with fallback
  /// Usage: 'welcome'.trWithFallback('Welcome!')
  String trWithFallback(String fallback) {
    final service = getIt<TranslationService>();
    return service.translate(this, fallback: fallback);
  }
}

extension TranslationContextExtension on BuildContext {
  /// Get translation service from context
  TranslationService get translations => getIt<TranslationService>();

  /// Quick translate method
  String tr(String key, {String? fallback}) {
    return getIt<TranslationService>().translate(key, fallback: fallback);
  }
}