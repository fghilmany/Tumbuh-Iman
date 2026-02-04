import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/theme/app_decorations.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final List<SummaryItem> items;
  final VoidCallback? onViewAll;

  const SummaryCard({
    super.key,
    required this.title,
    required this.items,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.cardDecoration,
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTextStyles.headline6),
                if (onViewAll != null)
                  TextButton(
                    onPressed: onViewAll,
                    child: Text(
                      'View All',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: AppDimensions.spaceM),

            // Items
            ...items.map((item) => Padding(
              padding: EdgeInsets.only(bottom: AppDimensions.spaceS),
              child: Row(
                children: [
                  Icon(
                    item.icon,
                    size: AppDimensions.iconS,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: AppDimensions.spaceS),
                  Expanded(
                    child: Text(
                      item.label,
                      style: AppTextStyles.body2,
                    ),
                  ),
                  Text(
                    item.value,
                    style: AppTextStyles.subtitle2.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class SummaryItem {
  final IconData icon;
  final String label;
  final String value;

  SummaryItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}