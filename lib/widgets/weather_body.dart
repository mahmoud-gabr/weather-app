import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatheBody extends StatelessWidget {
  const WeatheBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getWeatherConditionColor(weatherModel.weatherCondition),
        getWeatherConditionColor(weatherModel.weatherCondition)[300]!,
        getWeatherConditionColor(weatherModel.weatherCondition)[50]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network('https:${weatherModel.image}'),
                Text(
                  weatherModel.temp.round().toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'maxTemp: ${weatherModel.maxTemp.round().toString()}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'minTemp ${weatherModel.minTemp.round().toString()}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
