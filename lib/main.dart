import 'package:flutter/material.dart';

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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const Text(
                      '',
                      style: TextStyle(fontSize: 128),
                    ),
                    ScoreIncrementor(
                      add1Point: () {},
                      add2Points: () {},
                      add3Points: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 300,
                  child: VerticalDivider(thickness: 1),
                ),
                ScoreIncrementor(
                  add1Point: () {},
                  add2Points: () {},
                  add3Points: () {},
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: MainElevatedButton(
                  label: 'Reset',
                  onPressed: () {},
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
  Widget build(BuildContext context) {
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(fixedSize: const Size.fromWidth(128)),
      onPressed: onPressed,
      child: Text(label ?? 'Add $points Points'),
    );
  }
}
