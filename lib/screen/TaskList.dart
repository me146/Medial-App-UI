//  prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:medicalappui/bloc/Task_Bloc/task_bloc.dart';
import 'package:medicalappui/widget/TaskCard.dart';
import 'package:medicalappui/widget/add.dart';
import 'package:medicalappui/widget/appbar.dart';
import 'package:medicalappui/widget/pationtAppoiment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:getwidget/getwidget.dart';
import '../bloc/PationtAppoiment/pationtappoiment_bloc.dart';

class TaskList_Screen extends StatefulWidget {
  TaskList_Screen({Key? key}) : super(key: key);

  @override
  State<TaskList_Screen> createState() => _TaskList_ScreenState();
}

class _TaskList_ScreenState extends State<TaskList_Screen> {
  @override
  Widget build(BuildContext context) {
    TaskBloc t = BlocProvider.of<TaskBloc>(context);
    t.add(UpdateTask());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget("Menu"),
        ),
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Color(0xFFE6EBF1),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: ListView(
                    children: [
                      Add("My task list"),
                      SizedBox(
                        height: 010,
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 12,
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                              )
                            ]),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.navigate_before_rounded),
                            Text(
                              "Today,September19",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Icon(Icons.navigate_next_rounded)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Task list",
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
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.green.withOpacity(0.8),
                                    size: 20,
                                  ),
                                  Text(
                                    "WORK",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.deepOrange.withOpacity(0.8),
                                    size: 20,
                                  ),
                                  Text(
                                    "TRAVEL",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color:
                                        Colors.lightBlueAccent.withOpacity(0.8),
                                    size: 20,
                                  ),
                                  Text(
                                    "FAMILY",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.deepPurpleAccent
                                        .withOpacity(0.8),
                                    size: 20,
                                  ),
                                  Text(
                                    "OTHER",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            BlocConsumer<TaskBloc, TaskState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                if (state is ShowTask) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return TaskCard(state.tasks[index]);
                                    },
                                  );
                                }
                                return CircularProgressIndicator();
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      )
                    ],
                  ),
                )),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: GFButton(
                onPressed: () {},
                text: "Add new task",
                fullWidthButton: true,
              ),
            )
          ],
        ));
  }
}
