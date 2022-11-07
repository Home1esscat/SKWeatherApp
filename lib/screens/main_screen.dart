import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/appbar/simple_custom_app_bar.dart';
import 'package:weather_app/bloc/suggestions_popup_cubit.dart';
import 'package:weather_app/bloc/suggestions_popup_state.dart';
import 'package:weather_app/bloc/weather_info_cubit.dart';
import 'package:weather_app/bloc/weather_info_state.dart';
import 'package:weather_app/helpers/custom_colors.dart';
import 'package:weather_app/screens/faq_screen.dart';
import '../bloc/suggestion_cities_cubit.dart';
import '../helpers/utils.dart';
import 'cities_grid_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<WeatherCubit>();
    var uiCubit = context.read<SuggestionsCubit>();
    var cubitSuggestion = context.read<CitySuggestionCubit>();
    double screenHeight = MediaQuery.of(context).size.height;
    double tileHeight = screenHeight / 12;

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_hero_day.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              height: screenHeight,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: tileHeight * 2),
                      child: SimpleCustomAppBar(),
                    ),
                  ),
                  BlocBuilder<WeatherCubit, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherLoadedState) {
                        return weatherCardFull(tileHeight, state);
                      }
                      if (state is WeatherErrorState) {
                        return weatherCardError(tileHeight);
                      }
                      if (state is WeatherLoadingState) {
                        return weatherCardLoading(tileHeight);
                      } else {
                        return weatherCardUnknownState(tileHeight);
                      }
                    },
                  ),
                  StreamBuilder<SuggestionsState>(
                    stream: uiCubit.stream,
                    initialData: uiCubit.state,
                    builder: (context, snapshot) {
                      return suggestionBox(
                          uiCubit, tileHeight, cubitSuggestion, cubit);
                    },
                  ),
                ],
              ),
            ),
            CitiesGrid(
              onDubaiPress: () => {
                cubit.getWeatherByName('Dubai'),
                animateToTop(_scrollController)
              },
              onLondonPress: () => {
                cubit.getWeatherByName('London'),
                animateToTop(_scrollController)
              },
              onNewYorkPress: () => {
                cubit.getWeatherByName('New York'),
                animateToTop(_scrollController)
              },
              onParisPress: () => {
                cubit.getWeatherByName('Paris'),
                animateToTop(_scrollController)
              },
            ),
            const FaqScreen(),
          ],
        ),
      ),
    );
  }

  Widget suggestionBox(SuggestionsCubit uiCubit, double tileHeight,
      CitySuggestionCubit cubitSuggestion, WeatherCubit cubit) {
    return Align(
      alignment: Alignment.topCenter,
      child: uiCubit.state.showSuggstion
          ? Padding(
              padding: EdgeInsets.only(top: tileHeight * 3),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        itemCount: cubitSuggestion.internalList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => {
                              FocusManager.instance.primaryFocus?.unfocus(),
                              cubit.getWeatherById(cubitSuggestion
                                  .internalList[index].id
                                  .toString()),
                              uiCubit.changeSuggestionState(
                                  !uiCubit.state.showSuggstion)
                            },
                            child: SizedBox(
                              height: 40,
                              child: Text(
                                  '${cubitSuggestion.internalList[index].name!}, ${cubitSuggestion.internalList[index].sys!.country!}'),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Container(),
    );
  }

  Widget weatherCardUnknownState(double tileHeight) {
    return Padding(
      padding: EdgeInsets.only(top: tileHeight * 4.5, right: 16, left: 16),
      child: Container(
        height: tileHeight * 4.7,
        decoration: const BoxDecoration(
          color: CustomColors.transparentWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.sentiment_very_dissatisfied_rounded),
              SizedBox(height: 10),
              Text('Something went completely wrong')
            ],
          ),
        ),
      ),
    );
  }

  Widget weatherCardLoading(double tileHeight) {
    return Padding(
      padding: EdgeInsets.only(top: tileHeight * 4.5, right: 16, left: 16),
      child: Container(
        height: tileHeight * 4.7,
        decoration: const BoxDecoration(
          color: CustomColors.transparentWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget weatherCardError(double tileHeight) {
    return Padding(
      padding: EdgeInsets.only(top: tileHeight * 4.5, right: 16, left: 16),
      child: Container(
        height: tileHeight * 4.7,
        decoration: const BoxDecoration(
          color: CustomColors.transparentWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.sentiment_very_dissatisfied_rounded),
              SizedBox(height: 10),
              Text('Something went wrong')
            ],
          ),
        ),
      ),
    );
  }

  Widget weatherCardFull(double tileHeight, WeatherLoadedState state) {
    return Padding(
      padding: EdgeInsets.only(top: tileHeight * 2.5),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: const BoxDecoration(
              color: CustomColors.transparentWhite,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: tileHeight * 4.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          width: 100,
                          height: 100,
                          child: Image.network(
                              fit: BoxFit.fill,
                              'http://openweathermap.org/img/w/${state.cityWeatherModel.weather[0].icon}.png'),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${state.cityWeatherModel.main.temp.toInt()}℃',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  state.cityWeatherModel.weather[0].main,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  state.cityWeatherModel.weather[0].description,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: CustomColors.hintGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${state.cityWeatherModel.name}, ${state.cityWeatherModel.sys.country}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text(
                            Utils.unixToDate(state.cityWeatherModel.dt),
                            style: const TextStyle(
                                color: CustomColors.hintGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.blue,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 6),
                              child: Text(
                                'Min',
                                style: TextStyle(
                                    color: CustomColors.hintGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                '${state.cityWeatherModel.main.tempMin.toInt()}℃',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 0.6,
                          height: 60,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  'Max',
                                  style: TextStyle(
                                      color: CustomColors.hintGrey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  '${state.cityWeatherModel.main.tempMax.toInt()}℃',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void animateToTop(ScrollController controller) {
    controller.animateTo(_scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
