import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTittle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final double? elevation;
  final Color? titleColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subTittle,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.headline6.copyWith(
              color: titleColor ?? AppColors.textOnPrimary,
            ),
          ),
          if (subTittle != null)
            Text(
              subTittle!,
              style: AppTextStyles.body2.copyWith(
                color: AppColors.textOnPrimary.withOpacity(0.7),
              ),
            ),
        ],
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? AppColors.primary,
      elevation: elevation ?? AppDimensions.appBarElevation,
      leading: leading,
      actions: actions,
      iconTheme: IconThemeData(
        color: AppColors.textOnPrimary,
        size: AppDimensions.iconM,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDimensions.appBarHeight);
}