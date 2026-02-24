import 'package:drift/drift.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:tumbuh_iman/data/local/database/app_database.dart';
import 'package:tumbuh_iman/data/local/quran/dao/quran_dao.dart';
import 'package:tumbuh_iman/data/local/quran/quran_local_data_source.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';
import 'package:tumbuh_iman/domain/entities/quran/surah_entity.dart';

class QuranLocalDataSourceImpl implements QuranLocalDataSource {
  final AppDatabase _database;
  final Talker _talker;

  QuranLocalDataSourceImpl(this._database, this._talker);

  @override
  Future<List<SurahWithDetails>?> getListSurah() async {
    try {
      _talker.debug('📖 Getting cached surah list from database...');

      final surahs = await _database.quranDao.getAllSurahs();

      if (surahs.isEmpty) {
        _talker.debug('No cached surah list found in database');
        return null;
      }

      // Get each surah with its details (ayahs and audio)
      final surahDetailsList = <SurahWithDetails>[];
      for (final surah in surahs) {
        final details = await _database.quranDao.getSurahWithDetails(
            surah.surahNumber);
        if (details != null) {
          surahDetailsList.add(details);
        }
      }

      _talker.info(
          '✅ Found ${surahDetailsList.length} surahs with details in database');
      return surahDetailsList;
    } catch (e, stackTrace) {
      _talker.error('❌ Error getting cached surah list', e, stackTrace);
      return null;
    }
  }

  @override
  Future<void> storeSurahList(QuranEntity data) async {
    try {
      _talker.debug('💾 Caching ${data.listSurah.length} surahs to database...');

      // Convert models to database companions
      final companions = data.listSurah.map((surah) {
        return QuranSurahTableCompanion.insert(
          surahNumber: Value(surah.id),
          name: surah.name,
          nameLatin: surah.latinName,
          numberOfAyah: surah.numberOfAyah,
          placeOfRevelation: surah.placeOfRevelation,
          meaning: surah.meaning,
          description: surah.description,
          isBookmarked: const Value(false),
          isLastRead: const Value(false),
          lastReadAyah: const Value(null),
        );
      }).toList();

      // Insert all surahs
      await _database.quranDao.insertOrUpdateSurahs(companions);

      _talker.info('✅ Cached ${data.listSurah.length} surahs to database');
    } catch (e, stackTrace) {
      _talker.error('❌ Error caching surah list', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> deleteAllQuran() async {
    try {
      _talker.debug('🗑️ Clearing Quran cache from database...');

      await _database.quranDao.deleteAllSurahs();

      _talker.info('✅ Quran cache cleared from database');
    } catch (e, stackTrace) {
      _talker.error('❌ Error clearing cache', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<int> getBookmarkedSurahs() async {
    try {
      _talker.debug('📚 Getting bookmarked surahs...');

      final surahs = await _database.quranDao.getBookmarkedSurahs();

      // Get the first bookmarked surah with details
      final details = await _database.quranDao.getSurahWithDetails(
          surahs.first.surahNumber);

      if (details == null) {
        throw Exception('Surah details not found');
      }

      _talker.info('✅ Found bookmarked surah: ${details.surah.nameLatin}');
      return details.surah.surahNumber;
    } catch (e, stackTrace) {
      _talker.error('❌ Error getting bookmarked surahs', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> updateBookmarkStatus(int surahNumber, bool isBookmarked) async {
    try {
      _talker.debug('🔖 Clearing previous bookmarks and updating bookmark status for surah $surahNumber...');

      await _database.quranDao.updateBookmarkStatus(surahNumber, isBookmarked);

      _talker.info('✅ Updated bookmark status');
    } catch (e, stackTrace) {
      _talker.error('❌ Error updating bookmark status', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<SurahWithDetails?> getLastReadSurah() async {
    try {
      _talker.debug('📖 Getting last read surah...');

      final surah = await _database.quranDao.getLastReadSurah();

      if (surah == null) {
        _talker.debug('No last read surah found');
        return null;
      }

      // Get surah with all details (ayahs and audio)
      final details = await _database.quranDao.getSurahWithDetails(
          surah.surahNumber);

      if (details != null) {
        _talker.info('✅ Found last read surah: ${details.surah.nameLatin}');
      }

      return details;
    } catch (e, stackTrace) {
      _talker.error('❌ Error getting last read surah', e, stackTrace);
      return null;
    }
  }

  @override
  Future<void> setLastReadSurah(int surahNumber, {int? ayahNumber}) async {
    try {
      _talker.debug(
          '📍 Clearing previous last read and setting last read surah: $surahNumber, ayah: $ayahNumber');

      await _database.quranDao.setLastReadSurah(
          surahNumber, ayahNumber: ayahNumber);

      _talker.info('✅ Set last read surah');
    } catch (e, stackTrace) {
      _talker.error('❌ Error setting last read surah', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<bool> hasData() async {
    try {
      final isEmpty = await _database.quranDao.isEmpty();
      return !isEmpty;
    } catch (e, stackTrace) {
      _talker.error('❌ Error checking if database has data', e, stackTrace);
      return false;
    }
  }

  @override
  Future<SurahWithDetails?> getSurahById(int surahNumber) async {
    try {
      _talker.debug('🔍 Getting surah details for surah number $surahNumber...');

      final details = await _database.quranDao.getSurahWithDetails(surahNumber);

      if (details == null) {
        _talker.debug('No details found for surah number $surahNumber');
      } else {
        _talker.info('✅ Found details for surah: ${details.surah.nameLatin}');
      }

      return details;
    } catch (e, stackTrace) {
      _talker.error('❌ Error getting surah details', e, stackTrace);
      return null;
    }
  }

  @override
  Future<void> storeAyahs(SurahEntity surah) async {
    try {
      _talker.debug('💾 Caching ${surah.listAyah.length} ayahs for surah ${surah
          .name} to database...');

      // Convert models to database companions
      final List<QuranAyahTableCompanion> companions = surah.listAyah.map((
          ayah) {
        return QuranAyahTableCompanion.insert(
          surahNumber: surah.id,
          ayahNumber: ayah.id,
          arabicText: ayah.arabText,
          translationId: ayah.translation,
          latinText: ayah.arabText,
          audioUrls: Value(ayah.audioUrl),
        );
      }).toList();

      // Insert all ayahs
      await _database.quranAyahDao.insertOrUpdateAyahs(companions);

      _talker.info('✅ Cached ${surah.listAyah.length} ayahs for surah ${surah
          .name} to database');
    } catch (e, stackTrace) {
      _talker.error(
          '❌ Error caching ayahs for surah ${surah.name}', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<bool> hasAyahsForSurah(int surahNumber) async {
    try {
      final hasAyahs = await _database.quranAyahDao.hasAyahsForSurah(
          surahNumber);
      return hasAyahs;
    } catch (e, stackTrace) {
      _talker.error('❌ Error checking if database has data', e, stackTrace);
      return false;
    }
  }
}
