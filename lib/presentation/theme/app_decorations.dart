// lib/presentation/theme/app_decorations.dart

import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/theme/app_shadows.dart';

class AppDecorations {
  AppDecorations._();

  // ===== CARD DECORATIONS =====
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
    boxShadow: AppShadows.cardShadow,
  );

  static BoxDecoration cardDecorationWithBorder = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
    border: Border.all(color: AppColors.border, width: 1),
    boxShadow: AppShadows.cardShadow,
  );

  static BoxDecoration cardDecorationPrimary = BoxDecoration(
    gradient: AppColors.primaryGradient,
    borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
    boxShadow: AppShadows.cardShadow,
  );

  // ===== INPUT DECORATIONS =====
  static BoxDecoration inputDecoration = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
    border: Border.all(color: AppColors.border, width: 1),
  );

  static BoxDecoration inputDecorationFocused = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
    border: Border.all(color: AppColors.primary, width: 2),
  );

  // ===== CONTAINER DECORATIONS =====
  static BoxDecoration containerPrimary = BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
  );

  static BoxDecoration containerGradient = BoxDecoration(
    gradient: AppColors.primaryGradient,
    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
  );

  static BoxDecoration containerCream = BoxDecoration(
    color: AppColors.cream,
    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
  );

  // ===== BUTTON DECORATIONS =====
  static BoxDecoration buttonPrimary = BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
    boxShadow: AppShadows.buttonShadow,
  );

  static BoxDecoration buttonSecondary = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
    border: Border.all(color: AppColors.primary, width: 1),
  );

  // ===== BADGE DECORATIONS =====
  static BoxDecoration badgePrimary = BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
  );

  static BoxDecoration badgeAccent = BoxDecoration(
    color: AppColors.accent,
    borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
  );

  // ===== DIVIDER DECORATION =====
  static BoxDecoration dividerDecoration = BoxDecoration(
    color: AppColors.divider,
  );
}