import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/theme/app_decorations.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? color;
  final String? subtitle;
  final VoidCallback? onTap;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.color,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = color ?? AppColors.primary;

    return Container(
      decoration: AppDecorations.cardDecoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Container(
                  width: AppDimensions.iconL,
                  height: AppDimensions.iconL,
                  decoration: BoxDecoration(
                    color: effectiveColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                  ),
                  child: Icon(
                    icon,
                    color: effectiveColor,
                    size: AppDimensions.iconM,
                  ),
                ),
                SizedBox(height: AppDimensions.spaceM),

                // Title
                Text(
                  title,
                  style: AppTextStyles.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppDimensions.spaceXS),

                // Value
                Text(
                  value,
                  style: AppTextStyles.headline4.copyWith(
                    color: effectiveColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                // Subtitle (optional)
                if (subtitle != null) ...[
                  SizedBox(height: AppDimensions.spaceXS),
                  Text(
                    subtitle!,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textHint,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}