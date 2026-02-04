import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/components/dialogs/info_dialog.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;

  const ErrorDialog({
    super.key,
    required this.title,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return InfoDialog(
      title: title,
      message: message,
      buttonText: onRetry != null ? 'Retry' : 'OK',
      onPressed: onRetry,
      icon: Icons.error_outline,
      iconColor: AppColors.error,
    );
  }

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onRetry,
  }) {
    return showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        title: title,
        message: message,
        onRetry: onRetry,
      ),
    );
  }
}