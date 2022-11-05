import 'package:flutter/material.dart';
import 'package:weather_app/helpers/strings.dart';

class CitiesGrid extends StatelessWidget {
  const CitiesGrid({
    Key? key,
    required this.onNewYorkPress,
    required this.onParisPress,
    required this.onDubaiPress,
    required this.onLondonPress,
  }) : super(key: key);

  final Function onNewYorkPress;
  final Function onLondonPress;
  final Function onDubaiPress;
  final Function onParisPress;

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height / 3;

    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            Strings.popularcitiesTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        GestureDetector(
          onTap: () => {onNewYorkPress()},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: cardHeight,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg_nyc.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: Colors.white),
                    height: cardHeight / 6,
                    child: const Text(
                      'New York',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {onLondonPress()},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: cardHeight,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg_london.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: Colors.white),
                    height: cardHeight / 6,
                    child: const Text(
                      'London',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {onDubaiPress()},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: cardHeight,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg_dubai.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: Colors.white),
                    height: cardHeight / 6,
                    child: const Text(
                      'Dubai',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {onParisPress()},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: cardHeight,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg_paris.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: Colors.white),
                    height: cardHeight / 6,
                    child: const Text(
                      'Paris',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
