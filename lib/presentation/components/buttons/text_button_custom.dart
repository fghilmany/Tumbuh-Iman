import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class TextButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? color;

  const TextButtonCustom({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = color ?? AppColors.primary;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: effectiveColor,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingM,
          vertical: AppDimensions.paddingS,
        ),
      ),
      child: icon != null
          ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppDimensions.iconS, color: effectiveColor),
          SizedBox(width: AppDimensions.spaceXS),
          Text(
            text,
            style: AppTextStyles.button.copyWith(color: effectiveColor),
          ),
        ],
      )
          : Text(
        text,
        style: AppTextStyles.button.copyWith(color: effectiveColor),
      ),
    );
  }
}