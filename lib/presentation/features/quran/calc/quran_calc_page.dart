import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                Text("Read Quran Calculator", style: AppTextStyles.headline3),
                SizedBox(height: AppDimensions.spaceM),
                Text(
                  "Kalkulator ini untuk alquran mushaf usmani (15 baris perhalaman)",
                  style: AppTextStyles.subtitle2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppDimensions.spaceXXL),
                TextFieldCustom(
                  hint: "Target khatam dalam 1 bulan",
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    context.read<QuranCalcBloc>().add(UpdateTarget(value));
                  },
                ),
                SizedBox(height: AppDimensions.spaceM),
                TextFieldCustom(
                  hint: "Total hari dalam 1 bulan",
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    context.read<QuranCalcBloc>().add(UpdateTotalDays(value));
                  },
                ),
                SizedBox(height: AppDimensions.spaceM),
                TextFieldCustom(
                  hint: "Membaca quran dalam 1 hari",
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
                      title: "Hasil",
                      items: [
                        SummaryItem(
                          icon: Icons.menu_book_outlined,
                          label: "Halaman per Hari",
                          value: pagesPerDay,
                        ),
                        SummaryItem(
                          icon: Icons.alarm_rounded,
                          label: "Per waktu (${timesPerDay}x sehari)",
                          value: "$pagesPerTime halaman",
                        ),
                        SummaryItem(
                          icon: Icons.calendar_today_outlined,
                          label: "Total hari",
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
