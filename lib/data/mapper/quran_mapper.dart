import 'package:tumbuh_iman/data/local/quran/dao/quran_dao.dart';
import 'package:tumbuh_iman/data/models/quran/quran_list_response_model.dart';
import 'package:tumbuh_iman/data/models/quran/surah_model.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_item_entity.dart';

extension QuranListResponseMapper on QuranListResponseModel {
  QuranEntity toEntity() {
    final listSurah = (data)
        .map((item) => item.toEntity())
        .toList();

    return QuranEntity(
      listSurah: listSurah,
    );
  }
}

extension SurahMapper on SurahModel {
  QuranItemEntity toEntity() {
    return QuranItemEntity(
      id: number,
      name: name,
      latinName: latinName,
      numberOfAyah: numberOfAyah,
      placeOfRevelation: placeOfRevelation,
      meaning: meaning,
      description: description,
    );
  }
}

extension SurahListToQuranEntity on List<SurahWithDetails>? {
  QuranEntity toEntity() {
    if (this == null || this!.isEmpty) {
      throw Exception('No local data available');
    }
    return QuranEntity(listSurah: this!.map((item) => QuranItemEntity(
          id: item.surah.surahNumber,
          name: item.surah.name,
          latinName: item.surah.nameLatin,
          numberOfAyah: item.surah.numberOfAyah,
          placeOfRevelation: item.surah.placeOfRevelation,
          meaning: item.surah.meaning,
          description: item.surah.description,
          isBookmarked: item.surah.isBookmarked,
          isLastRead: item.surah.isLastRead,
        )).toList());
  }
}
