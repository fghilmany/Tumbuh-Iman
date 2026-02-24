import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';
import 'package:tumbuh_iman/domain/entities/quran/surah_entity.dart';

abstract interface class QuranRepository {
  /// Get list of all surahs (114 surahs)
  Future<Result<QuranEntity?>> getSurahList({bool onlyStore = false});

  /// Get detail of a surah by its number
  Future<Result<SurahEntity?>> getSurahById(int id);

  /// Set bookmark status of a surah
  Future<Result<void>> setBookmarkStatus(int surahNumber, bool isBookmarked);

  /// Get bookmarked surahs
  Future<Result<int>> getBookmarkedSurahId();

  /// Set last read surah
  Future<Result<void>> setLastReadSurah(int surahNumber, {int? ayahNumber});

  /// Get last read surah
  Future<Result<int>> getLastReadSurahId();
}