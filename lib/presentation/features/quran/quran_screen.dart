import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tumbuh_iman/core/extensions/translations_extenstion.dart';
import 'package:tumbuh_iman/core/router/app_router_const.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/gen/assets.gen.dart';
import 'package:tumbuh_iman/presentation/components/cards/action_card.dart';
import 'package:tumbuh_iman/presentation/components/cards/info_card.dart';
import 'package:tumbuh_iman/presentation/components/feedback/snackbar_helper.dart';
import 'package:tumbuh_iman/presentation/components/misc/image_custom.dart';
import 'package:tumbuh_iman/presentation/components/misc/badge.dart' as custom;
import 'package:tumbuh_iman/presentation/components/misc/language_selector.dart';
import 'package:tumbuh_iman/presentation/features/quran/bloc/quran_bloc.dart';
import 'package:tumbuh_iman/presentation/features/quran/bloc/quran_event.dart';
import 'package:tumbuh_iman/presentation/features/quran/bloc/quran_state.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuranBloc>()..add(const LoadSurahList()),
      child: const _QuranScreenView(),
    );
  }
}

class _QuranScreenView extends StatelessWidget {
  const _QuranScreenView();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryVeryLight,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: -30,
              left: 0,
              right: 0,
              child: ImageCustom(
                path: Assets.vector.header.path,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppDimensions.paddingM,
                right: AppDimensions.paddingM,
                top: AppDimensions.paddingM,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: LanguageSelector(
                      onLanguageChanged: (locale) {;
                        SnackbarHelper.show(
                          context,
                          'language_changed_to'.trParams(
                            {
                              '0': locale,
                            }
                          ),
                          type: SnackBarType.success,
                        );
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("bismillah".tr, style: AppTextStyles.headline5),
                      Text("next_prayer_times".trParams(
                        {
                          "0": "Dzuhur",
                        }
                      ), style: AppTextStyles.body2),
                      Text("12:13:22", style: AppTextStyles.headline1),
                      SizedBox(height: AppDimensions.spaceS),
                      custom.Badge(
                        text: "02:00 PM",
                        textColor: AppColors.textPrimary,
                        backgroundColor: AppColors.background.withValues(alpha: 0.75),
                        prefix: Icon(
                          Icons.access_time,
                          size: AppDimensions.iconXS,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: AppDimensions.spaceL),
                      Row(
                        children: [
                          ActionCard(
                            icon: Icons.history,
                            title: 'last_read'.tr,
                            color: AppColors.primary,
                            onTap: () {},
                          ),
                          SizedBox(width: 12),
                          ActionCard(
                            icon: Icons.bookmark,
                            color: AppColors.primary,
                            title: 'bookmarks'.tr,
                            onTap: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimensions.spaceM),
                      Flexible(
                        child: BlocBuilder<QuranBloc, QuranState>(
                          builder: (context, state) {
                            if (state is QuranLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (state is QuranError) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      size: 48,
                                      color: AppColors.error,
                                    ),
                                    SizedBox(height: AppDimensions.spaceM),
                                    Text(
                                      state.message,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.body2.copyWith(
                                        color: AppColors.error,
                                      ),
                                    ),
                                    SizedBox(height: AppDimensions.spaceM),
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read<QuranBloc>().add(
                                          const LoadSurahList(),
                                        );
                                      },
                                      child: const Text('Retry'),
                                    ),
                                  ],
                                ),
                              );
                            }

                            if (state is QuranLoaded) {
                              final surahs = state.quranEntity.listSurah;

                              return RefreshIndicator(
                                onRefresh: () async {
                                  context.read<QuranBloc>().add(
                                    const LoadSurahList(),
                                  );
                                },
                                child: ListView.builder(
                                  itemCount: surahs.length,
                                  itemBuilder: (context, index) {
                                    final surah = surahs[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: AppDimensions.paddingS,
                                      ),
                                      child: InfoCard(
                                        title: "${surah.latinName} (${surah.name})",
                                        subtitle: "surah_ayah".trParams(
                                          {
                                            "0": surah.meaning,
                                            "1": surah.numberOfAyah.toString(),
                                          }
                                        ),
                                        onTap: () {
                                          context.push(AppRouterConst.quran.detail(surah.id));
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
