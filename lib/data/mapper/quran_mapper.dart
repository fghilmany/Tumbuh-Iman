import 'package:tumbuh_iman/data/models/quran/quran_list_response_model.dart';
import 'package:tumbuh_iman/data/models/quran/surah_model.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_item_entity.dart';

extension QuranMapper on QuranListResponseModel {
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
      name: latinName,
      numberOfAyah: numberOfAyah,
      placeOfRevelation: placeOfRevelation,
      meaning: meaning,
    );
  }
}
