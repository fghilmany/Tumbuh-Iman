import 'package:drift/drift.dart';
import 'package:tumbuh_iman/data/local/quran/dao/quran_audio_dao.dart';
import 'package:tumbuh_iman/data/local/quran/dao/quran_ayah_dao.dart';
import 'package:tumbuh_iman/data/local/quran/dao/quran_dao.dart';
import 'package:tumbuh_iman/data/local/quran/tables/quran_audio_table.dart';
import 'package:tumbuh_iman/data/local/quran/tables/quran_ayah_table.dart';
import 'package:tumbuh_iman/data/local/quran/tables/quran_surah_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    QuranSurahTable,
    QuranAyahTable,
    QuranAudioTable,
  ],
  daos: [
    QuranDao,
    QuranAyahDao,
    QuranAudioDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle migrations between versions
        if (from < 3) {

        }
        if (from < 4) {
          // Add new columns to surah table
          await m.addColumn(quranSurahTable, quranSurahTable.lastReadAyah);
        }
      },
      beforeOpen: (details) async {
        // Enable foreign keys if needed
        // await customStatement('PRAGMA foreign_keys = ON');

        // Check for database corruption
        if (details.hadUpgrade) {
          // Optional: Run integrity check after upgrade
          // await customStatement('PRAGMA integrity_check');
        }
      },
    );
  }
}