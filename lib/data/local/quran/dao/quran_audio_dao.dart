import 'package:drift/drift.dart';
import 'package:tumbuh_iman/data/local/database/app_database.dart';
import 'package:tumbuh_iman/data/local/quran/tables/quran_audio_table.dart';

part 'quran_audio_dao.g.dart';

/// Data Access Object for Quran Audio operations
@DriftAccessor(tables: [QuranAudioTable])
class QuranAudioDao extends DatabaseAccessor<AppDatabase> with _$QuranAudioDaoMixin {
  QuranAudioDao(super.db);

  /// Get audio by ID
  Future<QuranAudioTableData?> getAudioById(int id) {
    return (select(quranAudioTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// Insert or update audio
  Future<int> insertOrUpdateAudio(QuranAudioTableCompanion audio) {
    return into(quranAudioTable).insertOnConflictUpdate(audio);
  }

  /// Insert or update multiple audios (batch operation)
  Future<void> insertOrUpdateAudios(List<QuranAudioTableCompanion> audios) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(quranAudioTable, audios);
    });
  }

  /// Delete audio by ID
  Future<int> deleteAudioById(int id) {
    return (delete(quranAudioTable)..where((t) => t.id.equals(id))).go();
  }

  /// Get all audios for a specific ayah
  Future<List<QuranAudioTableData>> getAudiosForAyah(int ayahId) {
    return (select(quranAudioTable)..where((t) => t.ayahId.equals(ayahId)))
        .get();
  }

  /// Get audio for a specific ayah and reciter
  Future<QuranAudioTableData?> getAudioForAyah(
      int ayahId, String reciterId) {
    return (select(quranAudioTable)
          ..where((t) =>
              t.ayahId.equals(ayahId)))
        .getSingleOrNull();
  }

  /// Delete audios by ayah IDs
  Future<int> deleteAudiosByAyahIds(List<int> ayahIds) {
    return (delete(quranAudioTable)..where((t) => t.ayahId.isIn(ayahIds)))
        .go();
  }

  /// Delete all audios
  Future<int> deleteAllAudios() {
    return delete(quranAudioTable).go();
  }

}

