// TODO Implement this library.import 'package:flutter/material.dart';

class WeatherModel {
  final String CityName;
  final DateTime date;
  final double maxtemp;
  final double mintemp;
  final String? image;
  final double Temp;
  final String weathercondition;

  WeatherModel(
      {required this.CityName,
      required this.Temp,
      required this.maxtemp,
      required this.mintemp,
      required this.date,
      this.image,
      required this.weathercondition});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      CityName: json['location']['name'],
      Temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      date: DateTime.parse(
          json['location']['localtime']), // I changed 'current' to 'localtime'
      weathercondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
