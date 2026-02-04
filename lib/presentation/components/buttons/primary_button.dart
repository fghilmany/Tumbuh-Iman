import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final double? width;
  final double? height;

  const PrimaryButton({
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
      child: ElevatedButton(
        onPressed: effectivelyDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          disabledBackgroundColor: AppColors.textDisabled,
          disabledForegroundColor: AppColors.textOnPrimary,
          elevation: effectivelyDisabled ? 0 : AppDimensions.elevationS,
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
          color: AppColors.textOnPrimary,
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
          Text(text, style: AppTextStyles.button),
        ],
      );
    }

    return Text(text, style: AppTextStyles.button);
  }
}