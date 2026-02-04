import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/components/buttons/primary_button.dart';
import 'package:tumbuh_iman/presentation/components/buttons/secondary_button.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final IconData? icon;
  final Color? iconColor;
  final bool isDangerous;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.onCancel,
    this.icon,
    this.iconColor,
    this.isDangerous = false,
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
            // Icon (optional)
            if (icon != null) ...[
              Container(
                width: AppDimensions.iconXXL,
                height: AppDimensions.iconXXL,
                decoration: BoxDecoration(
                  color: (iconColor ?? AppColors.primary).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? AppColors.primary,
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

            // Buttons
            Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    text: cancelText,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onCancel?.call();
                    },
                  ),
                ),
                SizedBox(width: AppDimensions.spaceM),
                Expanded(
                  child: PrimaryButton(
                    text: confirmText,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirm();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onConfirm,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    IconData? icon,
    Color? iconColor,
    bool isDangerous = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ConfirmDialog(
        title: title,
        message: message,
        onConfirm: onConfirm,
        confirmText: confirmText,
        cancelText: cancelText,
        icon: icon,
        iconColor: iconColor,
        isDangerous: isDangerous,
      ),
    );
  }
}