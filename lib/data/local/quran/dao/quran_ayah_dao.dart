import 'package:drift/drift.dart';
import 'package:tumbuh_iman/data/local/database/app_database.dart';
import 'package:tumbuh_iman/data/local/quran/tables/quran_ayah_table.dart';

part 'quran_ayah_dao.g.dart';

/// Data Access Object for Quran Ayah operations
@DriftAccessor(tables: [QuranAyahTable])
class QuranAyahDao extends DatabaseAccessor<AppDatabase> with _$QuranAyahDaoMixin {
  QuranAyahDao(super.db);

  /// Get all ayahs for a specific surah
  Future<List<QuranAyahTableData>> getAyahsBySurahNumber(int surahNumber) {
    return (select(quranAyahTable)
          ..where((t) => t.surahNumber.equals(surahNumber))
          ..orderBy([(t) => OrderingTerm(expression: t.ayahNumber)]))
        .get();
  }

  /// Get a specific ayah
  Future<QuranAyahTableData?> getAyah(int surahNumber, int ayahNumber) {
    return (select(quranAyahTable)
          ..where((t) =>
              t.surahNumber.equals(surahNumber) & t.ayahNumber.equals(ayahNumber)))
        .getSingleOrNull();
  }

  /// Get ayah by ID
  Future<QuranAyahTableData?> getAyahById(int id) {
    return (select(quranAyahTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// Insert or update ayah
  Future<int> insertOrUpdateAyah(QuranAyahTableCompanion ayah) {
    return into(quranAyahTable).insertOnConflictUpdate(ayah);
  }

  /// Insert or update multiple ayahs (batch operation)
  Future<void> insertOrUpdateAyahs(List<QuranAyahTableCompanion> ayahs) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(quranAyahTable, ayahs);
    });
  }


  /// Delete ayahs by surah number
  Future<int> deleteAyahsBySurahNumber(int surahNumber) {
    return (delete(quranAyahTable)..where((t) => t.surahNumber.equals(surahNumber)))
        .go();
  }

  /// Delete all ayahs
  Future<int> deleteAllAyahs() {
    return delete(quranAyahTable).go();
  }

  /// Search ayahs by text (Arabic or translation)
  Future<List<QuranAyahTableData>> searchAyahs(String query) {
    final lowerQuery = query.toLowerCase();
    return (select(quranAyahTable)
          ..where((t) =>
              t.translationId.lower().contains(lowerQuery))
          ..orderBy([
            (t) => OrderingTerm(expression: t.surahNumber),
            (t) => OrderingTerm(expression: t.ayahNumber),
          ]))
        .get();
  }

  /// Get total count of ayahs
  Future<int> getAyahCount() async {
    final count = await (selectOnly(quranAyahTable)
          ..addColumns([quranAyahTable.id.count()]))
        .getSingle();
    return count.read(quranAyahTable.id.count()) ?? 0;
  }

  /// Get ayah count for a specific surah
  Future<int> getAyahCountBySurah(int surahNumber) async {
    final count = await (selectOnly(quranAyahTable)
          ..addColumns([quranAyahTable.id.count()])
          ..where(quranAyahTable.surahNumber.equals(surahNumber)))
        .getSingle();
    return count.read(quranAyahTable.id.count()) ?? 0;
  }

  /// Watch ayahs for a specific surah (reactive stream)
  Stream<List<QuranAyahTableData>> watchAyahsBySurahNumber(int surahNumber) {
    return (select(quranAyahTable)
          ..where((t) => t.surahNumber.equals(surahNumber))
          ..orderBy([(t) => OrderingTerm(expression: t.ayahNumber)]))
        .watch();
  }

}

