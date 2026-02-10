
class QuranItemEntity {
  final int id;
  final String name;
  final int numberOfAyah;
  final String placeOfRevelation;
  final String meaning;
  final bool? isBookmarked;
  final bool? isLastRead;

  QuranItemEntity({
    required this.id,
    required this.name,
    required this.numberOfAyah,
    required this.placeOfRevelation,
    required this.meaning,
    this.isBookmarked = false,
    this.isLastRead = false,
  });

}
