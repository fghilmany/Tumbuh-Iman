import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ===== PRIMARY COLORS (From Logo) =====
  /// Main green from leaves - #6B9E5E
  static const Color primary = Color(0xFF6B9E5E);

  /// Dark green from book cover - #1B4332
  static const Color primaryDark = Color(0xFF1B4332);

  /// Light green from leaves - #95C88D
  static const Color primaryLight = Color(0xFF95C88D);

  /// Even lighter green for backgrounds
  static const Color primaryVeryLight = Color(0xFFD4E8D0);

  // ===== ACCENT COLORS (From Logo) =====
  /// Gold/yellow from star - #F4C542
  static const Color accent = Color(0xFFF4C542);

  /// Darker gold
  static const Color accentDark = Color(0xFFD4A637);

  /// Light gold for highlights
  static const Color accentLight = Color(0xFFF9E5A3);

  // ===== NEUTRAL COLORS (From Logo) =====
  /// Cream/beige from book pages - #F5E6D3
  static const Color cream = Color(0xFFF5E6D3);

  /// Off-white background - #FAF9F6
  static const Color background = Color(0xFFFAF9F6);

  /// Pure white for cards
  static const Color surface = Color(0xFFFFFFFF);

  /// Light beige for subtle backgrounds
  static const Color surfaceVariant = Color(0xFFF8F5F0);

  // ===== TEXT COLORS =====
  /// Main text - dark green
  static const Color textPrimary = Color(0xFF1B4332);

  /// Secondary text - medium green
  static const Color textSecondary = Color(0xFF6B9E5E);

  /// Hint text - light gray
  static const Color textHint = Color(0xFF9E9E9E);

  /// Disabled text
  static const Color textDisabled = Color(0xFFBDBDBD);

  /// Text on primary color backgrounds
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  /// Text on accent color backgrounds
  static const Color textOnAccent = Color(0xFF1B4332);

  // ===== SEMANTIC COLORS =====
  /// Success - using primary green
  static const Color success = Color(0xFF6B9E5E);

  /// Error - complementary red
  static const Color error = Color(0xFFD32F2F);

  /// Warning - using accent gold
  static const Color warning = Color(0xFFF4C542);

  /// Info - soft blue
  static const Color info = Color(0xFF5B9BD5);

  // ===== BORDER & DIVIDER =====
  /// Border color - light green-gray
  static const Color border = Color(0xFFD4E8D0);

  /// Darker border
  static const Color borderDark = Color(0xFF95C88D);

  /// Divider
  static const Color divider = Color(0xFFE8F5E5);

  // ===== OVERLAY & SHADOW =====
  /// Dark overlay - 60% opacity
  static const Color overlay = Color(0x99000000);

  /// Light overlay - 30% opacity
  static const Color overlayLight = Color(0x4D000000);

  /// Shadow color - dark green with opacity
  static const Color shadow = Color(0x331B4332);

  // ===== FEATURE-SPECIFIC COLORS =====
  /// Quran feature - primary green
  static const Color quranPrimary = Color(0xFF6B9E5E);

  /// Prayer feature - darker green
  static const Color prayerPrimary = Color(0xFF1B4332);

  /// Habit feature - gold accent
  static const Color habitPrimary = Color(0xFFF4C542);

  // ===== GRADIENTS =====
  /// Primary gradient - green leaves
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6B9E5E), Color(0xFF95C88D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Quran gradient - book with leaves
  static const LinearGradient quranGradient = LinearGradient(
    colors: [Color(0xFF1B4332), Color(0xFF6B9E5E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Accent gradient - golden star
  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFF4C542), Color(0xFFF9E5A3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Cream gradient - book pages
  static const LinearGradient creamGradient = LinearGradient(
    colors: [Color(0xFFFAF9F6), Color(0xFFF5E6D3)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ===== UTILITY METHODS =====
  /// Add opacity to any color
  static Color withOpacity(Color color, double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return color.withValues(alpha: opacity);
  }

  /// Darken a color
  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final darkened = hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0),
    );
    return darkened.toColor();
  }

  /// Lighten a color
  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }
}