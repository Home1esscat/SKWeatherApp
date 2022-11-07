import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/bloc/suggestion_cities_cubit.dart';
import 'package:weather_app/bloc/suggestions_popup_cubit.dart';
import 'package:weather_app/screens/main_screen.dart';
import 'package:weather_app/theme/app_theme.dart';

import 'api/weather_api.dart';
import 'bloc/weather_info_cubit.dart';

void main() {
  runApp(const MyApp());
}

final WeatherApi weatherApi = WeatherApi();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherCubit>(
          create: (context) => WeatherCubit()..getWeatherByName('Odessa'),
        ),
        Provider<SuggestionsCubit>(
          create: (context) => SuggestionsCubit(),
        ),
        Provider<CitySuggestionCubit>(
          create: (context) => CitySuggestionCubit(),
        )
      ],
      child: MaterialApp(
        theme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
        },
      ),
    );
  }
}
