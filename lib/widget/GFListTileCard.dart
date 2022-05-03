// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:badges/badges.dart';
import 'package:medicalappui/bloc/Patients_Appouiment/patientsappoiment_bloc.dart';

class GFListCard extends StatelessWidget {
  GetPatientAppoiment patientsAppoiment;
  GFListCard(this.patientsAppoiment);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GFListTile(
        hoverColor: Colors.white,
        selected: true,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        onTap: () {},
        avatar: Badge(
          showBadge: true,
          position: BadgePosition.topEnd(top: -2, end: -8),
          padding: EdgeInsets.all(5),
          shape: BadgeShape.circle,
          badgeColor: Color.fromARGB(255, 96, 251, 101).withOpacity(0.7),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  patientsAppoiment.image,
                ),
              ),
            ),
          ),
        ),
        titleText: patientsAppoiment.name,
        subTitleText: '${patientsAppoiment.age} Year',
        color: Colors.grey[100],
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Badge(
              badgeColor: Colors.yellow,
              shape: BadgeShape.circle,
              position: BadgePosition.topEnd(top: -2, end: 2),
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  )
                ], color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  Icons.message_outlined,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Badge(
              badgeColor: Colors.yellow,
              shape: BadgeShape.circle,
              position: BadgePosition.topEnd(top: -2, end: 2),
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  )
                ], color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  Icons.phone_outlined,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ));
  }
}
