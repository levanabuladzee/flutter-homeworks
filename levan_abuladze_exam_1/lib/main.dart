import 'package:flutter/material.dart';
import 'package:levan_abuladze_exam_1/screens/add_new_clothes_screen.dart';
import 'package:levan_abuladze_exam_1/screens/clothes_details_screen.dart';
import 'package:levan_abuladze_exam_1/screens/edit_clothes_screen.dart';
import 'package:levan_abuladze_exam_1/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Levan Abuladze - Clothes App',
      theme: ThemeData(
        accentColor: Colors.blue,
        backgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
          ),
        ),
        appBarTheme: AppBarTheme(centerTitle: true),
      ),
      home: HomeScreen(),
      routes: {
        ClothesDetailsScreen.routeName: (ctx) => ClothesDetailsScreen(),
        AddNewClothesScreen.routeName: (ctx) => AddNewClothesScreen(),
        EditClothesScreen.routeName: (ctx) => EditClothesScreen(),
      },
    );
  }
}
