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
      ),
    );
  }
}
