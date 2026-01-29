import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'prayer_times_api_client.g.dart';

@RestApi()
abstract class PrayerTimesApiClient {
  factory PrayerTimesApiClient(Dio dio, {String baseUrl}) = _PrayerTimesApiClient;
}
