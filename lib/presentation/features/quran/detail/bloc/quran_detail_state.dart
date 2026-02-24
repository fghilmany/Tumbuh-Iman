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
  final bool isBookmarked;

  const QuranDetailLoaded({
    required this.surahEntity,
    this.playingAudioUrl,
    this.isBookmarked = false,
  });

  QuranDetailLoaded copyWith({
    SurahEntity? surahEntity,
    String? playingAudioUrl,
    bool clearAudio = false,
    bool? isBookmarked,
  }) {
    return QuranDetailLoaded(
      surahEntity: surahEntity ?? this.surahEntity,
      playingAudioUrl: clearAudio ? null : (playingAudioUrl ?? this.playingAudioUrl),
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  @override
  List<Object?> get props => [surahEntity, playingAudioUrl, isBookmarked];
}

class QuranDetailError extends QuranDetailState {
  final String message;
  const QuranDetailError(this.message);

  @override
  List<Object?> get props => [message];
}


