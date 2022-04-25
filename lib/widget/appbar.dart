// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  String name;
  AppBarWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        name,
        style: TextStyle(color: Colors.blue),
      ),
      iconTheme: IconThemeData(color: Colors.blue),
      backgroundColor: Color(0xFFE6EBF1),
      actions: [
        Center(
          child: Text(
            "Increase contrase",
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.all_inclusive_sharp,
          color: Colors.blue,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
