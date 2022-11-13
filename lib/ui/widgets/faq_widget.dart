import 'package:flutter/material.dart';
import 'package:weather_app/helpers/custom_colors.dart';
import 'package:weather_app/helpers/utils.dart';

import '../../helpers/strings.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  bool questionFirstVisibility = false;
  bool questionSecondVisibility = false;
  bool questionThirdVisibility = false;
  bool questionFourthVisibility = false;

  @override
  Widget build(BuildContext context) {
    //dynamic dimensions
    double tileHeight = MediaQuery.of(context).size.height / 12;

    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: tileHeight,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                Strings.faq,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            SizedBox(
              height: tileHeight,
            ),
          ],
        ),
        GestureDetector(
          onTap: () => {
            setState(() => questionFirstVisibility = !questionFirstVisibility)
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: CustomColors.lightGrey),
              height: tileHeight,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Text(
                      'Question 1',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 36),
                    child: Icon(questionFirstVisibility
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up),
                  ),
                ],
              ),
            ),
          ),
        ),
        questionFirstVisibility
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: CustomColors.lightGrey),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          height: 2.1 //You can set your custom height here
                          ),
                      Strings.answer,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        GestureDetector(
          onTap: () => {
            setState(() => questionSecondVisibility = !questionSecondVisibility)
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: CustomColors.lightGrey),
              height: tileHeight,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Text(
                      'Question 2',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 36),
                    child: Icon(questionSecondVisibility
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up),
                  ),
                ],
              ),
            ),
          ),
        ),
        questionSecondVisibility
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: CustomColors.lightGrey),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          height: 2.1 //You can set your custom height here
                          ),
                      Strings.answer,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        GestureDetector(
          onTap: () => {
            setState(() => questionThirdVisibility = !questionThirdVisibility)
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: CustomColors.lightGrey),
              height: tileHeight,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Text(
                      'Question 3',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 36),
                    child: Icon(questionThirdVisibility
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up),
                  ),
                ],
              ),
            ),
          ),
        ),
        questionThirdVisibility
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: CustomColors.lightGrey),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          height: 2.1 //You can set your custom height here
                          ),
                      Strings.answer,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        GestureDetector(
          onTap: () => {
            setState(() => questionFourthVisibility = !questionFourthVisibility)
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: CustomColors.lightGrey),
              height: tileHeight,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Text(
                      'Question 4',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 36),
                    child: Icon(questionFourthVisibility
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up),
                  ),
                ],
              ),
            ),
          ),
        ),
        questionFourthVisibility
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: CustomColors.lightGrey),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          height: 2.1 //You can set your custom height here
                          ),
                      Strings.answer,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        SizedBox(
          height: tileHeight * 2,
        ),
        Container(
          alignment: Alignment.center,
          height: tileHeight * 1.5,
          color: CustomColors.lightGrey,
          child: Text(
            'Vitalii - ${Utils.getCurrentYear()}',
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        )
      ],
    );
  }
}
