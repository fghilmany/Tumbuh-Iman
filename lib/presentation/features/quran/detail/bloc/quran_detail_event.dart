import 'package:equatable/equatable.dart';

class QuranDetailEvent extends Equatable {
  const QuranDetailEvent();

  @override
  List<Object?> get props => [];

}

class LoadAyahList extends QuranDetailEvent {
  final int surahId;
  const LoadAyahList(this.surahId);

  @override
  List<Object?> get props => [surahId];
}

class PlayAyahAudio extends QuranDetailEvent {
  final String audioUrl;
  const PlayAyahAudio(this.audioUrl);

  @override
  List<Object?> get props => [audioUrl];
}

class StopAyahAudio extends QuranDetailEvent {
  const StopAyahAudio();
}

class AudioCompleted extends QuranDetailEvent {
  const AudioCompleted();
}

class ToggleBookmark extends QuranDetailEvent {
  final int surahId;
  const ToggleBookmark(this.surahId);

  @override
  List<Object?> get props => [surahId];
}

