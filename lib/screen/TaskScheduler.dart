// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:medicalappui/bloc/TaskSchedularList/tskschedulerlist_bloc.dart';
import 'package:medicalappui/widget/TitaleCard.dart';
import 'package:medicalappui/widget/add.dart';
import 'package:medicalappui/widget/appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TaskScheduler extends StatefulWidget {
  TaskScheduler({Key? key}) : super(key: key);

  @override
  State<TaskScheduler> createState() => _TaskSchedulerState();
}

class _TaskSchedulerState extends State<TaskScheduler> {

  @override
  Widget build(BuildContext context) {
    TskschedulerlistBloc t = BlocProvider.of<TskschedulerlistBloc>(context);
    t.add(GetDoctorstask());

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
            Add("My task scheduler"),
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
                shrinkWrap: true,
                children: [
                  TitalCard("Doctor task scheduler"),

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

                 
                  //  DropdownButtonHideUnderline(child: DropdownButton(items: [], onChanged: (value){

                  //  }

                  //  ),
                  //  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
