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

