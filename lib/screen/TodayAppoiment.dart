// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:medicalappui/widget/add.dart';
import 'package:medicalappui/widget/appbar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TodayAppoiment extends StatefulWidget {
  TodayAppoiment({Key? key}) : super(key: key);

  @override
  State<TodayAppoiment> createState() => _TodayAppoimentState();
}

class _TodayAppoimentState extends State<TodayAppoiment> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget("Menu"),
        // ),
      ),
      body: Container(
        color: Color(0xFFE6EBF1),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Add("Today appoiments"),
            SizedBox(
              height: 15,
            ),
            Container(
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
              child: Container(
                height: size.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: SfCalendar(
                  initialDisplayDate: DateTime(DateTime.now().day),
                  view: CalendarView.week,
                  specialRegions: _getTimeRegions(),
                  firstDayOfWeek: 1,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            )
          ],
        ),
      ),
    );
  }

  List<TimeRegion> _getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];

    regions.add(TimeRegion(
        startTime: DateTime(DateTime.now().month),
        endTime: DateTime(DateTime.now().month),
        color: Colors.grey.withOpacity(0.2),
        recurrenceRule: 'FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR;INTERVAL=1',
        recurrenceExceptionDates: [
          DateTime(2020, 06, 16),
          DateTime(2020, 06, 18)
        ],
        textStyle: TextStyle(color: Colors.black45, fontSize: 15),
        text: 'Break'));
    regions.add(TimeRegion(
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 09, 30),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 09, 30),
      color: Colors.grey.withOpacity(0.2),
      enablePointerInteraction: false,
      recurrenceRule: 'FREQ=WEEKLY;BYDAY=SU,SA;INTERVAL=1',
    ));
    return regions;
  }
}
