import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';

class RefreshIndicatorCustom extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const RefreshIndicatorCustom({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primary,
      backgroundColor: AppColors.surface,
      child: child,
    );
  }
}