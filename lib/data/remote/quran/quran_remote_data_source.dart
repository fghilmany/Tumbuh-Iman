import 'package:tumbuh_iman/data/remote/responses/quran/quran_detail_response_model.dart';
import 'package:tumbuh_iman/data/remote/responses/quran/quran_list_response_model.dart';

/// Abstract interface for Quran remote data source
abstract class QuranRemoteDataSource {
  /// Get list of all surahs (114 surahs)
  Future<QuranListResponseModel> getSurahList();

  /// Get detail of a surah by its number
  Future<QuranDetailResponseModel> getSurahById(int id);
}
