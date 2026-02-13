import 'package:drift/drift.dart';
import 'package:tumbuh_iman/data/local/quran/tables/quran_ayah_table.dart';

/// Quran Audio table - Stores audio files for ayahs
/// Relationship: Many audio files belong to one ayah (different reciters)
class QuranAudioTable extends Table {
  @override
  String get tableName => 'quran_audios';

  // Primary key
  IntColumn get id => integer().autoIncrement()();

  // Foreign key to QuranAyahTable
  IntColumn get ayahId => integer().references(QuranAyahTable, #id, onDelete: KeyAction.cascade)();

  // Denormalized for easier querying
  IntColumn get surahNumber => integer()();
  IntColumn get ayahNumber => integer()();

  // Audio URL
  TextColumn get audioUrl => text()();

  // Timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {surahNumber, ayahNumber}, // Unique per ayah per reciter
      ];
}

