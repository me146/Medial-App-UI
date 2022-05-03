import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:getwidget/getwidget.dart';
import 'package:medicalappui/bloc/Task_Bloc/task_bloc.dart';

class TaskCard extends StatelessWidget {
  GetTask task;
   TaskCard(this. task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ListTile(
          leading: GFCheckbox(
            activeBorderColor: GFColors.LIGHT,
            inactiveBorderColor: Color.fromRGBO(255, 255, 255, 1),
            inactiveBgColor: Color(0xFFE5EAF0),
            customBgColor: Colors.blueAccent,
            onChanged: (value) {},
            value: true,
            size: GFSize.SMALL,
            type: GFCheckboxType.custom,
          ),
          subtitle: Text("29 jul 2019  /  03.29"),
          title: Text("Book fight to Seattle"),
          trailing: Icon(
            Icons.circle,
            size: 10,
            color: Colors.deepPurpleAccent,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: DottedLine(lineLength: size.width, dashColor: Colors.grey),
        ),
      ],
    );
  }
}
