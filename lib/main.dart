import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(const WeatherApp());
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
                primarySwatch: getWeatherConditionColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              routes: {
                HomeScreen.id: (context) => const HomeScreen(),
              },
              initialRoute: HomeScreen.id,
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getWeatherConditionColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.amber;
    case "Cloudy":
      return Colors.blueGrey;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    case "Patchy snow possible":
    case "Blowing snow":
    case "Blizzard":
    case "Light snow":
    case "Moderate snow":
    case "Patchy moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Moderate or heavy snow showers":
    case "Patchy light snow":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
    case "Moderate or heavy snow with thunder":
    case "Patchy light snow with thunder":
      return Colors.lightBlue;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.grey;
    default:
      return Colors.indigo;
  }
}
