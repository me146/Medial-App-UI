// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 50, Color.fromRGBO(9, 0, 136, 1)),
      ChartData('Steve', 38, Color.fromRGBO(147, 0, 119, 1)),
      ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
    ];
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: SfCircularChart(
            series: <CircularSeries>[
              // Renders doughnut chart
              DoughnutSeries<ChartData, String>(
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y),
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

// class stacher extends StatefulWidget {
//   const stacher({Key? key}) : super(key: key);

//   @override
//   State<stacher> createState() => _stacherState();
// }

// class _stacherState extends State<stacher> {
//   late List<_ChartData> data;
//   late List<_ChartData> data1;
//   late TooltipBehavior _tooltip;

//   @override
//   void initState() {
//     data = [
//       _ChartData('CHN', 120),
//       _ChartData('GER', 150),
//       _ChartData('RUS', 300),
//       _ChartData('BRZ', 640),
//       _ChartData('IND', 140)
//     ];
//     data1 = [
//       _ChartData('CHN', 200),
//       _ChartData('GER', 300),
//       _ChartData('RUS', 250),
//       _ChartData('BRZ', 850),
//       _ChartData('IND', 110)
//     ];
//     _tooltip = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Syncfusion Flutter chart'),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height * .5,
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 15),
//         child: SfCartesianChart(
//           primaryXAxis: CategoryAxis(),
//           primaryYAxis: NumericAxis(minimum: 0, maximum: 900, interval: 100),
//           tooltipBehavior: _tooltip,
//           series: <ChartSeries<_ChartData, String>>[
//             BubbleSeries<_ChartData, String>(
//                 dataSource: data,
//                 xValueMapper: (_ChartData data, _) => data.x,
//                 yValueMapper: (_ChartData data, _) => data.y,
//                 name: 'Gold',
//                 color: Color.fromRGBO(8, 142, 255, 1)),
//             BubbleSeries<_ChartData, String>(
//                 dataSource: data1,
//                 yValueMapper: (_ChartData data, _) => data.y,
//                 xValueMapper: (_ChartData data, _) => data.x,
//                 name: 'Gold',
//                 color: Color.fromARGB(255, 243, 131, 131))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ChartData {
//   _ChartData(this.x, this.y);

//   final String x;
//   final double y;
// }

class ScrollList extends StatefulWidget {
  const ScrollList({Key? key}) : super(key: key);

  @override
  State<ScrollList> createState() => _ScrollListState();
}

class _ScrollListState extends State<ScrollList> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          color: Color(0xFFE6EBF1),
          child: Column(
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
        ),
      ),
    );
  }
}

class Tabbar extends StatelessWidget {
  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                TabBar(
                 
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
                TabBarView(
                  children: [
                    Icon(Icons.directions_car),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
