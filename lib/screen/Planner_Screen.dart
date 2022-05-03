// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:medicalappui/widget/planner/DaylyPlanner.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/planner_bloc/plannerlist_bloc.dart';
import '../widget/add.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class Planner extends StatefulWidget {
  const Planner({Key? key}) : super(key: key);

  @override
  State<Planner> createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
  @override
  Widget build(BuildContext context) {
    PlannerlistBloc p = BlocProvider.of<PlannerlistBloc>(context);
    p.add(ShowPlannerList());
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
              Add("Planner"),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: CalendarTimeline(
                  // showYears: true,
                  initialDate: DateTime(2021, 4, 20),
                  firstDate: DateTime(2020, 1, 1),
                  lastDate: DateTime(2026, 11, 20),
                  onDateSelected: (date) => (date),
                  leftMargin: 10,
                  monthColor: Colors.blueGrey,
                  dayColor: Colors.teal[200],
                  activeDayColor: Colors.black54,
                  activeBackgroundDayColor: Colors.white,
                  dayNameColor: Colors.black54,
                  dotsColor: Color(0xFF333A47),
                  selectableDayPredicate: (date) => date.day != 23,
                  locale: 'en_ISO',
                ),
                decoration: BoxDecoration(
                    color: Color(0xFFE6EBF1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Tuesday planner",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF404D53),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocConsumer<PlannerlistBloc, PlannerlistState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is DisplayPlannerList) {
                          return DaylyPlanner(state.planner[0]);
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Color.fromRGBO(
                              8,
                              142,
                              255,
                              1,
                            ),
                            size: 20,
                          ),
                          Text(
                            "WORK",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Color.fromARGB(255, 114, 202, 192),
                            size: 20,
                          ),
                          Text(
                            "TRAVEL",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Color.fromARGB(255, 59, 93, 156),
                            size: 20,
                          ),
                          Text(
                            "FAMILY",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Color.fromARGB(255, 193, 146, 85),
                            size: 20,
                          ),
                          Text(
                            "OTHER",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                        ],
                      ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Recovery Rate",
                        style: TextStyle(
                          color: Color(0xFF404D53),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
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
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "80 %",
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
                        lineHeight: 8.0,
                        animationDuration: 2500,
                        percent: 0.8,
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
                          "24 %",
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
                        lineHeight: 8.0,
                        animationDuration: 2500,
                        percent: 0.24,
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
                          "91 %",
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
                        lineHeight: 8.0,
                        animationDuration: 2500,
                        percent: 0.91,
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
                          "50",
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
                        lineHeight: 8.0,
                        animationDuration: 2500,
                        percent: 0.50,
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
                          "72 %",
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
                        lineHeight: 8.0,
                        animationDuration: 2500,
                        percent: 0.72,
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
