import 'package:drift/drift.dart';
import 'package:tumbuh_iman/data/local/quran/tables/quran_surah_table.dart';

/// Quran Ayah table - Stores individual verses
/// Relationship: Many ayahs belong to one surah
class QuranAyahTable extends Table {
  @override
  String get tableName => 'quran_ayahs';

  // Primary key
  IntColumn get id => integer().autoIncrement()();

  // Foreign key to QuranSurahTable (references surahNumber)
  IntColumn get surahNumber => integer().references(QuranSurahTable, #surahNumber, onDelete: KeyAction.cascade)();

  // Ayah number within the surah
  IntColumn get ayahNumber => integer()();

  // Arabic text of the ayah
  TextColumn get arabicText => text()();

  // Arabic text of the ayah
  TextColumn get latinText => text()();

  // Indonesian translation
  TextColumn get translationId => text()();

  // Arabic text of the ayah
  TextColumn get audioUrls => text().nullable()();

  // Timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {surahNumber, ayahNumber}, // Unique combination of surah and ayah number
      ];
}

