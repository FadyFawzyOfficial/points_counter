import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/counter/counter_cubit.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.orange),
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Points Counter')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Team A',
                      style: TextStyle(fontSize: 32),
                    ),
                    BlocBuilder<CounterCubit, CounterState>(
                      buildWhen: (previous, current) =>
                          previous.aPoints != current.aPoints,
                      builder: (context, state) {
                        return Text(
                          '${state.aPoints}',
                          style: const TextStyle(fontSize: 128),
                        );
                      },
                    ),
                    ScoreIncrementor(
                      add1Point: () => context
                          .read<CounterCubit>()
                          .incrementPoints(isTeamA: true, points: 1),
                      add2Points: () => context
                          .read<CounterCubit>()
                          .incrementPoints(isTeamA: true, points: 2),
                      add3Points: () => context
                          .read<CounterCubit>()
                          .incrementPoints(isTeamA: true, points: 3),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 300,
                  child: VerticalDivider(thickness: 1),
                ),
                Column(
                  children: [
                    const Text(
                      'Team B',
                      style: TextStyle(fontSize: 32),
                    ),
                    BlocBuilder<CounterCubit, CounterState>(
                      buildWhen: (previous, current) =>
                          previous.bPoints != current.bPoints,
                      builder: (context, state) {
                        return Text(
                          '${state.bPoints}',
                          style: const TextStyle(fontSize: 128),
                        );
                      },
                    ),
                    ScoreIncrementor(
                      add1Point: () => context
                          .read<CounterCubit>()
                          .incrementPoints(isTeamA: false, points: 1),
                      add2Points: () => context
                          .read<CounterCubit>()
                          .incrementPoints(isTeamA: false, points: 2),
                      add3Points: () => context
                          .read<CounterCubit>()
                          .incrementPoints(isTeamA: false, points: 3),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: MainElevatedButton(
                  label: 'Reset',
                  onPressed: context.read<CounterCubit>().reset,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScoreIncrementor extends StatelessWidget {
  final VoidCallback add1Point;
  final VoidCallback add2Points;
  final VoidCallback add3Points;

  const ScoreIncrementor({
    super.key,
    required this.add1Point,
    required this.add2Points,
    required this.add3Points,
  });

  @override
  Widget build(context) {
    return Column(
      children: [
        MainElevatedButton(
          points: 1,
          onPressed: add1Point,
        ),
        MainElevatedButton(
          points: 2,
          onPressed: add2Points,
        ),
        MainElevatedButton(
          points: 3,
          onPressed: add3Points,
        ),
      ],
    );
  }
}

class MainElevatedButton extends StatelessWidget {
  final String? label;
  final int? points;
  final VoidCallback onPressed;

  const MainElevatedButton({
    super.key,
    this.label,
    this.points,
    required this.onPressed,
  });

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(fixedSize: const Size.fromWidth(128)),
      onPressed: onPressed,
      child: Text(label ?? 'Add $points Points'),
    );
  }
}
