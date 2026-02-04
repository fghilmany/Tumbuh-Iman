// lib/presentation/components/cards/info_card.dart

import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/theme/app_decorations.dart';
import 'package:tumbuh_iman/presentation/components/misc/image_custom.dart';

class InfoCard extends StatelessWidget {
  final IconData? icon;
  final String? iconPath; // NEW: Path to SVG/PNG
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool showArrow;

  const InfoCard({
    super.key,
    this.icon,
    this.iconPath, // NEW
    required this.title,
    required this.subtitle,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.showArrow = true,
  }) : assert(icon != null || iconPath != null, 'Either icon or iconPath must be provided');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundColor != null
          ? AppDecorations.cardDecoration.copyWith(color: backgroundColor)
          : AppDecorations.cardDecoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.paddingM),
            child: Row(
              children: [
                // Icon container
                Container(
                  width: AppDimensions.iconXL,
                  height: AppDimensions.iconXL,
                  decoration: BoxDecoration(
                    color: (iconColor ?? AppColors.primary).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                  ),
                  child: Center(
                    child: _buildIcon(),
                  ),
                ),
                SizedBox(width: AppDimensions.spaceM),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTextStyles.subtitle1),
                      SizedBox(height: AppDimensions.spaceXS),
                      Text(
                        subtitle,
                        style: AppTextStyles.caption,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Arrow
                if (showArrow && onTap != null) ...[
                  SizedBox(width: AppDimensions.spaceS),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.textSecondary,
                    size: AppDimensions.iconM,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (iconPath != null) {
      // Use image (SVG or PNG)
      return ImageCustom(
        path: iconPath!,
        width: AppDimensions.iconM,
        height: AppDimensions.iconM,
        color: iconColor ?? AppColors.primary,
      );
    } else {
      // Use icon
      return Icon(
        icon!,
        color: iconColor ?? AppColors.primary,
        size: AppDimensions.iconM,
      );
    }
  }
}