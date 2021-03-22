import 'package:flutter/material.dart';
import 'package:homework_1/data/planets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework 1',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Planets planets = new Planets();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Homework 1"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(planets.list[index].name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    planets.list[index].imageUrl,
                    width: size.width * 0.8,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25, bottom: 50),
                    width: size.width * 0.8,
                    child: Text(
                      planets.list[index].description,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Text(planets.list[0].name)),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Text(planets.list[1].name)),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Text(planets.list[2].name)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
