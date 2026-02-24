import 'package:tumbuh_iman/domain/entities/quran/ayah_entity.dart';

class SurahEntity {
  final int id;
  final String name;
  final String latinName;
  final String meaning;
  final int numberOfAyahs;
  final String revelationPlace;
  final List<AyahEntity> listAyah;
  final bool? isBookmarked;

  SurahEntity({
    required this.id,
    required this.name,
    required this.latinName,
    required this.meaning,
    required this.numberOfAyahs,
    required this.revelationPlace,
    required this.listAyah,
    this.isBookmarked,
  });
}