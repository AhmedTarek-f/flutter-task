import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';

abstract class AppTheme{
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
      selectionColor: AppColors.primary.withValues(alpha: 0.5)
    )
  );
}