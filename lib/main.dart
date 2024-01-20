import 'package:flutter/material.dart';
import 'package:my_expense_tracker/screen/main_screen.dart';

void main() {
  runApp(const MainApp());
}

final kColorSkheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 40, 11));

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData().copyWith(
          colorScheme: kColorSkheme,
          cardTheme: const CardTheme().copyWith(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10)),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: const TextStyle(fontSize: 24, color: Colors.black),
                titleMedium: const TextStyle(fontSize: 16, color: Colors.black),
                titleSmall: const TextStyle(fontSize: 14, color: Colors.black),
              ),
        ),
        home: MainScreen());
    ;
  }
}
