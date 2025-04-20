import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';

abstract class AppTheme{
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
  );
}