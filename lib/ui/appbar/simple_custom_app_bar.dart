import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/bloc/suggestion_cities/suggestion_cities_cubit.dart';
import 'package:weather_app/helpers/strings.dart';
import 'package:weather_app/helpers/utils.dart';

import '../../bloc/suggestions_popup/suggestions_popup_cubit.dart';

class SimpleCustomAppBar extends StatefulWidget {
  const SimpleCustomAppBar({super.key});

  @override
  State<SimpleCustomAppBar> createState() => _SimpleCustomAppBarState();
}

class _SimpleCustomAppBarState extends State<SimpleCustomAppBar> {
  late final TextEditingController _controller;
  late final WeatherApi _weatherApi;

  @override
  void initState() {
    _controller = TextEditingController();
    _weatherApi = WeatherApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var uiCubit = context.read<SuggestionsCubit>();
    var cubitSuggestion = context.read<CitySuggestionCubit>();
    return Column(
      children: [
        Padding(
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
                      onSubmitted: (value) {
                        searchData(uiCubit, cubitSuggestion, _weatherApi,
                            _controller.text);
                      },
                      textInputAction: TextInputAction.search,
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
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          searchData(uiCubit, cubitSuggestion, _weatherApi,
                              _controller.text);
                        }
                      },
                      fillColor: Utils.isDayTime()
                          ? Colors.lightBlue
                          : Colors.blueGrey,
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
        ),
      ],
    );
  }

  void searchData(SuggestionsCubit uiCubit, CitySuggestionCubit cubitSuggestion,
      WeatherApi weatherApi, String textFromController) {
    weatherApi.getCitySuggestion(textFromController).then((value) {
      uiCubit.changeSuggestionState(true);
      cubitSuggestion.setWeather(value);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
