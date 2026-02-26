import 'package:equatable/equatable.dart';

class QuranCalcState extends Equatable {
  final String target;
  final String totalDays;
  final String timesPerDay;
  final double pagesPerDay;
  final double pagesPerTime;
  final bool hasResult;

  const QuranCalcState({
    this.target = '',
    this.totalDays = '',
    this.timesPerDay = '',
    this.pagesPerDay = 0,
    this.pagesPerTime = 0,
    this.hasResult = false,
  });

  QuranCalcState copyWith({
    String? target,
    String? totalDays,
    String? timesPerDay,
    double? pagesPerDay,
    double? pagesPerTime,
    bool? hasResult,
  }) {
    return QuranCalcState(
      target: target ?? this.target,
      totalDays: totalDays ?? this.totalDays,
      timesPerDay: timesPerDay ?? this.timesPerDay,
      pagesPerDay: pagesPerDay ?? this.pagesPerDay,
      pagesPerTime: pagesPerTime ?? this.pagesPerTime,
      hasResult: hasResult ?? this.hasResult,
    );
  }

  @override
  List<Object?> get props => [
        target,
        totalDays,
        timesPerDay,
        pagesPerDay,
        pagesPerTime,
        hasResult,
      ];
}