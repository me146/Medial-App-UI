// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widget/add.dart';
import '../widget/appbar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:multi_charts/multi_charts.dart';

import '../widget/drawer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AppointmentStatistics extends StatefulWidget {
  const AppointmentStatistics({Key? key}) : super(key: key);

  @override
  State<AppointmentStatistics> createState() => _AppointmentStatisticsState();
}

class _AppointmentStatisticsState extends State<AppointmentStatistics> {
  static const pilateColor = Color(0xff632af2);
  static const cyclingColor = Color(0xffffb3ba);
  static const quickWorkoutColor = Color(0xff578eff);
  static const betweenSpace = 0.2;

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  BarChartGroupData generateGroupData(
      int x, double pilates, double quickWorkout, double cycling) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: pilateColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: quickWorkoutColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
          color: cyclingColor,
          width: 5,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff787694),
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = "JAN";
        break;
      case 1:
        text = "FEB";
        break;
      case 2:
        text = "MAR";
        break;
      case 3:
        text = "APR";
        break;
      case 4:
        text = "MAY";
        break;
      case 5:
        text = "JUN";
        break;
      case 6:
        text = "JUL";
        break;
      default:
        text = "";
    }
    return Padding(
      child: Text(text, style: style),
      padding: const EdgeInsets.only(
        top: 4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Add("Appointment\nStatistics"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.chevron_left,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.4,
                    // margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ScrollablePositionedList.builder(
                      itemCount: months.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(months[index]),
                          height: 30,
                          width: 150,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      },
                      itemScrollController: itemScrollController,
                      itemPositionsListener: itemPositionsListener,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.chevron_right,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        'Overal Appointment',
                        style: TextStyle(
                          color: Color(0xff171547),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
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
                          Flexible(
                            child: Text(
                              "EMERGENCY",
                              style: TextStyle(
                                color: Color(0xFF404D53),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Color.fromARGB(
                              255,
                              243,
                              131,
                              131,
                            ),
                            size: 20,
                          ),
                          Flexible(
                            child: Text(
                              "EXAMINATION",
                              style: TextStyle(
                                color: Color(0xFF404D53),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Color.fromARGB(255, 141, 243, 145),
                            size: 20,
                          ),
                          Flexible(
                            child: Text(
                              "CONSULTATION",
                              style: TextStyle(
                                color: Color(0xFF404D53),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height * .5,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: AspectRatio(
                        aspectRatio: 2,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceBetween,
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(),
                              rightTitles: AxisTitles(),
                              topTitles: AxisTitles(),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: bottomTitles,
                                  reservedSize: 20,
                                ),
                              ),
                            ),
                            barTouchData: BarTouchData(enabled: false),
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(show: false),
                            barGroups: [
                              generateGroupData(0, 2, 3, 2),
                              generateGroupData(1, 2, 5, 1.7),
                              generateGroupData(2, 1.3, 3.1, 2.8),
                              generateGroupData(3, 3.1, 4, 3.1),
                              generateGroupData(4, 0.8, 3.3, 3.4),
                              generateGroupData(5, 2, 5.6, 1.8),
                            ],
                            maxY: 10 + (betweenSpace * 3),
                          ),
                        ),
                      ),
                    )
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
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [],
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
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        'Blood test Speed',
                        style: TextStyle(
                          color: Color(0xff171547),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: 1000,
                          ranges: <GaugeRange>[
                            GaugeRange(
                                startValue: 0,
                                endValue: 400,
                                color: Colors.green),
                            GaugeRange(
                                startValue: 400,
                                endValue: 700,
                                color: Colors.orange),
                            GaugeRange(
                                startValue: 700,
                                endValue: 1000,
                                color: Colors.red)
                          ],
                          pointers: <GaugePointer>[NeedlePointer(value: 251)],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '251',
                                        style: TextStyle(
                                            color: Color(0xFF404D53),
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Secound',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Color(0xFF404D53),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                angle: 90,
                                positionFactor: 0.5),
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
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
