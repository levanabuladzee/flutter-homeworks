import 'package:flutter/material.dart';
import 'package:homework_task_3/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework 3',
      home: HomeScreen(),
    );
  }
}
