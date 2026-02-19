import 'package:flutter/material.dart';
import 'package:tumbuh_iman/core/extensions/translations_extenstion.dart';
import 'package:tumbuh_iman/gen/assets.gen.dart';
import 'package:tumbuh_iman/presentation/components/buttons/floating_action_button_custom.dart';
import 'package:tumbuh_iman/presentation/components/misc/badge.dart' as custom;
import 'package:tumbuh_iman/presentation/components/misc/icon_custom.dart';
import 'package:tumbuh_iman/presentation/components/misc/image_custom.dart';
import 'package:tumbuh_iman/presentation/components/navigation/custom_app_bar.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';

class QuranDetailPage extends StatelessWidget {
  const QuranDetailPage({super.key, required this.surahId});

  final String surahId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Quran',
          titleColor: AppColors.textPrimary,
          backgroundColor: AppColors.background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.textPrimary,
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          actions: [
            IconButton(
              icon: const Icon(Icons.calculate_outlined),
              color: AppColors.textPrimary,
              onPressed: () {
                // Handle bookmark action
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButtonCustom(
          icon: Icons.bookmark_outline,
          label: "bookmark".tr,
          isExtended: true,
          onPressed: () {
            // Handle bookmark action
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: AppDimensions.paddingM,
                  left: AppDimensions.paddingL,
                  right: AppDimensions.paddingL,
                ),
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryLightGradient,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                ),
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(AppDimensions.paddingL),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Al-Fatihah",
                            style: AppTextStyles.headline3.copyWith(
                              color: AppColors.primaryDark,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("7 Ayat", style: AppTextStyles.body2),
                              SizedBox(width: AppDimensions.spaceS),
                              Text("-", style: AppTextStyles.body2),
                              SizedBox(width: AppDimensions.spaceS),
                              Text("Makkah", style: AppTextStyles.body2),
                            ],
                          ),
                          SizedBox(height: AppDimensions.spaceM),
                          ImageCustom(
                            path: Assets.image.bismillah.path,
                            width: 140,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -12,
                      right: -12,
                      child: IconCustom(
                        iconPath: Assets.icons.quranIconDark.path,
                        size: AppDimensions.iconXXL,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                itemCount: 14,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          custom.Badge(
                            text: '${index + 1}',
                            backgroundColor: AppColors.primaryLight,
                            textColor: AppColors.textPrimary,
                          ),
                          InkWell(
                            onTap: () {
                              // Handle share action
                            },
                            child: Icon(
                              Icons.more_horiz,
                              color: AppColors.textPrimary,
                              size: AppDimensions.iconS,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimensions.spaceM),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                            style: AppTextStyles.arabicSmall,
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: AppDimensions.spaceS),
                          Text(
                            'In the name of Allah, the Most Gracious, the Most Merciful',
                            style: AppTextStyles.body2,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimensions.spaceM),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              // Handle play action
                            },
                            child: Icon(
                              Icons.play_circle_outline,
                              color: AppColors.textPrimary,
                              size: AppDimensions.iconM,
                            ),
                          ),
                          SizedBox(width: AppDimensions.spaceXS),
                          InkWell(
                            onTap: () {
                              // Handle share action
                            },
                            child: Icon(
                              Icons.share_outlined,
                              color: AppColors.textPrimary,
                              size: AppDimensions.iconS,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimensions.spaceXL),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
