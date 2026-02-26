import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_calc_entity.dart';
import 'package:tumbuh_iman/usecase/quran/calculate_quran_reading_use_case.dart';

class CalculateQuranReadingUseCaseImpl implements CalculateQuranReadingUseCase {
  static const int _totalPage = 604;

  @override
  Result<QuranCalcEntity> execute({
    required int target,
    required int totalDays,
    required int timesPerDay,
  }) {
    if (target <= 0 || totalDays <= 0 || timesPerDay <= 0) {
      return const Result.failure('All values must be greater than 0');
    }

    final pagesPerDay = (_totalPage * target) / totalDays;
    final pagesPerTime = pagesPerDay / timesPerDay;

    return Result.success(
      QuranCalcEntity(
        pagesPerDay: pagesPerDay,
        pagesPerTime: pagesPerTime,
        totalDays: totalDays,
      ),
    );
  }
}
