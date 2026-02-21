import 'package:equatable/equatable.dart';
import 'package:tumbuh_iman/domain/entities/quran/surah_entity.dart';

class QuranDetailState extends Equatable {
  const QuranDetailState();
  @override
  List<Object?> get props => [];
}

class QuranDetailInitial extends QuranDetailState {
  const QuranDetailInitial();
}

class QuranDetailLoading extends QuranDetailState {
  const QuranDetailLoading();
}

class QuranDetailLoaded extends QuranDetailState {
  final SurahEntity surahEntity;
  final String? playingAudioUrl;

  const QuranDetailLoaded({
    required this.surahEntity,
    this.playingAudioUrl,
  });

  QuranDetailLoaded copyWith({
    SurahEntity? surahEntity,
    String? playingAudioUrl,
    bool clearAudio = false,
  }) {
    return QuranDetailLoaded(
      surahEntity: surahEntity ?? this.surahEntity,
      playingAudioUrl: clearAudio ? null : (playingAudioUrl ?? this.playingAudioUrl),
    );
  }

  @override
  List<Object?> get props => [surahEntity, playingAudioUrl];
}

class QuranDetailError extends QuranDetailState {
  final String message;
  const QuranDetailError(this.message);

  @override
  List<Object?> get props => [message];
}


