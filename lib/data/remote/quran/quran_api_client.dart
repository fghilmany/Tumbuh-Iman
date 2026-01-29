import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'quran_api_client.g.dart';

@RestApi()
abstract class QuranApiClient {
  factory QuranApiClient(Dio dio, {String baseUrl}) = _QuranApiClient;
}
