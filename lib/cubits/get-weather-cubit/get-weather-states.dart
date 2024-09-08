import 'package:test/models/Weather-model.dart';

class WeatherState {}

class initialState extends WeatherState {}

class WeatherLodedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLodedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errMessage;
  WeatherFailureState(this.errMessage);
}
