import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData salisMode = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromARGB(255, 42, 4, 1),
        onPrimary: Colors.black,
        secondary: AppColor.secondaryColor,
        tertiary: Colors.orange,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.grey.shade100,
        onSurface: Colors.grey.shade700));
