import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: Icon(Icons.language, color: AppColors.textOnPrimary),
      onSelected: (Locale locale) {
        context.setLocale(locale);
      },
      itemBuilder: (BuildContext context) => [
        _buildLanguageItem(
          locale: Locale('en', 'US'),
          flag: '🇺🇸',
          name: 'English',
          isSelected: context.locale == Locale('en', 'US'),
        ),
        _buildLanguageItem(
          locale: Locale('id', 'ID'),
          flag: '🇮🇩',
          name: 'Bahasa Indonesia',
          isSelected: context.locale == Locale('id', 'ID'),
        ),
        _buildLanguageItem(
          locale: Locale('ar', 'SA'),
          flag: '🇸🇦',
          name: 'العربية',
          isSelected: context.locale == Locale('ar', 'SA'),
        ),
      ],
    );
  }

  PopupMenuItem<Locale> _buildLanguageItem({
    required Locale locale,
    required String flag,
    required String name,
    required bool isSelected,
  }) {
    return PopupMenuItem(
      value: locale,
      child: Row(
        children: [
          Text(flag, style: TextStyle(fontSize: 20)),
          SizedBox(width: AppDimensions.spaceM),
          Expanded(
            child: Text(
              name,
              style: AppTextStyles.body2.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
          ),
          if (isSelected)
            Icon(
              Icons.check,
              color: AppColors.primary,
              size: AppDimensions.iconS,
            ),
        ],
      ),
    );
  }
}