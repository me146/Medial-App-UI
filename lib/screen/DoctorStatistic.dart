// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medicalappui/screen/PatientPace_Screen.dart';
import 'package:medicalappui/widget/TitaleCard.dart';
import 'package:medicalappui/widget/add.dart';
import 'package:medicalappui/widget/appbar.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class DoctorStatics extends StatefulWidget {
  DoctorStatics({Key? key}) : super(key: key);

  @override
  State<DoctorStatics> createState() => _DoctorStaticsState();
}

class _DoctorStaticsState extends State<DoctorStatics>
    with TickerProviderStateMixin {
  final Duration animDuration = const Duration(milliseconds: 250);
  List<String> week = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  List<_ChartData> chartData = [
    _ChartData('CHN', 120),
    _ChartData('GER', 150),
    _ChartData('RUS', 300),
    _ChartData('BRZ', 640),
    _ChartData('IND', 140)
  ];
  List<_ChartData> Data = [
    _ChartData("", 120),
    _ChartData("", 150),
    _ChartData("", 300),
    _ChartData("", 640),
    _ChartData("", 140)
  ];
  List<_ChartData> cardata = [
    _ChartData("", 100),
    _ChartData("", 120),
    _ChartData("", 200),
    _ChartData("", 540),
    _ChartData("", 600)
  ];
  TabController? tabController;
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 1, vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          child: AppBarWidget("Menu"),
          preferredSize: Size.fromHeight(60),
        ),
        body: Container(
          color: Color(0xFFE6EBF1),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              Add("Doctor Statistics"),
              SizedBox(
                height: 20,
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
                    child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    TitalCard("Daily appoiment"),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF1F5F8),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        leading: Image.asset(
                          "asset/ezgif.com-gif-maker.jpg",
                          fit: BoxFit.fill,
                        ),
                        title: Text("Allen Vaugh"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: size.height * 0.3,
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                      child: BarChart(
                        mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        TitalCard("Epidemiological context"),
                        Spacer(),
                        Icon(Icons.navigate_before_rounded),
                        Icon(Icons.navigate_next_rounded)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      child: TabBar(
                          indicator: BoxDecoration(
                            // borderRadius: BorderRadius.circular(
                            //   25.0,
                            // ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 12,
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                              )
                            ],
                            color: Colors.white,
                          ),
                          unselectedLabelColor: Colors.transparent,
                          controller: tabController,
                          tabs: [
                            Tab(
                              child: Text(
                                "Year",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Month",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Week",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ]),
                    ),
                    SfCartesianChart(
                        primaryYAxis: NumericAxis(

                            //Hide the gridlines of y-axis
                            majorGridLines: MajorGridLines(width: 0),
                            isVisible: false,
                            //Hide the axis line of y-axis
                            axisLine: AxisLine(width: 0)),
                        enableSideBySideSeriesPlacement: false,
                        // backgroundColor: Colors.yellow,
                        primaryXAxis:
                            CategoryAxis(isVisible: true, arrangeByIndex: true),
                        series: <ChartSeries>[
                          StackedAreaSeries<_ChartData, String>(
                              // groupName: 'Group B',
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: false, useSeriesColor: true),
                              dataSource: Data,
                              color: Colors.green.withOpacity(0.4),
                              borderColor: Colors.green,
                              borderWidth: 2,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y),
                          SplineSeries<_ChartData, String>(
                              //  groupName: 'Group A',
                              // dataLabelSettings: DataLabelSettings(
                              //     isVisible: true, useSeriesColor: true),
                              dataSource: cardata,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y),
                        ])
                  ],
                ),
              )
            ],
          ),
        ));
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.blue,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y + 1,
          color: barColor,
          width: width,
          borderSide: BorderSide(color: Colors.blue, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.grey[200],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
              0,
              5,
            );
          case 1:
            return makeGroupData(
              1,
              6.5,
            );
          case 2:
            return makeGroupData(
              2,
              5,
            );
          case 3:
            return makeGroupData(
              3,
              7.5,
            );
          case 4:
            return makeGroupData(
              4,
              9,
            );
          case 5:
            return makeGroupData(
              5,
              11.5,
            );
          case 6:
            return makeGroupData(
              6,
              6.5,
            );
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                week[group.x.toInt()] + '\n',
                const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(week[value.toInt()][0],
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )));
            },
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
