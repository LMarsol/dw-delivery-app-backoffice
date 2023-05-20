import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_styles.dart';
import '../styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.instance.primary,
      secondary: AppColors.instance.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instance.primaryButton,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isDense: true,
      fillColor: Colors.white,
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      contentPadding: const EdgeInsets.all(20),
      labelStyle: TextStyles.instance.textRegular.copyWith(color: Colors.black),
      errorStyle: TextStyles.instance.textRegular.copyWith(color: Colors.redAccent),
    ),
  );
}
