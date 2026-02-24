
import 'package:equatable/equatable.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object?> get props => [];
}

class QuranInitial extends QuranState {
  const QuranInitial();
}

class QuranLoading extends QuranState {
  const QuranLoading();
}

class QuranLoaded extends QuranState {
  final QuranEntity quranEntity;

  const QuranLoaded({
    required this.quranEntity,
  });

  QuranLoaded copyWith({
    int? navigateToSurahId,
  }) {
    return QuranLoaded(
      quranEntity: quranEntity,
    );
  }

  @override
  List<Object?> get props => [quranEntity];
}

class QuranError extends QuranState {
  final String message;

  const QuranError(this.message);

  @override
  List<Object?> get props => [message];
}

class QuranLastReadToDetail extends QuranState {
  final int quranId;

  const QuranLastReadToDetail(this.quranId);

  @override
  List<Object?> get props => [quranId];
}

class QuranBookmarkedToDetail extends QuranState {
  final int quranId;

  const QuranBookmarkedToDetail(this.quranId);

  @override
  List<Object?> get props => [quranId];
}

class QuranNotFound extends QuranState {
  final String message;

  const QuranNotFound(this.message);

  @override
  List<Object?> get props => [message];
}

