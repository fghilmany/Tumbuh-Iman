import 'package:tumbuh_iman/data/local/quran/dao/quran_dao.dart';
import 'package:tumbuh_iman/data/remote/responses/quran/ayah_model.dart';
import 'package:tumbuh_iman/data/remote/responses/quran/quran_list_response_model.dart';
import 'package:tumbuh_iman/data/remote/responses/quran/surah_detail_model.dart';
import 'package:tumbuh_iman/data/remote/responses/quran/surah_model.dart';
import 'package:tumbuh_iman/domain/entities/quran/ayah_entity.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_item_entity.dart';
import 'package:tumbuh_iman/domain/entities/quran/surah_entity.dart';

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

extension AyahToEntity on SurahWithDetails {
  SurahEntity toEntity() {
    return SurahEntity(
      id: surah.surahNumber,
      name: surah.name,
      latinName: surah.nameLatin,
      meaning: surah.meaning,
      numberOfAyahs: surah.numberOfAyah,
      revelationPlace: surah.placeOfRevelation,
      listAyah: ayahs.map((ayah) => AyahEntity(
        id: ayah.ayahNumber,
        arabText: ayah.arabicText,
        latinText: ayah.latinText,
        translation: ayah.translationId,
        audioUrl: ayah.audioUrls,
      )).toList(),
    );
  }
}

extension QuranDetailResponseMapper on SurahDetailModel {
  SurahEntity toEntity() {
    return SurahEntity(
      id: number,
      name: name,
      latinName: latinName,
      meaning: meaning,
      numberOfAyahs: numberOfAyah,
      revelationPlace: placeOfRevelation,
      listAyah: ayat.map((ayah) => ayah.toEntity()).toList(),
    );
  }
}

extension AyahMapper on AyahModel {
  AyahEntity toEntity() {
    return AyahEntity(
      id: number,
      arabText: arabicText,
      latinText: latinText,
      translation: indonesianText,
      audioUrl: audio["01"],
    );
  }
}

