// lib/presentation/components/dialogs/info_dialog.dart

import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/components/buttons/primary_button.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? iconColor;

  const InfoDialog({
    super.key,
    required this.title,
    required this.message,
    this.buttonText = 'OK',
    this.onPressed,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.dialogRadius),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: AppDimensions.dialogMaxWidth,
        ),
        padding: EdgeInsets.all(AppDimensions.dialogPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            if (icon != null) ...[
              Container(
                width: AppDimensions.iconXXL,
                height: AppDimensions.iconXXL,
                decoration: BoxDecoration(
                  color: (iconColor ?? AppColors.info).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? AppColors.info,
                  size: AppDimensions.iconL,
                ),
              ),
              SizedBox(height: AppDimensions.spaceM),
            ],

            // Title
            Text(
              title,
              style: AppTextStyles.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.spaceM),

            // Message
            Text(
              message,
              style: AppTextStyles.body2.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.spaceL),

            // Button
            PrimaryButton(
              text: buttonText,
              onPressed: () {
                Navigator.of(context).pop();
                onPressed?.call();
              },
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
    IconData? icon,
    Color? iconColor,
  }) {
    return showDialog(
      context: context,
      builder: (context) => InfoDialog(
        title: title,
        message: message,
        buttonText: buttonText,
        onPressed: onPressed,
        icon: icon,
        iconColor: iconColor,
      ),
    );
  }
}