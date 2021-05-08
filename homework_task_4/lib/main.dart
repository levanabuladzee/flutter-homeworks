import 'package:flutter/material.dart';
import 'package:homework_task_4/data/repository/movie_helper.dart';
import 'package:homework_task_4/screens/add_new_movie_screen.dart';
import 'package:homework_task_4/screens/edit_movie_screen.dart';
import 'package:homework_task_4/screens/home_screen.dart';
import 'package:homework_task_4/screens/movie_details_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MovieRepository(),
      child: MaterialApp(
        title: 'Movies App',
        theme: ThemeData(
            accentColor: Colors.purpleAccent,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.purpleAccent)))),
        home: HomeScreen(),
        routes: {
          MovieDetailsScreen.routeName: (ctx) => MovieDetailsScreen(),
          AddNewMovieScreen.routeName: (ctx) => AddNewMovieScreen(),
          EditMovieScreen.routeName: (ctx) => EditMovieScreen(),
        },
      ),
    );
  }
}
