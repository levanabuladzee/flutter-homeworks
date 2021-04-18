import 'package:flutter/material.dart';
import 'package:homework_task_3/data/planets.dart';

class LandscapeMainScreenBody extends StatefulWidget {
  @override
  _LandscapeMainScreenBodyState createState() => _LandscapeMainScreenBodyState();
}

class _LandscapeMainScreenBodyState extends State<LandscapeMainScreenBody> {
  Planets planets = new Planets();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.network(
                    planets.list[index].imageUrl,
                    width: size.width * 0.2
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text(planets.list[index].name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    width: size.width * 0.4,
                    child: Text(
                      planets.list[index].description,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      height: 64,
                      width: size.width * 0.35,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          child: Text(planets.list[0].name)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      height: 64,
                      width: size.width * 0.35,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          child: Text(planets.list[1].name)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      height: 64,
                      width: size.width * 0.35,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          child: Text(planets.list[2].name)),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
