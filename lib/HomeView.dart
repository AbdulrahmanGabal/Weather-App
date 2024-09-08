import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/Search-View.dart';
import 'package:test/Weather-info.dart';
import 'package:test/cubits/get-weather-cubit/get-weather-cubit.dart';
import 'package:test/cubits/get-weather-cubit/get-weather-states.dart';
import 'package:test/models/Weather-model.dart';
import 'no-weather.dart'; // Import the Noweather widget

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Weather App',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchView();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.search),
              ),
            ],
            backgroundColor: Colors.orange),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is initialState) {
              return const Noweather();
            } else if (state is WeatherLodedState) {
              return WeatherInfo(
                weather: state.weatherModel,
              );
            } else if (state is WeatherFailureState) {
              return Center(
                child: Text(
                  'Error: ${state.errMessage}',
                  style: const TextStyle(fontSize: 24, color: Colors.red),
                ),
              );
            } else {
              return const Center(
                child: Text('Unexpected error occurred.'),
              );
            }
          },
        ));
  }
}
