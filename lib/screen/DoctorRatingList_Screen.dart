// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medicalappui/widget/doctor%20rating%20list/doctorratings.dart';
import 'package:charts_painter/chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/doctor rating list/doctorratingslist_bloc.dart';
import '../widget/add.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class DoctorRatingList extends StatefulWidget {
  const DoctorRatingList({Key? key}) : super(key: key);

  @override
  State<DoctorRatingList> createState() => _DoctorRatingListState();
}

class _DoctorRatingListState extends State<DoctorRatingList> {
  @override
  Widget build(BuildContext context) {
    DoctorratingslistBloc d = BlocProvider.of<DoctorratingslistBloc>(context);
    d.add(ShowDoctorRatingList());
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
              Add("Doctor"),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Doctor Rating",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xFF404D53),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              color: Color(0xFFE6EBF1),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              height: 10,
                            ),
                            BlocConsumer<DoctorratingslistBloc,
                                DoctorratingslistState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                if (state is DisplayDoctorRatingList) {
                                  return ListView.builder(
                                    itemCount: 5,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return DoctorRatings(
                                          state.doctorrating[0]);
                                    },
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                          ],
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
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Row(
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
                            "CONSULTATION",
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
                            "TEST",
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
                            "CHACKUP",
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
                            "SICK",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFE6EBF1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chart<void>(
                        height: 400.0,
                        state: ChartState(
                          ChartData.fromList(
                            [1, 3, 4, 2, 7, 6, 2, 5, 4]
                                .map((e) => BarValue<void>(e.toDouble()))
                                .toList(),
                            axisMax: 8.0,
                          ),
                          itemOptions: BarItemOptions(
                            color: Color.fromARGB(255, 124, 199, 126),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            radius: BorderRadius.vertical(
                                top: Radius.circular(42.0)),
                          ),
                          backgroundDecorations: [
                            GridDecoration(
                              verticalAxisStep: 1,
                              horizontalAxisStep: 1,
                            ),
                          ],
                        ),
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
