// lib/presentation/components/states/empty_state.dart

import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/components/buttons/primary_button.dart';
import 'package:tumbuh_iman/presentation/components/misc/image_custom.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String? message;
  final IconData? icon;
  final String? illustrationPath; // NEW: Path to SVG/PNG illustration
  final VoidCallback? onAction;
  final String? actionText;

  const EmptyState({
    super.key,
    required this.title,
    this.message,
    this.icon,
    this.illustrationPath, // NEW
    this.onAction,
    this.actionText,
  }) : assert(icon != null || illustrationPath != null, 'Either icon or illustrationPath must be provided');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration or Icon
            _buildIllustration(),
            SizedBox(height: AppDimensions.spaceL),

            // Title
            Text(
              title,
              style: AppTextStyles.headline5,
              textAlign: TextAlign.center,
            ),

            // Message
            if (message != null) ...[
              SizedBox(height: AppDimensions.spaceM),
              Text(
                message!,
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],

            // Action button
            if (onAction != null && actionText != null) ...[
              SizedBox(height: AppDimensions.spaceL),
              PrimaryButton(
                text: actionText!,
                onPressed: onAction!,
                width: 200,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    if (illustrationPath != null) {
      return ImageCustom(
        path: illustrationPath!,
        width: 200,
        height: 200,
        fit: BoxFit.contain,
      );
    } else {
      return Container(
        width: AppDimensions.iconXXL,
        height: AppDimensions.iconXXL,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon!,
          size: AppDimensions.iconXL,
          color: AppColors.primary,
        ),
      );
    }
  }
}