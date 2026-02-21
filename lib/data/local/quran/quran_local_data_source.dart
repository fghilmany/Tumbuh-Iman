import 'package:tumbuh_iman/data/local/quran/dao/quran_dao.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';
import 'package:tumbuh_iman/domain/entities/quran/surah_entity.dart';

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

  /// Get surah details by id
  Future<SurahWithDetails?> getSurahById(int surahNumber);

  /// store ayahs
  Future<void> storeAyahs(SurahEntity surah);

  /// Check if database has ayahs for a surah
  Future<bool> hasAyahsForSurah(int surahNumber);
}
