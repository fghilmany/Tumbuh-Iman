import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';

class AppShadows {
  AppShadows._();

  // ===== CARD SHADOWS =====
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: AppColors.shadow,
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  static const List<BoxShadow> cardShadowHover = [
    BoxShadow(
      color: AppColors.shadow,
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  // ===== BUTTON SHADOWS =====
  static const List<BoxShadow> buttonShadow = [
    BoxShadow(
      color: AppColors.shadow,
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  // ===== APP BAR SHADOW =====
  static const List<BoxShadow> appBarShadow = [
    BoxShadow(
      color: AppColors.shadow,
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  // ===== FLOATING SHADOW =====
  static const List<BoxShadow> floatingShadow = [
    BoxShadow(
      color: AppColors.shadow,
      blurRadius: 12,
      offset: Offset(0, 6),
    ),
  ];

  // ===== SOFT SHADOW =====
  static const List<BoxShadow> softShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 6,
      offset: Offset(0, 1),
    ),
  ];
}