// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:medicalappui/bloc/doctor%20rating%20list/doctorratingslist_bloc.dart';

class DoctorRatings extends StatelessWidget {
  Doctors doctors;
  DoctorRatings(this.doctors, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset("asset/doctor.png"),
          title: Text(doctors.name),
          subtitle: Text(doctors.doctortype),
          trailing: Column(
            children: [
              // minimize
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 25,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 0),
                itemBuilder: (context, _) => Icon(
                  Icons.minimize,
                  color: Color.fromARGB(255, 110, 183, 114),
                ),
                onRatingUpdate: (rating) {},
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Rating ${doctors.rating}",
                style: TextStyle(color: Color(0xFF404D53)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        DottedLine(
          lineLength: 330,
          dashColor: Colors.black45,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
