import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tumbuh_iman/presentation/features/quran/calc/bloc/quran_calc_event.dart';
import 'package:tumbuh_iman/presentation/features/quran/calc/bloc/quran_calc_state.dart';

class QuranCalcBloc extends Bloc<QuranCalcEvent, QuranCalcState> {
  QuranCalcBloc() : super(const QuranCalcInitial()) {
    on<CalculateValue>(_onCalculateValue);
  }

  Future<void> _onCalculateValue(
    CalculateValue event,
    Emitter<QuranCalcState> emit,
  ) async {
    emit(const QuranCalcLoading());

    // Simulate a calculation process
    await Future.delayed(const Duration(seconds: 2));

    // For demonstration, we just return the input value multiplied by 2
    final result = event.inputValue * 2;

    emit(QuranCalcLoaded(result));
  }

}