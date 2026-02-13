import 'package:drift/drift.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tumbuh_iman/data/local/database/app_database.dart';
import 'package:tumbuh_iman/data/local/quran/tables/quran_surah_table.dart';
import 'package:tumbuh_iman/data/local/quran/tables/quran_ayah_table.dart';
import 'package:tumbuh_iman/data/local/quran/tables/quran_audio_table.dart';

part 'quran_dao.g.dart';

/// Data Access Object for Quran operations
@DriftAccessor(tables: [QuranSurahTable, QuranAyahTable, QuranAudioTable])
class QuranDao extends DatabaseAccessor<AppDatabase> with _$QuranDaoMixin {
  QuranDao(super.db);

  /// Get surah with all its ayahs and audio
  Future<SurahWithDetails?> getSurahWithDetails(int surahNumber) async {
    // Get surah
    final surah = await (select(quranSurahTable)
          ..where((t) => t.surahNumber.equals(surahNumber)))
        .getSingleOrNull();

    if (surah == null) return null;

    // Get all ayahs for this surah
    final ayahs = await (select(quranAyahTable)
          ..where((t) => t.surahNumber.equals(surahNumber))
          ..orderBy([(t) => OrderingTerm(expression: t.ayahNumber)]))
        .get();

    // Get all audio for these ayahs
    final ayahIds = ayahs.map((a) => a.id).toList();
    final audios = ayahIds.isEmpty
        ? <QuranAudioTableData>[]
        : await (select(quranAudioTable)
              ..where((t) => t.ayahId.isIn(ayahIds)))
            .get();

    return SurahWithDetails(
      surah: surah,
      ayahs: ayahs,
      audios: audios,
    );
  }

  /// Watch surah with all its ayahs and audio (reactive stream)
  Stream<SurahWithDetails?> watchSurahWithDetails(int surahNumber) {
    return Rx.combineLatest3(
      (select(quranSurahTable)
            ..where((t) => t.surahNumber.equals(surahNumber)))
          .watchSingleOrNull(),
      (select(quranAyahTable)
            ..where((t) => t.surahNumber.equals(surahNumber))
            ..orderBy([(t) => OrderingTerm(expression: t.ayahNumber)]))
          .watch(),
      select(quranAudioTable).watch(),
      (surah, ayahs, allAudios) {
        if (surah == null) return null;

        final ayahIds = ayahs.map((a) => a.id).toSet();
        final relevantAudios = allAudios
            .where((audio) => ayahIds.contains(audio.ayahId))
            .toList();

        return SurahWithDetails(
          surah: surah,
          ayahs: ayahs,
          audios: relevantAudios,
        );
      },
    );
  }

  /// Get all surahs
  Future<List<QuranSurahTableData>> getAllSurahs() {
    return (select(quranSurahTable)
          ..orderBy([(t) => OrderingTerm(expression: t.surahNumber)]))
        .get();
  }

  /// Get surah by number
  Future<QuranSurahTableData?> getSurahByNumber(int surahNumber) {
    return (select(quranSurahTable)
          ..where((t) => t.surahNumber.equals(surahNumber)))
        .getSingleOrNull();
  }


  /// Get bookmarked surahs
  Future<List<QuranSurahTableData>> getBookmarkedSurahs() {
    return (select(quranSurahTable)
          ..where((t) => t.isBookmarked.equals(true))
          ..orderBy([(t) => OrderingTerm(expression: t.surahNumber)]))
        .get();
  }

  /// Get last read surah
  Future<QuranSurahTableData?> getLastReadSurah() {
    return (select(quranSurahTable)..where((t) => t.isLastRead.equals(true)))
        .getSingleOrNull();
  }

  /// Insert or update surah
  Future<int> insertOrUpdateSurah(QuranSurahTableCompanion surah) {
    return into(quranSurahTable).insertOnConflictUpdate(surah);
  }

  /// Insert or update multiple surahs
  Future<void> insertOrUpdateSurahs(List<QuranSurahTableCompanion> surahs) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(quranSurahTable, surahs);
    });
  }

  /// Update bookmark status
  Future<int> updateBookmarkStatus(int surahNumber, bool isBookmarked) {
    return (update(quranSurahTable)
          ..where((t) => t.surahNumber.equals(surahNumber)))
        .write(QuranSurahTableCompanion(
      isBookmarked: Value(isBookmarked),
      updatedAt: Value(DateTime.now()),
    ));
  }

  /// Set last read surah
  Future<void> setLastReadSurah(int surahNumber, {int? ayahNumber}) async {
    // First, clear all last read flags
    await (update(quranSurahTable)..where((t) => t.isLastRead.equals(true)))
        .write(const QuranSurahTableCompanion(
      isLastRead: Value(false),
    ));

    // Then set the new last read surah
    await (update(quranSurahTable)
          ..where((t) => t.surahNumber.equals(surahNumber)))
        .write(QuranSurahTableCompanion(
      isLastRead: const Value(true),
      lastReadAyah: Value(ayahNumber),
      updatedAt: Value(DateTime.now()),
    ));
  }

  /// Clear last read status
  Future<void> clearLastReadStatus() {
    return (update(quranSurahTable)..where((t) => t.isLastRead.equals(true)))
        .write(const QuranSurahTableCompanion(
      isLastRead: Value(false),
    ));
  }

  /// Delete surah by number
  Future<int> deleteSurahByNumber(int surahNumber) {
    return (delete(quranSurahTable)
          ..where((t) => t.surahNumber.equals(surahNumber)))
        .go();
  }

  /// Delete all surahs
  Future<int> deleteAllSurahs() {
    return delete(quranSurahTable).go();
  }

  /// Search surahs by name or meaning
  Future<List<QuranSurahTableData>> searchSurahs(String query) {
    final lowerQuery = query.toLowerCase();
    return (select(quranSurahTable)
          ..where((t) =>
              t.name.lower().contains(lowerQuery) |
              t.nameLatin.lower().contains(lowerQuery) |
              t.meaning.lower().contains(lowerQuery))
          ..orderBy([(t) => OrderingTerm(expression: t.surahNumber)]))
        .get();
  }

  /// Check if surahs table is empty
  Future<bool> isEmpty() async {
    final count = await (selectOnly(quranSurahTable)
          ..addColumns([quranSurahTable.surahNumber.count()]))
        .getSingle();
    return count.read(quranSurahTable.surahNumber.count()) == 0;
  }

  /// Get total count of surahs
  Future<int> getSurahCount() async {
    final count = await (selectOnly(quranSurahTable)
          ..addColumns([quranSurahTable.surahNumber.count()]))
        .getSingle();
    return count.read(quranSurahTable.surahNumber.count()) ?? 0;
  }

  /// Watch all surahs (reactive stream)
  Stream<List<QuranSurahTableData>> watchAllSurahs() {
    return (select(quranSurahTable)
          ..orderBy([(t) => OrderingTerm(expression: t.surahNumber)]))
        .watch();
  }

  /// Watch bookmarked surahs (reactive stream)
  Stream<List<QuranSurahTableData>> watchBookmarkedSurahs() {
    return (select(quranSurahTable)
          ..where((t) => t.isBookmarked.equals(true))
          ..orderBy([(t) => OrderingTerm(expression: t.surahNumber)]))
        .watch();
  }

  /// Watch last read surah (reactive stream)
  Stream<QuranSurahTableData?> watchLastReadSurah() {
    return (select(quranSurahTable)..where((t) => t.isLastRead.equals(true)))
        .watchSingleOrNull();
  }
}

/// Data class to hold surah with its ayahs and audio
class SurahWithDetails {
  final QuranSurahTableData surah;
  final List<QuranAyahTableData> ayahs;
  final List<QuranAudioTableData> audios;

  SurahWithDetails({
    required this.surah,
    required this.ayahs,
    required this.audios,
  });

  /// Get audio for a specific ayah and reciter
  QuranAudioTableData? getAudioForAyah(int ayahId, String reciterId) {
    try {
      return audios.firstWhere(
        (audio) => audio.ayahId == ayahId,
      );
    } catch (e) {
      return null;
    }
  }

  /// Get all audio for a specific ayah
  List<QuranAudioTableData> getAudiosForAyah(int ayahId) {
    return audios.where((audio) => audio.ayahId == ayahId).toList();
  }

}
