import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';
import 'package:tumbuh_iman/domain/entities/quran/surah_entity.dart';

abstract interface class GetQuranUseCase {
  /// Get list of all surahs (114 surahs)
  Future<Result<QuranEntity?>> getSurahList({bool onlyStore = false});
  /// Get detail of surah by id (number)
  /// [id] is the number of the surah (1-114)
  Future<Result<SurahEntity?>> getSurahById(int id);
  /// Set bookmark status of a surah
  Future<Result<void>> setBookmarkStatus(int surahNumber, bool isBookmarked);
  /// Get bookmarked surah id
  Future<Result<int>> getBookmarkedSurahId();
  /// Set last read surah
  Future<Result<void>> setLastReadSurah(int surahNumber, {int? ayahNumber});
  /// Get last read surah id
  Future<Result<int>> getLastReadSurahId();
}