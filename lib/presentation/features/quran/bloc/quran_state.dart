
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

  @override
  List<Object?> get props => [quranEntity];
}

class QuranError extends QuranState {
  final String message;

  const QuranError(this.message);

  @override
  List<Object?> get props => [message];
}
