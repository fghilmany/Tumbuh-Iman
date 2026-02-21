import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tumbuh_iman/data/remote/responses/quran/quran_detail_response_model.dart';
import 'package:tumbuh_iman/data/remote/responses/quran/quran_list_response_model.dart';

part 'quran_api_client.g.dart';

@RestApi()
abstract class QuranApiClient {
  factory QuranApiClient(Dio dio, {String baseUrl}) = _QuranApiClient;

  /// Get list of all surahs (114 surahs)
  @GET('/surat')
  Future<QuranListResponseModel> getSurahList();

  /// Get detail of a surah by its number
  @GET('/surat/{id}')
  Future<QuranDetailResponseModel> getSurahById(@Path('id') int id);
}
