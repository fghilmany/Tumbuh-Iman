

import 'package:equatable/equatable.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object?> get props => [];
}

class LoadSurahList extends QuranEvent {
  const LoadSurahList();
}

class GetLastReadSurahId extends QuranEvent {
  const GetLastReadSurahId();
}

class GetBookmarkedSurahId extends QuranEvent {
  const GetBookmarkedSurahId();
}

