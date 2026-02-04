import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class FloatingActionButtonCustom extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;
  final bool isExtended;
  final String? label;

  const FloatingActionButtonCustom({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.isExtended = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    if (isExtended && label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        tooltip: tooltip,
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.textOnAccent,
        elevation: AppDimensions.elevationM,
        icon: Icon(icon),
        label: Text(label!),
      );
    }

    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      backgroundColor: AppColors.accent,
      foregroundColor: AppColors.textOnAccent,
      elevation: AppDimensions.elevationM,
      child: Icon(icon),
    );
  }
}