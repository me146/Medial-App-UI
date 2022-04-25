// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medicalappui/widget/add.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PatientPace extends StatefulWidget {
  const PatientPace({Key? key}) : super(key: key);

  @override
  State<PatientPace> createState() => _PatientPaceState();
}

class _PatientPaceState extends State<PatientPace> {
  final List<ChartData> chartData = [
    ChartData('David', 50, Color(0xFFFF8B5C)),
    ChartData('Steve', 38, Color(0xFF6539E6)),
    ChartData('Jack', 34, Color(0xFF32D1A8)),
  ];

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
  late List<_ChartData> data;
  late List<_ChartData> data1;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('CHN', 120),
      _ChartData('GER', 150),
      _ChartData('RUS', 300),
      _ChartData('BRZ', 640),
      _ChartData('IND', 140)
    ];
    data1 = [
      _ChartData('CHN', 200),
      _ChartData('GER', 300),
      _ChartData('RUS', 250),
      _ChartData('BRZ', 850),
      _ChartData('IND', 110)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
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
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Add("Patient Pace"),
              Column(
                children: [
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
                          shrinkWrap: true,
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
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * .9,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // height: 40,
                      alignment: Alignment.topCenter,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Patient by gender",
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
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Row(
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
                          Text(
                            "MEN",
                            style: TextStyle(
                              color: Color(0xFF404D53),
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
                          Text(
                            "WOMEN",
                            style: TextStyle(
                              color: Color(0xFF404D53),
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
                          Text(
                            "WOMEN",
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
                    Container(
                      height: MediaQuery.of(context).size.height * .7,
                      // margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.bottomCenter,
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                            minimum: 0, maximum: 900, interval: 100),
                        tooltipBehavior: _tooltip,
                        series: <ChartSeries<_ChartData, String>>[
                          BubbleSeries<_ChartData, String>(
                              dataSource: data,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              name: 'Gold',
                              color: Color.fromRGBO(8, 142, 255, 1)),
                          BubbleSeries<_ChartData, String>(
                              dataSource: data1,
                              yValueMapper: (_ChartData data, _) => data.y,
                              xValueMapper: (_ChartData data, _) => data.x,
                              name: 'Gold',
                              color: Color.fromARGB(255, 243, 131, 131))
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .6,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // height: 40,
                      // alignment: Alignment.topCenter,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Diagnoses",
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
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .4,
                      padding: EdgeInsets.all(10),
                      child: SfCircularChart(
                        legend: Legend(
                          height: "10",
                          width: "10",
                        ),
                        series: <CircularSeries>[
                          // Renders doughnut chart
                          DoughnutSeries<ChartData, String>(
                              dataSource: chartData,
                              pointColorMapper: (ChartData data, _) =>
                                  data.color,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          Text(
                            "MEN",
                            style: TextStyle(
                              color: Color(0xFF404D53),
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
                          Text(
                            "WOMEN",
                            style: TextStyle(
                              color: Color(0xFF404D53),
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
                          Text(
                            "WOMEN",
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
                    borderRadius: BorderRadius.circular(10)),
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

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
