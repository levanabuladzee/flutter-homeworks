import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levan_abuladze_exam_3/data/repository/todo_repository.dart';
import 'package:levan_abuladze_exam_3/screens/home_screen.dart';
import 'package:levan_abuladze_exam_3/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: TodoRepository(),
      child: MaterialApp(
        title: 'TODO App',
        theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
        home: LoginScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}
