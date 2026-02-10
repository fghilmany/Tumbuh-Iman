import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/presentation/features/quran/bloc/quran_event.dart';
import 'package:tumbuh_iman/presentation/features/quran/bloc/quran_state.dart';
import 'package:tumbuh_iman/usecase/quran/get_quran_use_case.dart';

@injectable
class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final GetQuranUseCase _getQuranUseCase;

  QuranBloc(this._getQuranUseCase) : super(const QuranInitial()) {
    on<LoadSurahList>(_onLoadSurahList);
  }

  Future<void> _onLoadSurahList(
    LoadSurahList event,
    Emitter<QuranState> emit,
  ) async {
    emit(const QuranLoading());

    final result = await _getQuranUseCase.getSurahList();

    result.when(
      success: (quranEntity) {
        emit(QuranLoaded(quranEntity: quranEntity));
      },
      failure: (message, exception) {
        emit(QuranError(message));
      },
    );
  }
}

