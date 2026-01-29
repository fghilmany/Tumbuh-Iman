import 'dart:io';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tumbuh_iman/data/local/database/app_database.dart';
import 'package:path/path.dart' as p;

@module
abstract class DatabaseModule {
  // Define Database-specific third-party dependencies here
  @lazySingleton
  @preResolve
  Future<AppDatabase> database() async {
    // Get app documents directory
    final dbFolder = await getApplicationDocumentsDirectory();

    // Create database file
    final file = File(p.join(dbFolder.path, 'tumbuh_iman.db'));

    // Return database instance
    return AppDatabase(NativeDatabase(file, logStatements: true));
  }
}