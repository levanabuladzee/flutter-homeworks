import 'package:flutter/material.dart';
import 'package:homework_task_3/data/planets.dart';
import 'package:homework_task_3/widgets/main_screen_landscape.dart';
import 'package:homework_task_3/widgets/main_screen_portrait.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Planets planets = new Planets();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Homework 3"),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (Orientation.portrait == orientation) {
              return PortraitMainScreenBody();
            } else if (Orientation.landscape == orientation) {
              return LandscapeMainScreenBody();
            } else {
              return PortraitMainScreenBody();
            }
          },
        ),
      ),
    );
  }
}
