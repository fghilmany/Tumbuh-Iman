import 'package:equatable/equatable.dart';

class QuranCalcState extends Equatable {
  const QuranCalcState();

  @override
  List<Object?> get props => [];

}

class QuranCalcInitial extends QuranCalcState {
  const QuranCalcInitial();
}

class QuranCalcLoading extends QuranCalcState {
  const QuranCalcLoading();
}

class QuranCalcLoaded extends QuranCalcState {
  final int result;

  const QuranCalcLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class QuranCalcError extends QuranCalcState {
  final String message;

  const QuranCalcError(this.message);

  @override
  List<Object?> get props => [message];
}