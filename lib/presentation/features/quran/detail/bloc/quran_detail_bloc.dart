import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/presentation/features/quran/detail/bloc/quran_detail_event.dart';
import 'package:tumbuh_iman/presentation/features/quran/detail/bloc/quran_detail_state.dart';
import 'package:tumbuh_iman/usecase/quran/get_quran_use_case.dart';

@injectable
class QuranDetailBloc extends Bloc<QuranDetailEvent, QuranDetailState>{
  final GetQuranUseCase _getQuranUseCase;


  QuranDetailBloc(this._getQuranUseCase) : super(const QuranDetailInitial()) {
    on<LoadAyahList>(_onLoadAyahList);
  }

  Future<void> _onLoadAyahList(
      LoadAyahList event,
      Emitter<QuranDetailState> emit,
      ) async {
    emit(const QuranDetailLoading());

    final result = await _getQuranUseCase.getSurahById(event.surahId);

    result.when(
      success: (surahEntity) {
        if (surahEntity == null) {
          emit(const QuranDetailError('No data available'));
          return;
        }
        emit(QuranDetailLoaded(surahEntity: surahEntity));
      },
      failure: (message, exception) {
        emit(QuranDetailError(message));
      },
    );
  }
}