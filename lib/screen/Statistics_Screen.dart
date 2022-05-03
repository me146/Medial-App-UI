// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widget/add.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final List<ChartData> chartData = [
    ChartData('David', 50, Color(0xFFFF8B5C)),
    ChartData('Steve', 38, Color(0xFF6539E6)),
    ChartData('Jack', 34, Color(0xFF32D1A8)),
  ];
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
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Add("Statistics"),
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
                        color: Color.fromARGB(255, 203, 76, 76),
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            "asset/liver.png",
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 30,
                          child: Text(
                            "84",
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
                              "Abdominal pain is the\n most common cause",
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
                            "Patients",
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
                            color: Color.fromARGB(
                              255,
                              243,
                              131,
                              131,
                            ),
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
                            color: Color.fromARGB(255, 141, 243, 145),
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

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
