import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class Badge extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? prefix;
  final double? paddingHorizontal;
  final double? paddingVertical;

  const Badge({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.prefix,
    this.paddingHorizontal,
    this.paddingVertical,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal ?? AppDimensions.paddingS,
        vertical: paddingVertical ?? AppDimensions.paddingXS,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefix != null) ...[
            prefix!,
            SizedBox(width: AppDimensions.spaceXS),
          ],
          Text(
            text,
            style: AppTextStyles.badge.copyWith(
              color: textColor ?? AppColors.textOnPrimary,
            ),
          ),
        ],
      ),
    );
  }
}