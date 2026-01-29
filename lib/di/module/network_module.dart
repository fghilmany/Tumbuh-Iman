import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:tumbuh_iman/core/constant/url.dart';
import 'package:tumbuh_iman/data/remote/dialy_habit/meal_nutrition_api_client.dart';
import 'package:tumbuh_iman/data/remote/prayer_times/prayer_times_api_client.dart';
import 'package:tumbuh_iman/data/remote/quran/quran_api_client.dart';

@module
abstract class NetworkModule {
  // Define Network-specific third-party dependencies here
  @lazySingleton
  Dio dio(Talker talker) {
    final dio = Dio(
      BaseOptions(
        baseUrl: Url.quranPrayerTimesBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: false,
      error: true,
      logPrint: (object) {
        // Use your logger here
        debugPrint(object.toString());
      },

    ));

    dio.interceptors.add(
      TalkerDioLogger(talker: talker), // ← Use Talker directly
    );


    return dio;
  }

  @lazySingleton
  QuranApiClient quranApiClient(Dio dio) {
    return QuranApiClient(dio, baseUrl: Url.quranPrayerTimesBaseUrl);
  }

  @lazySingleton
  PrayerTimesApiClient prayerTimesApiClient(Dio dio) {
    return PrayerTimesApiClient(dio, baseUrl: Url.quranPrayerTimesBaseUrl);
  }

  @lazySingleton
  MealNutritionApiClient mealNutritionApiClient(Dio dio) {
    return MealNutritionApiClient(dio, baseUrl: Url.quranPrayerTimesBaseUrl);
  }

}