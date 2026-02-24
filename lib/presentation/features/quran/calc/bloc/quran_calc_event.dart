import 'package:equatable/equatable.dart';

class QuranCalcEvent extends Equatable {
  const QuranCalcEvent();

  @override
  List<Object?> get props => [];

}

class CalculateValue extends QuranCalcEvent {
  final int inputValue;

  const CalculateValue(this.inputValue);

  @override
  List<Object?> get props => [inputValue];
}