import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyle {
  static const TextStyle headlineLarge = TextStyle(
    color: AppColors.kWhite,
    fontSize: 25,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    wordSpacing: 5,
  );

  static const TextStyle headlineMedium = TextStyle(
    color: Colors.white70,
    fontSize: 18,

    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyMedium = TextStyle(
    color: Colors.white,
    fontSize: 17,
  );

  static const TextStyle bodySmall = TextStyle(
    color: Colors.white60,
    fontSize: 14,
  );

  static const TextStyle errorText = TextStyle(
    color: Colors.redAccent,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
