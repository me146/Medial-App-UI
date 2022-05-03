// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fl_chart/fl_chart.dart';

import '../widget/add.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class PatientStatistics extends StatefulWidget {
  const PatientStatistics({Key? key}) : super(key: key);

  @override
  State<PatientStatistics> createState() => _PatientStatisticsState();
}

class _PatientStatisticsState extends State<PatientStatistics> {
  List<_SalesData> data = [
    _SalesData("20", 35),
    _SalesData("30", 28),
    _SalesData("40", 34),
    _SalesData("50", 32),
    _SalesData("60", 40)
  ];
  List<_SalesData> sdata = [
    _SalesData("20", 40),
    _SalesData("30", 35),
    _SalesData("40", 28),
    _SalesData("50", 30),
    _SalesData("60", 50)
  ];
  final List<ChartData> chartData = [
    ChartData('David', 20, Colors.orange),
    ChartData('Steve', 30, Color.fromARGB(255, 244, 230, 109)),
    ChartData('Jack', 50, Color(0xFFE6EBF1)),
  ];

  static const pilateColor = Color(0xff632af2);
  static const cyclingColor = Color(0xffffb3ba);
  static const quickWorkoutColor = Color(0xff578eff);
  static const betweenSpace = 0.2;

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
        text = "";
        break;
      case 1:
        text = "";
        break;
      case 2:
        text = "";
        break;
      case 3:
        text = "";
        break;
      case 4:
        text = "";
        break;
      case 5:
        text = "";
        break;
      case 6:
        text = "";
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
              Add("Patient Statistics"),
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 10, left: 15),
                      child: Text(
                        "Patient gender",
                        style: TextStyle(
                          color: Color(0xFF404D53),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chevron_left),
                          ),
                          Text(
                            "Tuesday,September 29",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chevron_right),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFE6EBF1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width / 1,
                      child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        borderWidth: 0,
                        primaryYAxis: NumericAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            isVisible: false,
                            axisLine: AxisLine(width: 0)),
                        enableSideBySideSeriesPlacement: false,
                        primaryXAxis: CategoryAxis(
                            isVisible: false, arrangeByIndex: false),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<_SalesData, String>>[
                          SplineSeries<_SalesData, String>(
                              opacity: 0.5,
                              width: 3,
                              dataSource: sdata,
                              color: Colors.red,
                              xValueMapper: (_SalesData sales, _) => sales.year,
                              yValueMapper: (_SalesData sales, _) =>
                                  sales.sales,
                              name: 'Sales',
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: false)),
                          SplineSeries<_SalesData, String>(
                              dataSource: data,
                              width: 3,
                              color: Colors.blue,
                              xValueMapper: (_SalesData sales, _) => sales.year,
                              yValueMapper: (_SalesData sales, _) =>
                                  sales.sales,
                              name: 'Sales',
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: false))
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
                            color: Colors.red,
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
                            color: Colors.blue,
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
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Helth Index",
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
                    SizedBox(height: 8),
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
                            "HELTH RATE",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                        ],
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
                height: MediaQuery.of(context).size.height * .4,
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
                            "Hepatitia",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Color(0xFFE6EBF1),
                            size: 20,
                          ),
                          Text(
                            "A",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Color.fromARGB(255, 244, 230, 109),
                            size: 20,
                          ),
                          Text(
                            "B",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.trip_origin_sharp,
                            color: Colors.orange,
                            size: 20,
                          ),
                          Text(
                            "C",
                            style: TextStyle(
                              color: Color(0xFF404D53),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .3,
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

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
