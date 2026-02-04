import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class DividerCustom extends StatelessWidget {
  final String? text;
  final double height;
  final double thickness;
  final Color? color;

  const DividerCustom({
    super.key,
    this.text,
    this.height = 1,
    this.thickness = 1,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (text != null) {
      return Row(
        children: [
          Expanded(
            child: Divider(
              height: height,
              thickness: thickness,
              color: color ?? AppColors.divider,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingM),
            child: Text(
              text!,
              style: AppTextStyles.caption,
            ),
          ),
          Expanded(
            child: Divider(
              height: height,
              thickness: thickness,
              color: color ?? AppColors.divider,
            ),
          ),
        ],
      );
    }

    return Divider(
      height: height,
      thickness: thickness,
      color: color ?? AppColors.divider,
    );
  }
}