// lib/presentation/components/cards/feature_card.dart

import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/components/misc/image_custom.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData? icon;
  final String? iconPath; // NEW: Path to SVG/PNG
  final VoidCallback onTap;
  final Gradient? gradient;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.iconPath, // NEW
    required this.onTap,
    this.gradient,
  }) : assert(icon != null || iconPath != null, 'Either icon or iconPath must be provided');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        gradient: gradient ?? AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.paddingM),
            child: Row(
              children: [
                // Icon
                Container(
                  width: AppDimensions.iconXL,
                  height: AppDimensions.iconXL,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.headline5.copyWith(
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: AppDimensions.spaceXS),
                      Text(
                        description,
                        style: AppTextStyles.body2.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Arrow
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: AppDimensions.iconS,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (iconPath != null) {
      return ImageCustom(
        path: iconPath!,
        width: AppDimensions.iconL,
        height: AppDimensions.iconL,
        color: Colors.white,
      );
    } else {
      return Icon(
        icon!,
        color: Colors.white,
        size: AppDimensions.iconL,
      );
    }
  }
}