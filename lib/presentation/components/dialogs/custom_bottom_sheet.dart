import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class CustomBottomSheet extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? height;
  final bool isDismissible;

  const CustomBottomSheet({
    super.key,
    this.title,
    required this.child,
    this.height,
    this.isDismissible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusXL),
          topRight: Radius.circular(AppDimensions.radiusXL),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            margin: EdgeInsets.symmetric(vertical: AppDimensions.spaceM),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.divider,
              borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
            ),
          ),

          // Title
          if (title != null) ...[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingL,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title!, style: AppTextStyles.headline6),
                  if (isDismissible)
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                ],
              ),
            ),
            Divider(height: 1),
            SizedBox(height: AppDimensions.spaceM),
          ],

          // Content
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingL,
                vertical: AppDimensions.paddingM,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    required Widget child,
    double? height,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheet(
        title: title,
        height: height,
        isDismissible: isDismissible,
        child: child,
      ),
    );
  }
}