import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;

  const MainListItem(
      {@required this.name, @required this.imageUrl, @required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: FadeInImage(
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder:
                  AssetImage("assets/images/clothes_placeholder.png"),
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, bottom: 8),
          child: Column(
            children: [
              Row(children: [Text(name),]),
              Row(children: [Text("$price\$"),]),
            ],
          ),
        )
      ],
    );
  }
}
