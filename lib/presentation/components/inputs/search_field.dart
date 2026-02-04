import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class SearchField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onClear;
  final bool showClearButton;

  const SearchField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.onClear,
    this.showClearButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: AppTextStyles.body1,
      decoration: InputDecoration(
        hintText: hint ?? 'Search...',
        hintStyle: AppTextStyles.body2.copyWith(
          color: AppColors.textHint,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.textSecondary,
          size: AppDimensions.iconM,
        ),
        suffixIcon: showClearButton && controller?.text.isNotEmpty == true
            ? IconButton(
          icon: Icon(
            Icons.clear,
            color: AppColors.textSecondary,
            size: AppDimensions.iconS,
          ),
          onPressed: () {
            controller?.clear();
            onClear?.call();
          },
        )
            : null,
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingM,
          vertical: AppDimensions.paddingS,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}