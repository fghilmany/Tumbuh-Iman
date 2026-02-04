import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tumbuh_iman/presentation/features/splash/bloc/splash_event.dart';
import 'package:tumbuh_iman/presentation/features/splash/bloc/splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
    on<SplashCompleted>(_onSplashCompleted);
  }

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    try {
      emit(const SplashLoading());

      // Simulate initialization tasks
      await Future.delayed(const Duration(milliseconds: 500));

      emit(const SplashAnimating());

      // Wait for animation to complete
      await Future.delayed(const Duration(milliseconds: 2500));

      emit(const SplashSuccess());
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
