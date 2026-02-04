import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class TextFieldCustom extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? helperText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldCustom({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: AppTextStyles.subtitle2),
          SizedBox(height: AppDimensions.spaceS),
        ],
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: obscureText ? 1 : maxLines,
          maxLength: maxLength,
          enabled: enabled,
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          style: AppTextStyles.body1,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.body2.copyWith(
              color: AppColors.textHint,
            ),
            helperText: helperText,
            helperStyle: AppTextStyles.caption,
            prefixIcon: prefixIcon != null
                ? Icon(
              prefixIcon,
              color: AppColors.textSecondary,
              size: AppDimensions.iconM,
            )
                : null,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: enabled ? AppColors.surface : AppColors.surfaceVariant,
            contentPadding: EdgeInsets.all(AppDimensions.paddingM),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
              borderSide: BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
              borderSide: BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
              borderSide: BorderSide(color: AppColors.error, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
              borderSide: BorderSide(color: AppColors.border),
            ),
          ),
        ),
      ],
    );
  }
}