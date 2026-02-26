import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/presentation/features/quran/calc/bloc/quran_calc_event.dart';
import 'package:tumbuh_iman/presentation/features/quran/calc/bloc/quran_calc_state.dart';
import 'package:tumbuh_iman/usecase/quran/calculate_quran_reading_use_case.dart';

@injectable
class QuranCalcBloc extends Bloc<QuranCalcEvent, QuranCalcState> {
  final CalculateQuranReadingUseCase _calculateQuranReadingUseCase;

  QuranCalcBloc(this._calculateQuranReadingUseCase)
      : super(const QuranCalcState()) {
    on<UpdateTarget>(_onUpdateTarget);
    on<UpdateTotalDays>(_onUpdateTotalDays);
    on<UpdateTimesPerDay>(_onUpdateTimesPerDay);
  }

  void _onUpdateTarget(
    UpdateTarget event,
    Emitter<QuranCalcState> emit,
  ) {
    final newState = state.copyWith(target: event.value);
    emit(_calculate(newState));
  }

  void _onUpdateTotalDays(
    UpdateTotalDays event,
    Emitter<QuranCalcState> emit,
  ) {
    final newState = state.copyWith(totalDays: event.value);
    emit(_calculate(newState));
  }

  void _onUpdateTimesPerDay(
    UpdateTimesPerDay event,
    Emitter<QuranCalcState> emit,
  ) {
    final newState = state.copyWith(timesPerDay: event.value);
    emit(_calculate(newState));
  }

  QuranCalcState _calculate(QuranCalcState current) {
    final target = int.tryParse(current.target);
    final totalDays = int.tryParse(current.totalDays);
    final timesPerDay = int.tryParse(current.timesPerDay);

    if (target == null || totalDays == null || timesPerDay == null) {
      return current.copyWith(
        pagesPerDay: 0,
        pagesPerTime: 0,
        hasResult: false,
      );
    }

    final result = _calculateQuranReadingUseCase.execute(
      target: target,
      totalDays: totalDays,
      timesPerDay: timesPerDay,
    );

    return result.when(
      success: (entity) => current.copyWith(
        pagesPerDay: entity.pagesPerDay,
        pagesPerTime: entity.pagesPerTime,
        hasResult: true,
      ),
      failure: (message, _) => current.copyWith(
        pagesPerDay: 0,
        pagesPerTime: 0,
        hasResult: false,
      ),
    );
  }
}