import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    Key? key,
    required this.onCityTap,
    required this.cardHeight,
    required this.cityName,
    required this.cityImg,
  }) : super(key: key);

  final VoidCallback onCityTap;
  final double cardHeight;
  final String cityName;
  final String cityImg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCityTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: cardHeight,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                  image: AssetImage(cityImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: Colors.white),
                height: cardHeight / 6,
                child: Text(
                  cityName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
