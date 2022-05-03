// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:medicalappui/bloc/Questions_bloc/questions_bloc.dart';

class Questionss extends StatelessWidget {
  Questions questions;
  Questionss(this.questions, {Key? key}) : super(key: key);

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
              Text(
                "${questions.time.day} - ${questions.time.month} - ${questions.time.year} /  ${questions.time.hour} : ${questions.time.minute}",
                style: TextStyle(
                  color: Color(0xFF404D53),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  questions.question,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF404D53),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.6,
              // ),
              Spacer(),
              Container(
                height: 50,
                width: 40,
                margin: EdgeInsets.only(right: 0, bottom: 10),
                alignment: Alignment.center,
                child: Icon(
                  Icons.message_outlined,
                  color: Color(0xFF404D53),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                alignment: Alignment.center,
                height: 25,
                width: 120,
                child: Text("Read more"),
                decoration: BoxDecoration(
                  color: Color(0xFFF1F5F8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Container(
                alignment: Alignment.center,
                height: 25,
                width: 120,
                child: Text("replay"),
                decoration: BoxDecoration(
                  color: Color(0xFFF1F5F8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          DottedLine(
            lineLength: 340,
            dashColor: Colors.black45,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
