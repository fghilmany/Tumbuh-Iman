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
  const QuranDetailLoaded({required this.surahEntity});

  @override
  List<Object?> get props => [surahEntity];
}

class QuranDetailError extends QuranDetailState {
  final String message;
  const QuranDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
