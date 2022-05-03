// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medicalappui/bloc/Questions_bloc/questions_bloc.dart';
import 'package:medicalappui/widget/TitaleCard.dart';
import 'package:medicalappui/widget/add.dart';
import 'package:medicalappui/widget/questions%20for%20consultation/Questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    QuestionsBloc q = BlocProvider.of<QuestionsBloc>(context);
    q.add(ShowQuestions());
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
              SizedBox(
                height: 10,
              ),
              Add("Questions for \n consultation"),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: CalendarTimeline(
                  // showYears: true,
                  initialDate: DateTime(2021, 4, 20),
                  firstDate: DateTime(2020, 1, 1),
                  lastDate: DateTime(2026, 11, 20),
                  onDateSelected: (date) => (date),
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
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TitalCard("Resent questions"),
                    
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 20,
                            width: 50,
                            alignment: Alignment.center,
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(5),
                            //   boxShadow: [
                            //     BoxShadow(
                            //       color: Colors.grey.withOpacity(0.5),
                            //       spreadRadius: 2,
                            //       blurRadius: 2,
                            //       offset: Offset(0, 0),
                            //     ),
                            //   ],
                            // ),
                            child: Text("All"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 20,
                            width: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Text("Unread"),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 20,
                            width: 50,
                            alignment: Alignment.center,
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(5),
                            //   boxShadow: [
                            //     BoxShadow(
                            //       color: Colors.grey.withOpacity(0.5),
                            //       spreadRadius: 2,
                            //       blurRadius: 2,
                            //       offset: Offset(0, 0),
                            //     ),
                            //   ],
                            // ),
                            child: Text("New"),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFE6EBF1),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    BlocConsumer<QuestionsBloc, QuestionsState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is DisplayQuestions) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Questionss(state.questions[0]);
                            },
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
