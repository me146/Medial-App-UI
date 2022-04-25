// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medicalappui/bloc/laboratory_bloc/laboratorytests_bloc.dart';
import 'package:medicalappui/widget/delayanimationcard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delayed_widget/delayed_widget.dart';

class LaboratoryTests extends StatelessWidget {
  Report report;
  LaboratoryTests(this.report, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LaboratorytestsBloc l = BlocProvider.of<LaboratorytestsBloc>(context);
    return Container(
      height: MediaQuery.of(context).size.height / 3.9,
      width: MediaQuery.of(context).size.width / 1,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Laboratory tests",
                style: TextStyle(
                  color: Color(0xFF404D53),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  l.add(GetPriviousLaboratoryPatient());
                },
                icon: Icon(Icons.chevron_left),
              ),
              IconButton(
                onPressed: () {
                  l.add(GetNextLaboratoryPatient());
                },
                icon: Icon(Icons.chevron_right),
              ),
              SizedBox(
                width: 20,
              ),
            ],
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
              Delaycard(
                Text(
                  report.name,
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                DelayedAnimations.SLIDE_FROM_TOP,
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Delaycard(
                Text(
                  report.details,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF404D53),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DelayedAnimations.SLIDE_FROM_BOTTOM,
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_control,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                alignment: Alignment.center,
                height: 25,
                width: 60,
                child: Text("Detailes"),
                decoration: BoxDecoration(
                  color: Color(0xFFF1F5F8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 25,
                width: 120,
                child: Text("ContactPatient"),
                decoration: BoxDecoration(
                  color: Color(0xFFF1F5F8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 25,
                width: 60,
                child: Text("Archive"),
                decoration: BoxDecoration(
                  color: Color(0xFFF1F5F8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
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
    );
  }
}
