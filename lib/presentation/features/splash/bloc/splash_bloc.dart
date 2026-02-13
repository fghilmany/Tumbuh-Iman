import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';
import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/presentation/features/splash/bloc/splash_event.dart';
import 'package:tumbuh_iman/presentation/features/splash/bloc/splash_state.dart';
import 'package:tumbuh_iman/usecase/quran/get_quran_use_case.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._getQuranUseCase, this._talker) : super(const SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
    on<SplashCompleted>(_onSplashCompleted);
  }

  final GetQuranUseCase _getQuranUseCase;
  final Talker _talker;

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    try {
      emit(const SplashLoading());


      emit(const SplashAnimating());

      final result = await _getQuranUseCase.getSurahList(onlyStore: true);

      result?.when(
        success: (data) {
          // Quran data fetched successfully
          _talker.info(data.toString());
          emit(const SplashSuccess());
        },

        failure: (error, _) {
          emit(SplashError(error.toString()));
        },
      );

    } catch (e) {
      emit(SplashError(e.toString()));
    }
  }

  Future<void> _onSplashCompleted(
    SplashCompleted event,
    Emitter<SplashState> emit,
  ) async {
    emit(const SplashSuccess());
  }


}
