// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medicalappui/widget/add.dart';
import 'package:medicalappui/widget/doctorappointment/appointmentcard.dart';
import 'package:medicalappui/widget/drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import '../bloc/calendar_bloc/calendar_bloc.dart';
import '../widget/appbar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class DoctorAppointment extends StatefulWidget {
  DoctorAppointment({Key? key}) : super(key: key);

  @override
  State<DoctorAppointment> createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
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

  @override
  Widget build(BuildContext context) {
    CalendarBloc c = BlocProvider.of<CalendarBloc>(context);
    c.add(ShowData(DateTime.now()));
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
              Add("Dashboard"),
              Container(
                height: MediaQuery.of(context).size.height / 3.8,
                width: MediaQuery.of(context).size.width / 1,
                margin: EdgeInsets.all(10),
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  borderWidth: 0,
                  primaryYAxis: NumericAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      isVisible: false,
                      axisLine: AxisLine(width: 0)),
                  enableSideBySideSeriesPlacement: false,
                  primaryXAxis:
                      CategoryAxis(isVisible: false, arrangeByIndex: false),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    SplineSeries<_SalesData, String>(
                        opacity: 0.5,
                        dataSource: sdata,
                        color: Colors.green,
                        xValueMapper: (_SalesData sales, _) => sales.year,
                        yValueMapper: (_SalesData sales, _) => sales.sales,
                        name: 'Sales',
                        dataLabelSettings: DataLabelSettings(isVisible: false)),
                    SplineSeries<_SalesData, String>(
                        dataSource: data,
                        color: Colors.blue.shade800.withRed(123),
                        xValueMapper: (_SalesData sales, _) => sales.year,
                        yValueMapper: (_SalesData sales, _) => sales.sales,
                        name: 'Sales',
                        dataLabelSettings: DataLabelSettings(isVisible: false))
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
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Upcomming appointment",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFF404D53),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "September-October",
                            style: TextStyle(
                                textBaseline: TextBaseline.alphabetic),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          child: CalendarTimeline(
                            // showYears: true,
                            initialDate: DateTime(2021, 4, 20),
                            firstDate: DateTime(2020, 1, 1),
                            lastDate: DateTime(2026, 11, 20),
                            onDateSelected: (date) {
                              c.add(ShowData(date));
                            },
                            leftMargin: 10,
                            monthColor: Colors.blueGrey,
                            dayColor: Colors.teal[200],
                            activeDayColor: Colors.black54,
                            activeBackgroundDayColor: Colors.white,
                            dayNameColor: Colors.black54,
                            dotsColor: Color(0xFF333A47),
                            selectableDayPredicate: (date) => date.day != 23,
                            locale: 'en_ISO',
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFE6EBF1),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                    BlocConsumer<CalendarBloc, CalendarState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is DisplayCalendar) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return AppointmentCard(
                                  state.appointment[state.dateTime]![index]);
                            },
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
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
