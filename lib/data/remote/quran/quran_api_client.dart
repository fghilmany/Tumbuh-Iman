import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tumbuh_iman/data/models/quran/quran_list_response_model.dart';

part 'quran_api_client.g.dart';

@RestApi()
abstract class QuranApiClient {
  factory QuranApiClient(Dio dio, {String baseUrl}) = _QuranApiClient;

  /// Get list of all surahs (114 surahs)
  @GET('/surat')
  Future<QuranListResponseModel> getSurahList();
}
