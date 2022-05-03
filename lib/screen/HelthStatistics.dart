// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medicalappui/screen/PatientPace_Screen.dart';
import 'package:medicalappui/screen/data.dart';
import 'package:medicalappui/widget/TitaleCard.dart';
import 'package:medicalappui/widget/appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:graphic/graphic.dart';

class getdata {
  double x;
  double y;
  getdata(this.x, this.y);
}

class HelthStatistics extends StatefulWidget {
  HelthStatistics({Key? key}) : super(key: key);

  @override
  State<HelthStatistics> createState() => _HelthStatisticsState();
}

class _HelthStatisticsState extends State<HelthStatistics> {
  List<getdata> europe = [
    getdata(10, 30),
    getdata(20, 40),
    getdata(30, 30),
    getdata(40, 50)
  ];
  List<getdata> northAmerica = [
    getdata(10, 20),
    getdata(20, 50),
    getdata(30, 10),
    getdata(40, 40)
  ];
  List<Color> colors = [];
  @override
  Widget build(BuildContext context) {
    roseData.map((e) => colors.add(e['color'] as Color));
    setState(() {});
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
              TitalCard("Health statistics"),
              Container(
                padding: EdgeInsets.all(20),
                height: size.height * 0.2,
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
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                          color: Color(0xff7ED320),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.monitor_heart_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "72",
                            style: TextStyle(fontSize: 25, color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                          Spacer(),
                          Flexible(
                            child: Text(
                              "The average number \nof heartbeats",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: size.height * 0.55,
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
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Health index",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "75.08",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 25),
                              ),
                              Text("Patiens health rate",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15))
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          VerticalDivider(
                            thickness: 1.5,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "45.27",
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 25),
                              ),
                              Text("Patiens sick rate",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SfCartesianChart(
                        enableAxisAnimation: true,
                        primaryYAxis: NumericAxis(

                            //Hide the gridlines of y-axis
                            majorGridLines: MajorGridLines(width: 0),
                            isVisible: false,
                            //Hide the axis line of y-axis
                            axisLine: AxisLine(width: 0)),
                        enableSideBySideSeriesPlacement: false,
                        // backgroundColor: Colors.yellow,
                        primaryXAxis: CategoryAxis(
                            isVisible: false, arrangeByIndex: false),
                        series: <ChartSeries>[
                          BubbleSeries<getdata, num>(
                              dataSource: northAmerica,
                              xValueMapper: (getdata data, _) => data.x,
                              yValueMapper: (getdata data, _) => data.y,
                              color: Colors.blue
                              //  sizeValueMapper: (getdata data, _) => 5,
                              ),
                          BubbleSeries<getdata, num>(
                              dataSource: europe,
                              xValueMapper: (getdata data, _) => data.x,
                              yValueMapper: (getdata data, _) => data.y,
                              color: Colors.red
                              // sizeValueMapper: (getdata data, _) => 5),
                              )
                        ])
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: size.height * 0.55,
                width: size.width,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.green.withOpacity(0.8),
                            size: 20,
                          ),
                          Text(
                            "0-9",
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
                            "10-16",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.lightBlueAccent.withOpacity(0.8),
                            size: 20,
                          ),
                          Text(
                            "17-24",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.deepPurpleAccent.withOpacity(0.8),
                            size: 20,
                          ),
                          Text(
                            "25-30",
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.pink.withOpacity(0.8),
                            size: 20,
                          ),
                          Text(
                            "25-30",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.4,
                      child: Chart(
                        data: roseData,
                        variables: {
                          'name': Variable(
                            accessor: (Map map) => map['name'] as String,
                          ),
                          'value': Variable(
                            accessor: (Map map) => map['value'] as num,
                            scale: LinearScale(min: 0, marginMax: 0.1),
                          ),
                          'color': Variable(
                            accessor: (Map map) => map['color'] as Color,
                            scale: LinearScale(min: 0, marginMax: 0.1),
                          ),
                        },
                        elements: [
                          IntervalElement(
                            label: LabelAttr(
                                encoder: (tuple) =>
                                    Label(tuple['name'].toString())),
                            shape: ShapeAttr(
                                value: RectShape(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            )),
                            // color: ColorAttr(values: colors),
                            color: ColorAttr(
                                encoder: (tuple) => Color(
                                      tuple['color'],
                                    )),
                            elevation: ElevationAttr(value: 5),
                          ),
                        ],
                        coord: PolarCoord(startRadius: 0.15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
