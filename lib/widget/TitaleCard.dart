// ignore_for_file: prefer_const_constructors, file_names, must_be_immutable

import 'package:flutter/material.dart';

class TitalCard extends StatelessWidget {
  String tital;
  TitalCard(this.tital, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 10),
      child: Text(
        tital,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color(0xFF404D53),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
