import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/Search-View.dart';
import 'package:test/cubits/get-weather-cubit/get-weather-states.dart';

import '../../Services/Weather-Services.dart';
import '../../models/Weather-model.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(initialState());
  WeatherModel? weatherModel;

  getWeather({required String CityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(CityName: CityName);
      emit(WeatherLodedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
