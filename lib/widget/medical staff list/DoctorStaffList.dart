// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../bloc/medical staff list/doctorstaflist_bloc.dart';

class DoctorStaffList extends StatelessWidget {
  StaffList staffList;
  DoctorStaffList(this.staffList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset("asset/doctor.png"),
                title: Text(
                  staffList.name,
                  style: TextStyle(
                    color: Color(0xFF404D53),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(staffList.doctortype),
              ),
              DottedLine(lineLength: 330),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${staffList.rating}",
                        style: TextStyle(color: Color(0xFF404D53)),
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        itemSize: 18,
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
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Booked Appointment",
                        style: TextStyle(
                          color: Color(0xFF404D53),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: new LinearPercentIndicator(
                          alignment: MainAxisAlignment.start,
                          // width: MediaQuery.of(context).size.width -
                          //     45,
                          width: 250,
                          animation: true,
                          barRadius: Radius.circular(10),
                          lineHeight: 5.0,
                          animationDuration: 2500,
                          percent: 0.8,
                          // center: Text("80.0%"),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Color(0xFF2563F0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color(0xFFFAFBFD),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
