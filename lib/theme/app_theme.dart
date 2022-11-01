import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class AppTheme {
  static final dark = ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: CustomColors.lightGrey),
        border: InputBorder.none,
      ),
      scaffoldBackgroundColor: Colors.white);
}
