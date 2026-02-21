import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tumbuh_iman/core/extensions/translations_extenstion.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/gen/assets.gen.dart';
import 'package:tumbuh_iman/presentation/components/buttons/floating_action_button_custom.dart';
import 'package:tumbuh_iman/presentation/components/misc/badge.dart' as custom;
import 'package:tumbuh_iman/presentation/components/misc/icon_custom.dart';
import 'package:tumbuh_iman/presentation/components/misc/image_custom.dart';
import 'package:tumbuh_iman/presentation/components/navigation/custom_app_bar.dart';
import 'package:tumbuh_iman/presentation/features/quran/detail/bloc/quran_detail_bloc.dart';
import 'package:tumbuh_iman/presentation/features/quran/detail/bloc/quran_detail_event.dart';
import 'package:tumbuh_iman/presentation/features/quran/detail/bloc/quran_detail_state.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';

class QuranDetailPage extends StatelessWidget {
  const QuranDetailPage({super.key, required this.surahId});

  final int surahId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuranDetailBloc>()..add(LoadAyahList(surahId)),
      child: const _QuranDetailScreenView(),
    );
  }
}

class _QuranDetailScreenView extends StatelessWidget {
  const _QuranDetailScreenView();

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
                  left: AppDimensions.paddingM,
                  right: AppDimensions.paddingM,
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
                      child: BlocBuilder<QuranDetailBloc, QuranDetailState>(
                        builder: (context, state) {
                          if (state is QuranDetailLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is QuranDetailError) {
                            return Center(
                              child: Text(
                                state.message,
                                style: AppTextStyles.body2.copyWith(
                                  color: AppColors.error,
                                ),
                              ),
                            );
                          } else if (state is QuranDetailLoaded) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  state.surahEntity.latinName,
                                  style: AppTextStyles.headline3.copyWith(
                                    color: AppColors.primaryDark,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "ayah".trParams(
                                        {
                                          "0": state.surahEntity.numberOfAyahs.toString()
                                        }
                                      ),
                                      style: AppTextStyles.body2,
                                    ),
                                    SizedBox(width: AppDimensions.spaceS),
                                    Text("-", style: AppTextStyles.body2),
                                    SizedBox(width: AppDimensions.spaceS),
                                    Text(
                                      state.surahEntity.revelationPlace,
                                      style: AppTextStyles.body2,
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppDimensions.spaceM),
                                ImageCustom(
                                  path: Assets.image.bismillah.path,
                                  width: 140,
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
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
              BlocBuilder<QuranDetailBloc, QuranDetailState>(
                builder: (context, state) {
                  switch (state) {
                    case QuranDetailInitial():
                    case QuranDetailLoading():
                      return const Center(child: CircularProgressIndicator());
                    case QuranDetailError(message: final message):
                      return Center(
                        child: Text(
                          message,
                          style: AppTextStyles.body2.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      );
                    case QuranDetailLoaded():
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(16.0),
                        itemCount: state.surahEntity.listAyah.length,
                        itemBuilder: (context, index) {
                          final ayah = state.surahEntity.listAyah[index];
                          final isPlaying = state.playingAudioUrl == ayah.audioUrl;
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    ayah.arabText,
                                    style: AppTextStyles.arabicSmall,
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(height: AppDimensions.spaceS),
                                  Text(
                                    ayah.translation,
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
                                      final audioUrl = ayah.audioUrl;
                                      if (audioUrl == null) return;
                                      if (isPlaying) {
                                        context.read<QuranDetailBloc>().add(const StopAyahAudio());
                                      } else {
                                        context.read<QuranDetailBloc>().add(PlayAyahAudio(audioUrl));
                                      }
                                    },
                                    child: Icon(
                                      isPlaying
                                          ? Icons.stop_circle_outlined
                                          : Icons.play_circle_outline,
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
                      );
                    default:
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
