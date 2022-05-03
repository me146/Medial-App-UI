// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medicalappui/bloc/PationtAppoiment/pationtappoiment_bloc.dart';
import 'package:medicalappui/widget/TitaleCard.dart';
import 'package:medicalappui/widget/add.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalappui/widget/appbar.dart';
import 'package:medicalappui/widget/pationtAppoiment.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Appoiment_Screen extends StatefulWidget {
  Appoiment_Screen({Key? key}) : super(key: key);

  @override
  State<Appoiment_Screen> createState() => _Appoiment_ScreenState();
}

class _Appoiment_ScreenState extends State<Appoiment_Screen>
    with TickerProviderStateMixin {
  final Duration animDuration = const Duration(milliseconds: 250);
  TabController? tabController;
  List<String> week = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 1, vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PationtappoimentBloc p = BlocProvider.of<PationtappoimentBloc>(context);
    p.add(GetPreviousAppoiment());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget("Menu"),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: Colors.blue,
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Color(0xFFE6EBF1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Add("My appoiment"),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 30,
                    color: Colors.white,
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                    child: Text(
                      "Overal appoiment",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Container(
                    height: size.height * 0.2,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                    child: BarChart(
                      mainBarData(),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                   SizedBox(
                    height: 12,
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
                        SizedBox(
                          height: 10,
                        ),
                      TitalCard("Previous appoiment"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: TabBar(
                                indicator: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(
                                  //   25.0,
                                  // ),
                                  color: Colors.white,
                                ),
                                unselectedLabelColor: Colors.transparent,
                                controller: tabController,
                                tabs: [
                                  Tab(
                                      child: Text(
                                    "data",
                                    style: TextStyle(color: Colors.black),
                                  )),
                                  Tab(
                                      child: Text("data",
                                          style:
                                              TextStyle(color: Colors.black))),
                                  Tab(
                                      child: Text("data",
                                          style:
                                              TextStyle(color: Colors.black))),
                                ])),
                        BlocConsumer<PationtappoimentBloc,
                            PationtappoimentState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            if (state is PreviusAppoiment) {
                              return ListView.builder(
                                itemCount: 10,
                                shrinkWrap: true,
                                physics: ScrollPhysics(
                                    parent: NeverScrollableScrollPhysics()),
                                itemBuilder: (context, index) {
                                  return PationAppoiment(state.appoiments[0]);
                                },
                              );
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                color: Colors.white.withOpacity(0.4),
                height: 50,
                alignment: Alignment.center,
                child: Icon(Icons.arrow_drop_down),
              ))
        ],
      ),
    );
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
