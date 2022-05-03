// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:multi_charts/multi_charts.dart';

import '../widget/add.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class Diagnoses extends StatefulWidget {
  const Diagnoses({Key? key}) : super(key: key);

  @override
  State<Diagnoses> createState() => _DiagnosesState();
}

class _DiagnosesState extends State<Diagnoses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget("Menu"),
      ),
      drawer: Drawers(),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFE6EBF1),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Add("Diagnoses"),
              Container(
                height: MediaQuery.of(context).size.height * .6,
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Daily Appointment",
                          style: TextStyle(
                            color: Color(0xFF404D53),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_left),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.all(8),
                      color: Color(0xFFE6EBF1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: Text("Year"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: Text("Month"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: Text("Week"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "648 of 751",
                          style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Cold",
                          style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: new LinearPercentIndicator(
                        alignment: MainAxisAlignment.start,
                        width: MediaQuery.of(context).size.width - 40,
                        animation: true,
                        barRadius: Radius.circular(10),
                        lineHeight: 10.0,
                        animationDuration: 2500,
                        percent: 0.6,
                        // center: Text("80.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Color.fromARGB(255, 222, 121, 116),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "215 of 651",
                          style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Fracture",
                          style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: new LinearPercentIndicator(
                        alignment: MainAxisAlignment.start,
                        width: MediaQuery.of(context).size.width - 40,
                        animation: true,
                        barRadius: Radius.circular(10),
                        lineHeight: 10.0,
                        animationDuration: 2500,
                        percent: 0.4,
                        // center: Text("40.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.green,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "84 of 120",
                          style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Concussion",
                          style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: new LinearPercentIndicator(
                        alignment: MainAxisAlignment.start,
                        width: MediaQuery.of(context).size.width - 40,
                        animation: true,
                        barRadius: Radius.circular(10),
                        lineHeight: 10.0,
                        animationDuration: 2500,
                        percent: 0.7,
                        // center: Text("40.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "846 of 804",
                          style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Hepatitis",
                          style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: new LinearPercentIndicator(
                        alignment: MainAxisAlignment.start,
                        width: MediaQuery.of(context).size.width - 40,
                        animation: true,
                        barRadius: Radius.circular(10),
                        lineHeight: 10.0,
                        animationDuration: 2500,
                        percent: 0.9,
                        // center: Text("40.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Color.fromARGB(255, 137, 90, 191),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "458 of 901",
                          style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Dermatitis",
                          style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: new LinearPercentIndicator(
                        alignment: MainAxisAlignment.start,
                        width: MediaQuery.of(context).size.width - 40,
                        animation: true,
                        barRadius: Radius.circular(10),
                        lineHeight: 10.0,
                        animationDuration: 2500,
                        percent: 0.7,
                        // center: Text("40.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Color.fromARGB(255, 117, 214, 224),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .6,
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      child: RadarChart(
                        values: [
                          1,
                          2,
                          4,
                          7,
                          9,
                          0,
                        ],
                        labels: [
                          "DIAGNOSTICS",
                          "COLD",
                          "TESTS",
                          "CONSILTATION",
                          "INJURY",
                          "VIRUSES",
                        ],
                        maxValue: 10,
                        fillColor: Colors.blue,
                        chartRadiusFactor: 0.6,
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chevron_left),
                          ),
                          Text(
                            "Tuesday,September 29",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chevron_right),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFE6EBF1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
