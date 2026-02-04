import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/components/buttons/primary_button.dart';

class SuccessView extends StatelessWidget {
  final String title;
  final String? message;
  final VoidCallback? onAction;
  final String? actionText;

  const SuccessView({
    super.key,
    required this.title,
    this.message,
    this.onAction,
    this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success icon
            Container(
              width: AppDimensions.iconXXL,
              height: AppDimensions.iconXXL,
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_outline,
                size: AppDimensions.iconXL,
                color: AppColors.success,
              ),
            ),
            SizedBox(height: AppDimensions.spaceM),

            // Title
            Text(
              title,
              style: AppTextStyles.headline5,
              textAlign: TextAlign.center,
            ),

            // Message
            if (message != null) ...[
              SizedBox(height: AppDimensions.spaceS),
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
              SizedBox(height: AppDimensions.spaceM),
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
}
