// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medicalappui/screen/MedicalStaffList_Screen.dart';
import 'package:medicalappui/widget/medical%20test/MedicalTestLIst.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/medical test list/medicaltestlist_bloc.dart';
import '../widget/add.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class MedicalTest extends StatefulWidget {
  const MedicalTest({Key? key}) : super(key: key);

  @override
  State<MedicalTest> createState() => _MedicalTestState();
}

class _MedicalTestState extends State<MedicalTest> {
  @override
  Widget build(BuildContext context) {
    MedicaltestlistBloc m = BlocProvider.of<MedicaltestlistBloc>(context);
    m.add(ShowMedicalTestList());

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
              Add("Medical Test"),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    BlocConsumer<MedicaltestlistBloc, MedicaltestlistState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is DisplayMedicalTestList) {
                          return ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return MedicalTestList(state.testlist[0]);
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
