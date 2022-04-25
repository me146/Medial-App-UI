// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  String title;
   Add(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF404D53),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[100],
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
