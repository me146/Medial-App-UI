// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Drawers extends StatelessWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Icon> icons = [
      Icon(Icons.now_widgets_outlined),
      Icon(Icons.insert_invitation),
      Icon(Icons.groups_outlined),
      Icon(Icons.mail),
      Icon(Icons.messenger_outline),
      Icon(Icons.star_border),
      Icon(Icons.folder_copy_outlined)
    ];
    List<String> name = [
      "DashBord",
      "Appoitment",
      "Patients",
      "Test result",
      "Massage",
      "Reviews",
      "Finances"
    ];
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Center(
              child: ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "asset/doctor.png",
                      ),
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                title: Text("Name"),
                subtitle: Text("Paitent"),
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: name.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        icons[index],
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          name[index],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF404D53),
                          ),
                        )
                      ],
                    ),
                    Divider(),
                  ],
                ),
              );
            },
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFF404D53),
            ),
          )
        ],
      ),
    );
  }
}
