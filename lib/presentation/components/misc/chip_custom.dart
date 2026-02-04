import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class ChipCustom extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool isSelected;
  final Color? selectedColor;

  const ChipCustom({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
    this.onDelete,
    this.isSelected = false,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? (selectedColor ?? AppColors.primary)
          : AppColors.primaryVeryLight,
      borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingM,
            vertical: AppDimensions.paddingS,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: AppDimensions.iconXS,
                  color: isSelected
                      ? AppColors.textOnPrimary
                      : AppColors.primary,
                ),
                SizedBox(width: AppDimensions.spaceXS),
              ],
              Text(
                label,
                style: AppTextStyles.caption.copyWith(
                  color: isSelected
                      ? AppColors.textOnPrimary
                      : AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (onDelete != null) ...[
                SizedBox(width: AppDimensions.spaceXS),
                GestureDetector(
                  onTap: onDelete,
                  child: Icon(
                    Icons.close,
                    size: AppDimensions.iconXS,
                    color: isSelected
                        ? AppColors.textOnPrimary
                        : AppColors.primary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}