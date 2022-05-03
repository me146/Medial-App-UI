// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medicalappui/bloc/planner_bloc/plannerlist_bloc.dart';

class DaylyPlanner extends StatelessWidget {
  PlannerList plannerList;
  DaylyPlanner(this.plannerList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  color: Color(0xFFE6EBF1),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(
                      plannerList.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF404D53),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                        "${plannerList.time.day} - ${plannerList.time.month} - ${plannerList.time.year} /  ${plannerList.time.hour} : ${plannerList.time.minute}"),
                    trailing: Icon(
                      Icons.check,
                      color:
                          plannerList.chack ? Colors.blue : Color(0xFF404D53),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
