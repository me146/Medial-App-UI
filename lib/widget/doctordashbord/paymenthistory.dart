// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:medicalappui/bloc/payment_bloc/paymenthistory_bloc.dart';

class PaymentHistory extends StatelessWidget {
  Reson reson;
  PaymentHistory(this.reson, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.join_inner),
              SizedBox(
                width: 10,
              ),
              Text(reson.name)
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                reson.resons,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF404D53),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "₹${reson.Payment}",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF404D53),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.access_time,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${dateFormatter(reson.date)}",
                style: TextStyle(color: Color(0xFF404D53), fontSize: 15),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_control,
                size: 25,
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          DottedLine(lineLength: 340, dashColor: Colors.grey),
          SizedBox(
            height: 10,
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
