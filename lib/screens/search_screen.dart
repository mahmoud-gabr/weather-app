import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search a city'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(
              onSubmitted: (value) async {
                var getWeatheCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatheCubit.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                label: Text('Search'),
                hintText: 'Enter City Name',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
              ),
            ),
          ),
        ));
  }
}
