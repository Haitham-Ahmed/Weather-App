
import 'dart:developer'; // Correct import

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apikey = 'b68f5a30ba724d669df81006251202';
  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apikey&q=$cityName&days=10');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'Oops, there was an error. Try again later.';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString()); // Now correctly recognized
      throw Exception('Oops, there was an error. Try again later.');
    }
  }
}
