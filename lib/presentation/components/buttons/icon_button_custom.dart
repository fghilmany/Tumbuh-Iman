// lib/presentation/components/buttons/icon_button_custom.dart

import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class IconButtonCustom extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? backgroundColor;
  final double? size;
  final String? tooltip;

  const IconButtonCustom({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.size,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    if (backgroundColor != null) {
      return Container(
        width: size ?? AppDimensions.iconL,
        height: size ?? AppDimensions.iconL,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        ),
        child: IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
          color: color ?? AppColors.textOnPrimary,
          iconSize: (size ?? AppDimensions.iconL) * 0.6,
          tooltip: tooltip,
          padding: EdgeInsets.zero,
        ),
      );
    }

    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      color: color ?? AppColors.primary,
      iconSize: size ?? AppDimensions.iconM,
      tooltip: tooltip,
    );
  }
}