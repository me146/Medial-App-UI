import 'package:flutter/material.dart';
import 'package:medicalappui/bloc/MedicalTest/medicaltest_bloc.dart';
import 'package:medicalappui/widget/add.dart';
import 'package:medicalappui/widget/appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalappui/widget/doctordashbord/paymenthistory.dart';

class MedicaleTest extends StatefulWidget {
  MedicaleTest({Key? key}) : super(key: key);

  @override
  State<MedicaleTest> createState() => _MedicaleTestState();
}

class _MedicaleTestState extends State<MedicaleTest> {
  @override
  Widget build(BuildContext context) {
    MedicaltestBloc m = BlocProvider.of<MedicaltestBloc>(context);
    m.add(GetMedicalTestsTReport());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget("Menu"),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFE6EBF1),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              Add("Medical tests"),
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
                child: BlocConsumer<MedicaltestBloc, MedicaltestState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is MedicalTestReport) {
                      return ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: ScrollPhysics(
                            parent: NeverScrollableScrollPhysics()),
                        itemBuilder: (context, index) {
                          return PaymentHistory(
                            state.report[0],
                          );
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  },
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
