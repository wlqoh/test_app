import 'package:auth_task/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData basicTheme() {
  return ThemeData(
    textTheme: const TextTheme(
      labelSmall: TextStyle(
          color: MyColors.sPrimaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 13),
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 22,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      titleLarge: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
      titleMedium: TextStyle(
        color: Colors.grey,
        fontSize: 13,
      ),
      titleSmall: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.normal,
        fontSize: 13,
      ),
    ),
  );
}
