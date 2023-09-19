import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var teamAScore = 0;
  var teamBScore = 0;

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.orange),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Points Counter'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ScoreCounter(
                    name: 'Team A',
                    score: teamAScore,
                    add1Point: () => setState(() => teamAScore++),
                    add2Points: () => setState(() => teamAScore += 2),
                    add3Points: () => setState(() => teamAScore += 3),
                  ),
                  const SizedBox(
                    height: 300,
                    child: VerticalDivider(thickness: 1),
                  ),
                  ScoreCounter(
                    name: 'Team B',
                    score: teamBScore,
                    add1Point: () => setState(() => teamBScore++),
                    add2Points: () => setState(() => teamBScore += 2),
                    add3Points: () => setState(() => teamBScore += 3),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: MainElevatedButton(
                    label: 'Reset',
                    onPressed: () => setState(() {
                      teamAScore = 0;
                      teamBScore = 0;
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreCounter extends StatelessWidget {
  final String name;
  final int score;
  final VoidCallback add1Point;
  final VoidCallback add2Points;
  final VoidCallback add3Points;

  const ScoreCounter({
    super.key,
    required this.name,
    required this.score,
    required this.add1Point,
    required this.add2Points,
    required this.add3Points,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 32),
        ),
        Text(
          '$score',
          style: const TextStyle(fontSize: 128),
        ),
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(fixedSize: const Size.fromWidth(128)),
      onPressed: onPressed,
      child: Text(label ?? 'Add $points Points'),
    );
  }
}
