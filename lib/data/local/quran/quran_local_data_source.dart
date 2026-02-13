import 'package:tumbuh_iman/data/local/quran/dao/quran_dao.dart';
import 'package:tumbuh_iman/data/models/quran/quran_list_response_model.dart';
import 'package:tumbuh_iman/data/models/quran/surah_model.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';

/// Abstract interface for Quran local data source
abstract interface class QuranLocalDataSource {
  /// Get cached surah list from database
  Future<List<SurahWithDetails>?> getListSurah();

  /// Cache surah list to database
  Future<void> storeSurahList(QuranEntity data);

  /// Clear all cached Quran data
  Future<void> deleteAllQuran();

  /// Get bookmarked surahs
  Future<SurahWithDetails> getBookmarkedSurahs();

  /// Update bookmark status
  Future<void> updateBookmarkStatus(int surahNumber, bool isBookmarked);

  /// Get last read surah
  Future<SurahWithDetails?> getLastReadSurah();

  /// Set last read surah
  Future<void> setLastReadSurah(int surahNumber, {int? ayahNumber});

  /// Check if database has data
  Future<bool> hasData();
}
