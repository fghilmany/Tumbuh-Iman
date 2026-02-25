import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/components/cards/summary_card.dart';
import 'package:tumbuh_iman/presentation/components/inputs/text_field_custom.dart';
import 'package:tumbuh_iman/presentation/components/navigation/custom_app_bar.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';
import 'package:tumbuh_iman/presentation/theme/app_dimensions.dart';
import 'package:tumbuh_iman/presentation/theme/app_text_styles.dart';

class QuranCalcPage extends StatelessWidget {
  const QuranCalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "",
          backgroundColor: AppColors.background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.textPrimary,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
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
                  hint: "Target dalam 1 bulan",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: AppDimensions.spaceM),
                TextFieldCustom(
                  hint: "Total hari dalam 1 bulan",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: AppDimensions.spaceM),
                TextFieldCustom(
                  hint: "Membaca quran dalam 1 hari",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: AppDimensions.spaceM),
                SummaryCard(
                  title: "Hasil",
                  viewAllText: "Ubah text",
                  onViewAll: (){

                  },
                  items: [
                    SummaryItem(
                      icon: Icons.menu_book_outlined,
                      label: "Halaman per Hari",
                      value: "6",
                    ),
                    SummaryItem(
                      icon: Icons.alarm_rounded,
                      label: "Per waktu (5x sehari)",
                      value: "1-2",
                    ),
                    SummaryItem(
                      icon: Icons.calendar_today_outlined,
                      label: "Total hari",
                      value: "28",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
