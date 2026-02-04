import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';

class DrawerMenu extends StatelessWidget {
  final String? userName;
  final String? userEmail;
  final String? userAvatar;
  final List<DrawerMenuItem> items;

  const DrawerMenu({
    super.key,
    this.userName,
    this.userEmail,
    this.userAvatar,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppDimensions.paddingL),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    backgroundImage: userAvatar != null
                        ? NetworkImage(userAvatar!)
                        : null,
                    child: userAvatar == null
                        ? Icon(
                      Icons.person,
                      size: AppDimensions.iconL,
                      color: AppColors.primary,
                    )
                        : null,
                  ),
                  SizedBox(height: AppDimensions.spaceM),

                  // Name
                  if (userName != null)
                    Text(
                      userName!,
                      style: AppTextStyles.headline6.copyWith(
                        color: Colors.white,
                      ),
                    ),

                  // Email
                  if (userEmail != null) ...[
                    SizedBox(height: AppDimensions.spaceXS),
                    Text(
                      userEmail!,
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Menu items
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                if (item.isDivider) {
                  return Divider(height: 1);
                }
                return ListTile(
                  leading: Icon(
                    item.icon,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    item.title!,
                    style: AppTextStyles.body1,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    item.onTap?.call();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerMenuItem {
  final IconData? icon;
  final String? title;
  final VoidCallback? onTap;
  final bool isDivider;

  DrawerMenuItem({
    this.icon,
    this.title,
    this.onTap,
  }) : isDivider = false;

  DrawerMenuItem.divider()
      : icon = null,
        title = null,
        onTap = null,
        isDivider = true;
}