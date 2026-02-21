class AyahEntity {
  final int id;
  final String arabText;
  final String latinText;
  final String translation;
  final String? audioUrl;

  AyahEntity({
    required this.id,
    required this.arabText,
    required this.latinText,
    required this.translation,
    this.audioUrl,
  });
}