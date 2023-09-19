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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Points Counter'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ScoreCounter(name: 'Team A'),
                  SizedBox(
                    height: 300,
                    child: VerticalDivider(thickness: 1),
                  ),
                  ScoreCounter(name: 'Team B'),
                ],
              ),
              Expanded(
                child: Center(
                  child: MainElevatedButton(label: 'Reset', onPressed: () {}),
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

  const ScoreCounter({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 32),
        ),
        const Text(
          '0',
          style: TextStyle(fontSize: 128),
        ),
        MainElevatedButton(
          label: 'Add 1 Point',
          onPressed: () {},
        ),
        MainElevatedButton(
          label: 'Add 2 Points',
          onPressed: () {},
        ),
        MainElevatedButton(
          label: 'Add 3 Points',
          onPressed: () {},
        ),
      ],
    );
  }
}

class MainElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const MainElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(fixedSize: const Size.fromWidth(128)),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
