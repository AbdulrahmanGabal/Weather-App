import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/HomeView.dart';
import 'package:test/cubits/get-weather-cubit/get-weather-cubit.dart';
import 'package:test/cubits/get-weather-cubit/get-weather-states.dart';
import 'package:test/models/Weather-model.dart'; // Make sure the path is correct
import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weathercondition,
              )),
              debugShowMaterialGrid: false,
              home: const HomeView(), // Use the correct widget here
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.blue;

  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Clear':
      return Colors.blueGrey;
    case 'Partly cloudy':
      return Colors.blue;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Patchy light rain':
    case 'Moderate rain':
      return Colors.lightBlue;
    case 'Heavy rain':
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Blizzard':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Ice pellets':
    case 'Light showers of ice pellets':
      return Colors.cyan;
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.lightBlue;
    default:
      return Colors.grey; // Fallback for any unknown condition
  }
}
