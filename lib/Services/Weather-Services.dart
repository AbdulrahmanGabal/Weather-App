import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/Weather-model.dart';

class WeatherService {
  final Dio dio;
  final String baseurl = 'https://api.weatherapi.com/v1';
  final String apikey = '3222d3a8ee0447c3830213757240209';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String CityName}) async {
    try {
      Response response = await dio
          .get('$baseurl/forecast.json?key=$apikey&q=$CityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error , try again';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error , try again');
    }
  }
}
