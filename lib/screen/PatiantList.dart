// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medicalappui/bloc/Patients_Appouiment/patientsappoiment_bloc.dart';
import 'package:medicalappui/widget/GFListTileCard.dart';
import 'package:medicalappui/widget/TitaleCard.dart';
import 'package:medicalappui/widget/appbar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatiantList extends StatefulWidget {
  PatiantList({Key? key}) : super(key: key);

  @override
  State<PatiantList> createState() => _PatiantListState();
}

class _PatiantListState extends State<PatiantList>
    with TickerProviderStateMixin {
  String name = "Caral Driffith";
  TabController? tabController;
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 1, vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    List list = ['a', 'x', 'w', 'b', 'z', 'c', 'v', 'p', 'e', 'h'];
    list.sort();
    print(list);
    Size size = MediaQuery.of(context).size;
    PatientsappoimentBloc p = BlocProvider.of<PatientsappoimentBloc>(context);
    p.add(UpdatePatients());
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
            TitalCard("Patients list"),
            SizedBox(
              height: 10,
            ),
            BlocConsumer<PatientsappoimentBloc, PatientsappoimentState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is ShowPAtients) {
                  return Container(
                      padding: EdgeInsets.all(20),
                      // height: size.height,
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
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: TabBar(
                                controller: tabController,
                                // indicatorColor: Colors.white,
                                indicator: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                ),
                                labelColor: Colors.blue,
                                unselectedLabelColor: Colors.blue,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      "All",
                                    ),
                                  ),
                                  Tab(
                                      child: Text(
                                    "Men",
                                  )),
                                  Tab(
                                    child: Text(
                                      "Women",
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemCount: 3,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListView(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  Text(
                                      "- - ${state.patientsAppoiments[index].name.split(" ")[1][0]} - - - - - - -"),
                                  ListView.builder(
                                    itemCount: 3,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      return GFListCard(state.patientsAppoiments[index]);
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ));
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
