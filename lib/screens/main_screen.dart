import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/appbar/custom_app_bar.dart';
import 'package:weather_app/bloc/weather_cubit.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/helpers/custom_colors.dart';
import 'package:weather_app/screens/faq_screen.dart';
import 'cities_grid_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<WeatherCubit>();
    double screenHeight = MediaQuery.of(context).size.height;
    double tileHeight = screenHeight / 12;
    double topSpacerHeight = tileHeight * 2.5;

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
              child: Column(
                children: [
                  SizedBox(height: topSpacerHeight),
                  MyAppBar(),
                  BlocBuilder<WeatherCubit, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherLoadedState) {
                        return Padding(
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
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                '${state.cityWeatherModel.main.temp.toInt()}℃',
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                state.cityWeatherModel
                                                    .weather[0].main,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                state.cityWeatherModel
                                                    .weather[0].description,
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${state.cityWeatherModel.name}, ${state.cityWeatherModel.sys.country}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          unixToDate(state.cityWeatherModel.dt),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Text(
                                              '${state.cityWeatherModel.main.tempMin.toInt()}℃',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18),
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        child: Column(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                'Max',
                                                style: TextStyle(
                                                    color:
                                                        CustomColors.hintGrey,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
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
                        );
                      }
                      if (state is WeatherErrorState) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: tileHeight * 4,
                            decoration: const BoxDecoration(
                              color: CustomColors.transparentWhite,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(state.errorMessage),
                            ),
                          ),
                        );
                      }
                      if (state is WeatherLoadingState) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: tileHeight * 4,
                            decoration: const BoxDecoration(
                              color: CustomColors.transparentWhite,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: tileHeight * 4,
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
                                  Icon(Icons
                                      .sentiment_very_dissatisfied_rounded),
                                  SizedBox(height: 10),
                                  Text('Something went completely wrong')
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
            CitiesGrid(
              onDubaiPress: () =>
                  {cubit.getWeather('Dubai'), animateToTop(_scrollController)},
              onLondonPress: () =>
                  {cubit.getWeather('London'), animateToTop(_scrollController)},
              onNewYorkPress: () => {
                cubit.getWeather('New York'),
                animateToTop(_scrollController)
              },
              onParisPress: () =>
                  {cubit.getWeather('Paris'), animateToTop(_scrollController)},
            ),
            const FaqScreen(),
          ],
        ),
      ),
    );
  }

  void animateToTop(ScrollController controller) {
    controller.animateTo(_scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  String unixToDate(int time) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return (DateFormat('d MMM yyy').format(date));
  }
}
