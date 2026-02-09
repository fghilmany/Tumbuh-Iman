import 'package:equatable/equatable.dart';

class TranslationEntity extends Equatable {
  final String locale;
  final Map<String, dynamic> translations;
  final DateTime? lastUpdated;

  const TranslationEntity({
    required this.locale,
    required this.translations,
    this.lastUpdated,
  });

  @override
  List<Object?> get props => [locale, translations, lastUpdated];
}