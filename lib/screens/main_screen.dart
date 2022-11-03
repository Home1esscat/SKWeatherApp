import 'package:flutter/material.dart';
import 'package:weather_app/appbar/custom_app_bar.dart';
import 'package:weather_app/screens/faq_screen.dart';
import 'cities_grid_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double tileHeight = MediaQuery.of(context).size.height / 12;
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
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(height: topSpacerHeight),
                  MyAppBar(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      height: 286,
                      width: double.infinity,
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
