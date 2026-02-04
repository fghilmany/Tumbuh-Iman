import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/components/buttons/primary_button.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final IconData? icon;

  const ErrorView({
    super.key,
    required this.message,
    this.onRetry,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              width: AppDimensions.iconXXL,
              height: AppDimensions.iconXXL,
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon ?? Icons.error_outline,
                size: AppDimensions.iconXL,
                color: AppColors.error,
              ),
            ),
            SizedBox(height: AppDimensions.spaceL),

            // Message
            Text(
              message,
              style: AppTextStyles.body1.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),

            // Retry button
            if (onRetry != null) ...[
              SizedBox(height: AppDimensions.spaceL),
              PrimaryButton(
                text: 'Retry',
                onPressed: onRetry!,
                icon: Icons.refresh,
                width: 200,
              ),
            ],
          ],
        ),
      ),
    );
  }
}