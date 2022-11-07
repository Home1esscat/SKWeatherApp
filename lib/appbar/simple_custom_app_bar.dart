import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/bloc/suggestion_cities_cubit.dart';
import 'package:weather_app/helpers/strings.dart';
import 'package:weather_app/helpers/utils.dart';

import '../bloc/suggestions_popup_cubit.dart';

class SimpleCustomAppBar extends StatelessWidget {
  SimpleCustomAppBar({super.key});

  final _controller = TextEditingController();
  final WeatherApi weatherApi = WeatherApi();

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
                        Utils.searchData(uiCubit, cubitSuggestion, weatherApi,
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
                          Utils.searchData(uiCubit, cubitSuggestion, weatherApi,
                              _controller.text);
                        }

                        //searchData(uiCubit, cubitSuggestion);
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
}
