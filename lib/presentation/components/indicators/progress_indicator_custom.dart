import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class ProgressIndicatorCustom extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final String? label;
  final Color? color;
  final double height;

  const ProgressIndicatorCustom({
    super.key,
    required this.progress,
    this.label,
    this.color,
    this.height = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label!, style: AppTextStyles.caption),
              Text(
                '${(progress * 100).toInt()}%',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimensions.spaceS),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: height,
            backgroundColor: AppColors.primaryVeryLight,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}