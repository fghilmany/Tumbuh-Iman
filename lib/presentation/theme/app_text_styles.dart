import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // ===== FONT FAMILIES =====
  static const String _primaryFont = 'Roboto';
  static const String _arabicFont = 'Amiri';

  // ===== DISPLAY STYLES (Hero text) =====
  static const TextStyle display1 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 60,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  // ===== HEADLINE STYLES =====
  static const TextStyle headline1 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle headline2 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle headline3 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle headline4 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle headline5 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle headline6 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // ===== SUBTITLE STYLES =====
  static const TextStyle subtitle1 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // ===== BODY STYLES =====
  static const TextStyle body1 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  // ===== BUTTON STYLES =====
  static const TextStyle button = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    color: AppColors.textOnPrimary,
    height: 1.2,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    color: AppColors.textOnPrimary,
    height: 1.2,
  );

  // ===== CAPTION & OVERLINE =====
  static const TextStyle caption = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: AppColors.textSecondary,
    height: 1.2,
  );

  // ===== ARABIC STYLES (Quran) =====
  static const TextStyle arabicLarge = TextStyle(
    fontFamily: _arabicFont,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 2.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle arabicMedium = TextStyle(
    fontFamily: _arabicFont,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 2.0,
    color: AppColors.textPrimary,
  );

  static const TextStyle arabicSmall = TextStyle(
    fontFamily: _arabicFont,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.8,
    color: AppColors.textPrimary,
  );

  // ===== SPECIALIZED STYLES =====
  static const TextStyle error = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
    height: 1.4,
  );

  static const TextStyle success = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.success,
    height: 1.4,
  );

  static const TextStyle link = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
    height: 1.4,
  );

  static const TextStyle badge = TextStyle(
    fontFamily: _primaryFont,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: AppColors.textOnPrimary,
    height: 1.2,
  );
}