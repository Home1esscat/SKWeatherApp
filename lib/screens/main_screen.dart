import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/appbar/custom_app_bar.dart';
import 'package:weather_app/helpers/custom_colors.dart';
import 'package:weather_app/screens/faq_screen.dart';
import 'cities_grid_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
                  Padding(
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
                                      children: const [
                                        Text(
                                          '+23°C',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Drizzle',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          'Light intensity drizzle',
                                          style: TextStyle(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Odessa, Ukraine',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '10 March 2020',
                                    style: TextStyle(
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: const [
                                    Padding(
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
                                      padding: EdgeInsets.only(top: 6),
                                      child: Text(
                                        '-33°C',
                                        style: TextStyle(
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: const [
                                      Padding(
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
                                        padding: EdgeInsets.only(top: 6),
                                        child: Text(
                                          '+33°C',
                                          style: TextStyle(
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
                  )
                ],
              ),
            ),
            CitiesGrid(
              onCityCardPress: () => {
                _scrollController.animateTo(
                    _scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease),
              },
            ),
            const FaqScreen(),
          ],
        ),
      ),
    );
  }
}
