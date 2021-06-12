import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:levan_abuladze_exam_2/data/repository/expense_repository.dart';
import 'package:levan_abuladze_exam_2/screens/add_new_screen.dart';
import 'package:levan_abuladze_exam_2/screens/edit_screen.dart';
import 'package:levan_abuladze_exam_2/screens/home_screen.dart';
import 'package:levan_abuladze_exam_2/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ExpenseRepository(),
      child: MaterialApp(
        title: 'Personal Expenses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          AddNewScreen.routeName: (ctx) => AddNewScreen(),
          EditScreen.routeName: (ctx) => EditScreen(),
        },
      ),
    );
  }
}
