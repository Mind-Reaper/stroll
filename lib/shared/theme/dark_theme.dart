import 'package:flutter/material.dart';
import 'package:stroll/core/constants/app_colors.dart';

final darkTheme = ThemeData(
    fontFamily: 'ProximaNova',
    brightness: Brightness.dark,
    useMaterial3: false,
    primaryColor: AppColors.purple,
    scaffoldBackgroundColor: Colors.black,
    cardTheme: const CardTheme(
      color: Color(0xff232a2e),
    ),
    canvasColor: const Color(0xff121518),
    textTheme: const TextTheme().apply(bodyColor: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff0f1115),
        selectedIconTheme: IconThemeData(size: 28, color: Colors.white),
        unselectedIconTheme: IconThemeData(
          size: 28,
          color: Color(0xff6f6e7c),
        )));
