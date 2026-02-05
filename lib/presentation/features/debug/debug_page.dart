import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:tumbuh_iman/core/router/app_router_const.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/presentation/components/buttons/primary_button.dart';
import 'package:tumbuh_iman/presentation/components/cards/info_card.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    final talker = getIt<Talker>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Tools'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
      ),
      body: ListView(
        padding: EdgeInsets.all(AppDimensions.paddingM),
        children: [
          // Header
          Text(
            'Developer Tools',
            style: AppTextStyles.headline4,
          ),
          SizedBox(height: AppDimensions.spaceS),
          Text(
            'Access debugging tools and logs',
            style: AppTextStyles.body2.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: AppDimensions.spaceXL),

          // Logging Section
          Text(
            'Logging',
            style: AppTextStyles.headline5,
          ),
          SizedBox(height: AppDimensions.spaceM),

          // Talker Logs Card
          InfoCard(
            icon: Icons.receipt_long,
            iconColor: AppColors.info,
            title: 'View Logs',
            subtitle: 'Open Talker logs viewer',
            onTap: () {
              context.push(AppRouterConst.talker);
            },
          ),
          SizedBox(height: AppDimensions.spaceM),

          // Component Showcase Card
          InfoCard(
            icon: Icons.widgets,
            iconColor: AppColors.primary,
            title: 'Component Showcase',
            subtitle: 'View all UI components',
            onTap: () {
              context.push(AppRouterConst.componentShowcase);
            },
          ),
          SizedBox(height: AppDimensions.spaceM),

          // Generate Test Logs
          PrimaryButton(
            text: 'Generate Test Logs',
            icon: Icons.bug_report,
            onPressed: () {
              talker.debug('🐛 Debug log from Debug Screen');
              talker.info('ℹ️ Info log from Debug Screen');
              talker.warning('⚠️ Warning log from Debug Screen');
              talker.error('❌ Error log from Debug Screen');
              talker.critical('🔥 Critical log from Debug Screen');

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Test logs generated!'),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
          SizedBox(height: AppDimensions.spaceXL),

          // App Info Section
          Text(
            'App Information',
            style: AppTextStyles.headline5,
          ),
          SizedBox(height: AppDimensions.spaceM),

          _buildInfoRow('Environment', 'Development'),
          _buildInfoRow('Flutter Version', 'Using FVM'),
          _buildInfoRow('Logs Count', '${talker.history.length}'),

          SizedBox(height: AppDimensions.spaceXL),

          // Actions Section
          Text(
            'Actions',
            style: AppTextStyles.headline5,
          ),
          SizedBox(height: AppDimensions.spaceM),

          InfoCard(
            icon: Icons.delete_outline,
            iconColor: AppColors.error,
            title: 'Clear Logs',
            subtitle: 'Remove all logs from history',
            onTap: () {
              talker.cleanHistory();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Logs cleared!'),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.spaceS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.body1.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.body1.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}