import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final double? width;
  final double? height;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final bool effectivelyDisabled = isDisabled || isLoading || onPressed == null;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? AppDimensions.buttonHeightM,
      child: OutlinedButton(
        onPressed: effectivelyDisabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          disabledForegroundColor: AppColors.textDisabled,
          side: BorderSide(
            color: effectivelyDisabled ? AppColors.textDisabled : AppColors.primary,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingL,
            vertical: AppDimensions.paddingM,
          ),
        ),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return SizedBox(
        width: AppDimensions.iconS,
        height: AppDimensions.iconS,
        child: CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 2,
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppDimensions.iconS),
          SizedBox(width: AppDimensions.spaceS),
          Text(
            text,
            style: AppTextStyles.button.copyWith(color: AppColors.primary),
          ),
        ],
      );
    }

    return Text(
      text,
      style: AppTextStyles.button.copyWith(color: AppColors.primary),
    );
  }
}