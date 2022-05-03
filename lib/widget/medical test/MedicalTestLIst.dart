// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:medicalappui/bloc/medical%20test%20list/medicaltestlist_bloc.dart';

class MedicalTestList extends StatelessWidget {
  TestList test;
  MedicalTestList(this.test, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.join_inner),
              SizedBox(
                width: 10,
              ),
              Text(test.name),
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
            height: 15,
          ),
          DottedLine(
            lineLength: 330,
            dashColor: Colors.grey,
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: Text(
              test.doctortype,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF404D53),
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "${test.time.hour} hours ago",
              style: TextStyle(
                color: Color(0xFF404D53),
              ),
            ),
            trailing: Container(
              height: 40,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                "View Result",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFFE6EBF1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
