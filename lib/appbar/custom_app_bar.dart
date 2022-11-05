import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/helpers/strings.dart';

import '../bloc/weather_cubit.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({super.key});

  final _controller = TextEditingController();
  final WeatherApi weatherApi = WeatherApi();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<WeatherCubit>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: Strings.searchBarHint,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SizedBox(
                width: 44,
                height: 44,
                child: RawMaterialButton(
                  elevation: 0,
                  onPressed: (() {
                    weatherApi.getCitySuggestion('одесса');
                  })
                  //cubit.getWeather(_controller.text)
                  ,
                  fillColor: Colors.lightBlue,
                  shape: const CircleBorder(),
                  child: const Icon(
                    color: Colors.white,
                    Icons.search_rounded,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
