import 'package:flutter/material.dart';
import 'package:weather_app/helpers/strings.dart';
import 'city_card.dart';

class CitiesGrid extends StatelessWidget {
  const CitiesGrid({
    Key? key,
    required this.onNewYorkPress,
    required this.onParisPress,
    required this.onDubaiPress,
    required this.onLondonPress,
  }) : super(key: key);

  final VoidCallback onNewYorkPress;
  final VoidCallback onLondonPress;
  final VoidCallback onDubaiPress;
  final VoidCallback onParisPress;

  @override
  Widget build(BuildContext context) {
    final double cardHeight = MediaQuery.of(context).size.height / 3;

    return Column(
      children: [
        const SizedBox(height: 70),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            Strings.popularcitiesTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        const SizedBox(height: 35),
        CityCard(
            cardHeight: cardHeight,
            cityImg: 'assets/images/bg_nyc.jpg',
            cityName: 'New York',
            onCityTap: onNewYorkPress),
        CityCard(
            cardHeight: cardHeight,
            cityImg: 'assets/images/bg_london.jpg',
            cityName: 'London',
            onCityTap: onLondonPress),
        CityCard(
            cardHeight: cardHeight,
            cityImg: 'assets/images/bg_dubai.jpg',
            cityName: 'Dubai',
            onCityTap: onDubaiPress),
        CityCard(
            cardHeight: cardHeight,
            cityImg: 'assets/images/bg_paris.jpg',
            cityName: 'Paris',
            onCityTap: onParisPress),
      ],
    );
  }
}
