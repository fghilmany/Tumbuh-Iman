import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'meal_nutrition_api_client.g.dart';

@RestApi()
abstract class MealNutritionApiClient {
  factory MealNutritionApiClient(Dio dio, {String baseUrl}) = _MealNutritionApiClient;
}
