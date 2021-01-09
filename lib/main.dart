import 'package:Puzzle_Alarm/HomePage.dart';
import 'package:Puzzle_Alarm/classes/dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PuzzleAlarm());
}

class PuzzleAlarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(
      ),
    );
  }
}
