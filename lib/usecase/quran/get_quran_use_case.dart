import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';

abstract interface class GetQuranUseCase {
  /// Get list of all surahs (114 surahs)
  Future<Result<QuranEntity>> getSurahList();
}