// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medicalappui/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:medicalappui/widget/delayanimationcard.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:dotted_line/dotted_line.dart';

class AppointmentCard extends StatelessWidget {
  Appointment appointment;
  AppointmentCard(this.appointment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Image.asset("asset/doctor.png"),
            title: Delaycard(
              Text(
                appointment.name,
                style: TextStyle(color: Colors.blue),
              ),
              DelayedAnimations.SLIDE_FROM_TOP,
            ),
            subtitle: Delaycard(
              Text(
                appointment.appoitmenttype,
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
                color: Colors.white,
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
                "${appointment.time.hour} : ${appointment.time.minute}",
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
