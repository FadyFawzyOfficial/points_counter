part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int aPoints;
  final int bPoints;

  const CounterState({
    required this.aPoints,
    required this.bPoints,
  });

  CounterState copyWith({
    int? aPoints,
    int? bPoints,
  }) {
    return CounterState(
      aPoints: aPoints ?? this.aPoints,
      bPoints: bPoints ?? this.bPoints,
    );
  }

  factory CounterState.initial() => const CounterState(aPoints: 0, bPoints: 0);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [aPoints, bPoints];
}
