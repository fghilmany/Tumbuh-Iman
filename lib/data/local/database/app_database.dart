import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [], daos: [])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle migrations between versions
        if (from < 2) {
          // Example: Add new column in version 2
          // await m.addColumn(surahTable, surahTable.newColumn);
        }
        if (from < 3) {
          // Example: Create new table in version 3
          // await m.createTable(newTable);
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