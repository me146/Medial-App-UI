import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: DateWidget()),
    );
  }
}

class DateWidget extends StatelessWidget {
  DateTime now = DateTime.now();
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return DayView(
      date: now,
      dayBarStyle: DayBarStyle(
        color: Colors.yellow,
      ),
      events: [
        FlutterWeekViewEvent(
          title: 'An event 1',
          description: 'A description 1',
          start: date.subtract(Duration(hours: 1)),
          end: date.add(Duration(hours: 2, minutes: 30)),
        ),
        FlutterWeekViewEvent(
          title: 'An event 2',
          description: 'A description 2',
          start: date.add(Duration(hours: 19)),
          end: date.add(Duration(hours: 22)),
        ),
        FlutterWeekViewEvent(
          title: 'An event 3',
          description: 'A description 3',
          start: date.add(Duration(hours: 23, minutes: 30)),
          end: date.add(Duration(hours: 25, minutes: 30)),
        ),
        FlutterWeekViewEvent(
          title: 'An event 4',
          description: 'A description 4',
          start: date.add(Duration(hours: 20)),
          end: date.add(Duration(hours: 21)),
        ),
        FlutterWeekViewEvent(
          backgroundColor: Colors.pink.withOpacity(0.5),
          decoration: BoxDecoration(
              color: Colors.pink.withOpacity(0.5),
              border: Border.all(color: Colors.pink),
              borderRadius: BorderRadius.circular(10)),
          title: 'An event 5',
          description: 'A description 5',
          start: date.add(Duration(hours: 20)),
          end: date.add(Duration(hours: 21)),
        ),
      ],
      style: const DayViewStyle(currentTimeCircleColor: Colors.pink),
    );
  }
}
