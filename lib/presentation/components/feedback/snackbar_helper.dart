import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class SnackbarHelper {
  static void show(
      BuildContext context,
      String message, {
        SnackBarType type = SnackBarType.info,
        Duration? duration,
        SnackBarAction? action,
      }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(_getIcon(type), color: Colors.white, size: 20),
          SizedBox(width: AppDimensions.spaceS),
          Expanded(
            child: Text(message, style: AppTextStyles.body2.copyWith(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: _getColor(type),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
      ),
      duration: duration ?? Duration(seconds: 2),
      action: action,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Color _getColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return AppColors.success;
      case SnackBarType.error:
        return AppColors.error;
      case SnackBarType.warning:
        return AppColors.warning;
      case SnackBarType.info:
        return AppColors.info;
    }
  }

  static IconData _getIcon(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Icons.check_circle;
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.warning:
        return Icons.warning;
      case SnackBarType.info:
        return Icons.info;
    }
  }
}

enum SnackBarType { success, error, warning, info }
