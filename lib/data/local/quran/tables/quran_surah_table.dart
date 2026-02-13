import 'package:drift/drift.dart';

/// Quran Surah table - Stores information about each surah (chapter)
class QuranSurahTable extends Table {
  @override
  String get tableName => 'quran_surahs';

  // Primary key - Surah number (1-114)
  IntColumn get surahNumber => integer()();

  @override
  Set<Column> get primaryKey => {surahNumber};

  // Surah name in Arabic
  TextColumn get name => text()();

  // Surah name in Latin
  TextColumn get nameLatin => text()();

  // Number of ayahs/verses in this surah
  IntColumn get numberOfAyah => integer()();

  // Place of revelation (Mekah/Madinah)
  TextColumn get placeOfRevelation => text()();

  // Meaning/translation of surah name
  TextColumn get meaning => text()();

  // Description of the surah
  TextColumn get description => text()();

  // Bookmarked status
  BoolColumn get isBookmarked => boolean().withDefault(const Constant(false))();

  // Last read status
  BoolColumn get isLastRead => boolean().withDefault(const Constant(false))();

  // Last read ayah number (nullable)
  IntColumn get lastReadAyah => integer().nullable()();

  // Timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
