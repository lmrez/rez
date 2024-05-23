import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade100, // very light cyan background
    primary: Colors.black, // dark cyan primary color
    secondary: Colors.cyan.shade200, // lighter cyan for secondary color
    tertiary: Colors.white, // keeping white as it contrasts well with cyan
    inversePrimary: Colors.black, // medium cyan for inverse primary
  ),
);
