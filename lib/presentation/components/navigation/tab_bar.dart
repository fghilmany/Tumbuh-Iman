import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class TabBarCustom extends StatelessWidget {
  final List<String> tabs;
  final TabController controller;

  const TabBarCustom({
    super.key,
    required this.tabs,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: TabBar(
        controller: controller,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textSecondary,
        labelStyle: AppTextStyles.subtitle2,
        unselectedLabelStyle: AppTextStyles.body2,
        indicatorColor: AppColors.primary,
        indicatorWeight: 3,
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
      ),
    );
  }
}