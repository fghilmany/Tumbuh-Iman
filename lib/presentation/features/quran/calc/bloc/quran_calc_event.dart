import 'package:equatable/equatable.dart';

class QuranCalcEvent extends Equatable {
  const QuranCalcEvent();

  @override
  List<Object?> get props => [];
}

class UpdateTarget extends QuranCalcEvent {
  final String value;

  const UpdateTarget(this.value);

  @override
  List<Object?> get props => [value];
}

class UpdateTotalDays extends QuranCalcEvent {
  final String value;

  const UpdateTotalDays(this.value);

  @override
  List<Object?> get props => [value];
}

class UpdateTimesPerDay extends QuranCalcEvent {
  final String value;

  const UpdateTimesPerDay(this.value);

  @override
  List<Object?> get props => [value];
}