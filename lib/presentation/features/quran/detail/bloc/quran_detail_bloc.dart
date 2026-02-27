import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/presentation/features/quran/detail/bloc/quran_detail_event.dart';
import 'package:tumbuh_iman/presentation/features/quran/detail/bloc/quran_detail_state.dart';
import 'package:tumbuh_iman/usecase/quran/get_quran_use_case.dart';
import 'package:tumbuh_iman/usecase/quran/set_quran_use_case.dart';

@injectable
class QuranDetailBloc extends Bloc<QuranDetailEvent, QuranDetailState> {
  final GetQuranUseCase _getQuranUseCase;
  final SetQuranUseCase _setQuranUseCaseQuranUseCase;

  QuranDetailBloc(this._getQuranUseCase, this._setQuranUseCaseQuranUseCase) : super(const QuranDetailInitial()) {
    on<LoadAyahList>(_onLoadAyahList);
    on<PlayAyahAudio>(_onPlayAyahAudio);
    on<StopAyahAudio>(_onStopAyahAudio);
    on<AudioCompleted>(_onAudioCompleted);
    on<ToggleBookmark>(_onToggleBookmark);
  }

  AudioPlayer? _audioPlayer;
  StreamSubscription? _playerSubscription;

  AudioPlayer get _player {
    if (_audioPlayer == null) {
      _audioPlayer = AudioPlayer();
      _playerSubscription = _audioPlayer!.onPlayerStateChanged.listen((
        playerState,
      ) {
        if (playerState == PlayerState.completed) {
          add(const AudioCompleted());
        }
      });
    }
    return _audioPlayer!;
  }

  Future<void> _onLoadAyahList(
    LoadAyahList event,
    Emitter<QuranDetailState> emit,
  ) async {
    emit(const QuranDetailLoading());

    // Store last read surah every time detail is opened
    await _setQuranUseCaseQuranUseCase.setLastReadSurah(event.surahId);

    final result = await _getQuranUseCase.getSurahById(event.surahId);

    result.when(
      success: (surahEntity) {
        if (surahEntity == null) {
          emit(const QuranDetailError('No data available'));
          return;
        }
        emit(
          QuranDetailLoaded(
            surahEntity: surahEntity,
            isBookmarked: surahEntity.isBookmarked ?? false,
          ),
        );
      },
      failure: (message, exception) {
        emit(QuranDetailError(message));
      },
    );
  }

  Future<void> _onToggleBookmark(
    ToggleBookmark event,
    Emitter<QuranDetailState> emit,
  ) async {
    final currentState = state;
    if (currentState is! QuranDetailLoaded) return;
    final newBookmarkStatus = !currentState.isBookmarked;
    emit(currentState.copyWith(isBookmarked: newBookmarkStatus));
    await _setQuranUseCaseQuranUseCase.setBookmarkStatus(event.surahId, newBookmarkStatus);
  }

  Future<void> _onPlayAyahAudio(
    PlayAyahAudio event,
    Emitter<QuranDetailState> emit,
  ) async {
    final currentState = state;
    if (currentState is! QuranDetailLoaded) return;
    emit(currentState.copyWith(playingAudioUrl: event.audioUrl));
    try {
      await _player.stop();
      await _player.play(UrlSource(event.audioUrl));
    } catch (e) {
      emit(QuranDetailError('Failed to play audio: $e'));
    }
  }

  Future<void> _onStopAyahAudio(
    StopAyahAudio event,
    Emitter<QuranDetailState> emit,
  ) async {
    final currentState = state;
    if (currentState is! QuranDetailLoaded) return;
    emit(currentState.copyWith(clearAudio: true));
    await _player.stop();
  }

  Future<void> _onAudioCompleted(
    AudioCompleted event,
    Emitter<QuranDetailState> emit,
  ) async {
    final currentState = state;
    if (currentState is! QuranDetailLoaded) return;
    emit(currentState.copyWith(clearAudio: true));
  }

  @override
  Future<void> close() {
    _playerSubscription?.cancel();
    _audioPlayer?.dispose();
    return super.close();
  }
}
