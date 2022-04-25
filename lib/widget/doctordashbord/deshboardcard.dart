// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:medicalappui/widget/delayanimationcard.dart';

import '../../bloc/patient_bloc/doctordashboard_bloc.dart';


class DoctorDashboard extends StatelessWidget {
  Patient patient;
  DoctorDashboard(this.patient, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctordashboardBloc b = BlocProvider.of<DoctordashboardBloc>(context);
    return Container(
      height: MediaQuery.of(context).size.height / 3.7,
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
                width: 15,
              ),
              Text(
                "Next paitent",
                style: TextStyle(
                  color: Color(0xFF404D53),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  b.add(GetPriviousPatientDetails());
                },
                icon: Icon(Icons.chevron_left),
              ),
              IconButton(
                onPressed: () {
                  b.add(GetNextPatientDetails());
                },
                icon: Icon(Icons.chevron_right),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Image.asset("asset/contact.png"),
            title: Delaycard(
              Text(
                patient.name,
                style: TextStyle(color: Colors.blue),
              ),
              DelayedAnimations.SLIDE_FROM_TOP,
            ),
            subtitle: Delaycard(
              Text(
                patient.reason,
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF404D53),
                    fontWeight: FontWeight.bold),
              ),
              DelayedAnimations.SLIDE_FROM_BOTTOM,
            ),
            trailing: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: Icon(
                Icons.phone_enabled_outlined,
                color: Colors.blue,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[100],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DottedLine(lineLength: 330),
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
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${patient.time.hour} : ${patient.time.minute}",
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
          )
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
