// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

import '../widget/add.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class MonthAppointment extends StatefulWidget {
  const MonthAppointment({Key? key}) : super(key: key);

  @override
  State<MonthAppointment> createState() => _MonthAppointmentState();
}

class _MonthAppointmentState extends State<MonthAppointment> {
  final List<ChartData> chartData = [
    ChartData('David', 25, Color(0xFF34D1BE)),
    ChartData('Steve', 25, Color.fromARGB(255, 244, 230, 109)),
    ChartData('Jack', 25, Color.fromARGB(255, 101, 161, 235)),
    ChartData('Chack', 25, Color.fromARGB(255, 222, 97, 93)),
  ];

  @override
  Widget build(BuildContext context) {
    const ticks = [7, 14, 21, 28, 35];
    var features = [
      "DIAGNOSTICS",
      "COLD",
      "TESTS",
      "CONSILTATION",
      "INJURY",
      "VIRUSES",
    ];
    var data = [
      [
        10.0,
        20,
        28,
        5,
        16,
        15,
      ],
      [
        14.5,
        1,
        4,
        14,
        23,
        10,
      ]
    ];
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
              Add("Month Appointment"),
              Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 150,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFF34D1BE),
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            "asset/teeth.png",
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 30,
                          alignment: Alignment.topLeft,
                          child: Text(
                            "32",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: Flexible(
                            child: Text(
                              "The Average number\nof teeth in our patients",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xFF404D53),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
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
                height: MediaQuery.of(context).size.height * .6,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Causes",
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
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .4,
                      child: SfCircularChart(
                        series: <CircularSeries>[
                          PieSeries<ChartData, String>(
                              dataSource: chartData,
                              pointColorMapper: (ChartData data, _) =>
                                  data.color,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y)
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Color(0xFFE6EBF1),
                            size: 20,
                          ),
                          Text(
                            "COLD",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Color.fromARGB(255, 244, 230, 109),
                            size: 20,
                          ),
                          Text(
                            "INFECTION",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Colors.orange,
                            size: 20,
                          ),
                          Text(
                            "INJURY",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Colors.orange,
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
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .1,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Causes",
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
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .4,
                      margin: EdgeInsets.all(10),
                      child: RadarChart.light(
                        ticks: ticks,
                        features: features,
                        data: data,
                        reverseAxis: true,
                        useSides: true,
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

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
