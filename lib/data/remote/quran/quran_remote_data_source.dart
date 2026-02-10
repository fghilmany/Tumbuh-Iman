import 'package:tumbuh_iman/data/models/quran/quran_list_response_model.dart';

/// Abstract interface for Quran remote data source
abstract class QuranRemoteDataSource {
  /// Get list of all surahs (114 surahs)
  Future<QuranListResponseModel> getSurahList();
}
