import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tumbuh_iman/core/extensions/translations_extenstion.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/presentation/components/cards/summary_card.dart';
import 'package:tumbuh_iman/presentation/components/inputs/text_field_custom.dart';
import 'package:tumbuh_iman/presentation/components/navigation/custom_app_bar.dart';
import 'package:tumbuh_iman/presentation/features/quran/calc/bloc/quran_calc_bloc.dart';
import 'package:tumbuh_iman/presentation/features/quran/calc/bloc/quran_calc_event.dart';
import 'package:tumbuh_iman/presentation/features/quran/calc/bloc/quran_calc_state.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';

class QuranCalcPage extends StatelessWidget {
  const QuranCalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuranCalcBloc>(),
      child: const _QuranCalcView(),
    );
  }
}

class _QuranCalcView extends StatelessWidget {
  const _QuranCalcView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "",
          backgroundColor: AppColors.background,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.textPrimary,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.spaceL),
            color: AppColors.background,
            child: Column(
              children: [
                Text("quran_calc_title".tr, style: AppTextStyles.headline3),
                SizedBox(height: AppDimensions.spaceM),
                Text(
                  "quran_calc_description".tr,
                  style: AppTextStyles.subtitle2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppDimensions.spaceS),
                Text(
                  "quran_calc_additional_description".tr,
                  style: AppTextStyles.overline,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppDimensions.spaceXXL),
                TextFieldCustom(
                  hint: "quran_calc_target_hint".tr,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    context.read<QuranCalcBloc>().add(UpdateTarget(value));
                  },
                ),
                SizedBox(height: AppDimensions.spaceM),
                TextFieldCustom(
                  hint: "quran_calc_total_day_hint".tr,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    context.read<QuranCalcBloc>().add(UpdateTotalDays(value));
                  },
                ),
                SizedBox(height: AppDimensions.spaceM),
                TextFieldCustom(
                  hint: "quran_calc_read_a_day_hint".tr,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    context.read<QuranCalcBloc>().add(UpdateTimesPerDay(value));
                  },
                ),
                SizedBox(height: AppDimensions.spaceM),
                BlocBuilder<QuranCalcBloc, QuranCalcState>(
                  builder: (context, state) {
                    final pagesPerDay = state.hasResult
                        ? state.pagesPerDay.ceil().toString()
                        : '-';
                    final pagesPerTime = state.hasResult
                        ? state.pagesPerTime.ceil().toString()
                        : '-';
                    final timesPerDay = state.timesPerDay.isNotEmpty
                        ? state.timesPerDay
                        : '-';
                    final totalDays = state.totalDays.isNotEmpty
                        ? state.totalDays
                        : '-';

                    return SummaryCard(
                      title: "result".tr,
                      items: [
                        SummaryItem(
                          icon: Icons.menu_book_outlined,
                          label: "pages_a_day".tr,
                          value: pagesPerDay,
                        ),
                        SummaryItem(
                          icon: Icons.alarm_rounded,
                          label: "per_time_x_day".trParams({
                            "0": timesPerDay.toString(),
                          }),
                          value: "xx_page".trParams({
                            "0": pagesPerTime.toString(),
                          }),
                        ),
                        SummaryItem(
                          icon: Icons.calendar_today_outlined,
                          label: "total_day".tr,
                          value: totalDays,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
