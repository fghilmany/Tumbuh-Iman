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
    on<GetLastReadSurahId>(_onGetLastReadSurahId);
    on<GetBookmarkedSurahId>(_onGetBookmarkedSurahId);
  }

  Future<void> _onLoadSurahList(
    LoadSurahList event,
    Emitter<QuranState> emit,
  ) async {
    emit(const QuranLoading());

    final result = await _getQuranUseCase.getSurahList();

    result.when(
      success: (quranEntity) {
        if (quranEntity == null) {
          emit(const QuranError('No data available'));
          return;
        }
        emit(QuranLoaded(quranEntity: quranEntity));
      },
      failure: (message, exception) {
        emit(QuranError(message));
      },
    );
  }

  Future<void> _onGetLastReadSurahId(
    GetLastReadSurahId event,
    Emitter<QuranState> emit,
  ) async {
    final currentState = state;
    if (currentState is! QuranLoaded) return;

    final result = await _getQuranUseCase.getLastReadSurahId();
    result.when(
      success: (id) {
        emit(QuranLastReadToDetail(id));
        emit(currentState);
      },
      failure: (_, __) {
        emit(const QuranNotFound('No latest read surah'));
        emit(currentState);
      },
    );
  }

  Future<void> _onGetBookmarkedSurahId(
    GetBookmarkedSurahId event,
    Emitter<QuranState> emit,
  ) async {
    final currentState = state;
    if (currentState is! QuranLoaded) return;

    final result = await _getQuranUseCase.getBookmarkedSurahId();
    result.when(
      success: (id) {
        emit(QuranBookmarkedToDetail(id));
        emit(currentState);
      },
      failure: (_, __) {
        emit(const QuranNotFound('No bookmarked surah'));
        emit(currentState);
      },
    );
  }
}

