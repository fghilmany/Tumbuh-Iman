import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_calc_entity.dart';

abstract interface class CalculateQuranReadingUseCase {
  /// Calculate how many pages per day and per reading session
  /// to complete [target] khatam in [totalDays] days,
  /// reading [timesPerDay] times a day.
  Result<QuranCalcEntity> execute({
    required int target,
    required int totalDays,
    required int timesPerDay,
  });
}
