import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void incrementPoints({required bool isTeamA, required int points}) => isTeamA
      ? emit(state.copyWith(aPoints: state.aPoints + points))
      : emit(state.copyWith(bPoints: state.bPoints + points));

  void reset() => emit(CounterState.initial());
}
