import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/components/dialogs/info_dialog.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onPressed;

  const SuccessDialog({
    super.key,
    required this.title,
    required this.message,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InfoDialog(
      title: title,
      message: message,
      buttonText: 'OK',
      onPressed: onPressed,
      icon: Icons.check_circle_outline,
      iconColor: AppColors.success,
    );
  }

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onPressed,
  }) {
    return showDialog(
      context: context,
      builder: (context) => SuccessDialog(
        title: title,
        message: message,
        onPressed: onPressed,
      ),
    );
  }
}