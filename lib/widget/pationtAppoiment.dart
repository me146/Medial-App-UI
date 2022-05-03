// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicalappui/bloc/PationtAppoiment/pationtappoiment_bloc.dart';
import 'package:medicalappui/widget/delayanimationcard.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:dotted_line/dotted_line.dart';

class PationAppoiment extends StatelessWidget {
  GetAllApoiment appoiment;
  PationAppoiment(this.appoiment);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              appoiment.image,
              fit: BoxFit.fill,
            ),
            title: Delaycard(
              Text(
                appoiment.name,
                style: TextStyle(color: Colors.blue),
              ),
              DelayedAnimations.SLIDE_FROM_TOP,
            ),
            subtitle: Delaycard(
              Text(
                appoiment.appoimentReson,
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF404D53),
                    fontWeight: FontWeight.bold),
              ),
              DelayedAnimations.SLIDE_FROM_BOTTOM,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.access_time,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${dateFormatter(appoiment.time)}",
                style: TextStyle(color: Color(0xFF404D53), fontSize: 20),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_control,
                size: 30,
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          DottedLine(lineLength: 330),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

  dynamic monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'];
}
