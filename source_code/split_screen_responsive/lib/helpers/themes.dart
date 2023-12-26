import 'dart:math';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ThemeColors.deepPurple,
        brightness: Brightness.light,
        error: ThemeColors.error,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ThemeColors.deepPurple,
        brightness: Brightness.dark,
        error: ThemeColors.error,
      ),
    );
  }
}

class ThemeColors {
  static const Color deepPurple = Colors.deepPurple;
  static const Color lightGreen = Colors.lightGreen;
  static Color lightGreenShade400 = Colors.lightGreen.shade400;
  static const Color lightBlue = Colors.lightBlue;
  static const Color blueGrey = Colors.blueGrey;
  static const Color error = Colors.red;
  static const Color gradientStart = Colors.black12;
  static const Color gradientEnd = Colors.black87;
  static const Color titleBarText = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static Color greyShade600 = Colors.grey.shade600;
}

class RandomColorList {
  static List<Color?> colors() {
    return List<Color>.generate(
      50,
      (index) => Colors.primaries[Random().nextInt(Colors.primaries.length)],
    );
  }
}
