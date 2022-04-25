// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:medicalappui/widget/add.dart';
import 'package:medicalappui/widget/appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalappui/widget/drawer.dart';
import 'package:dotted_line/dotted_line.dart';
import '../bloc/laboratory_bloc/laboratorytests_bloc.dart';
import '../bloc/patient_bloc/doctordashboard_bloc.dart';
import '../bloc/payment_bloc/paymenthistory_bloc.dart';
import '../widget/DoctorDashbord/deshboardcard.dart';
import '../widget/DoctorDashbord/laboratorytests.dart';
import '../widget/DoctorDashbord/paymenthistory.dart';

class DoctorDashbord extends StatefulWidget {
  const DoctorDashbord({Key? key}) : super(key: key);

  @override
  State<DoctorDashbord> createState() => _DoctorDashbordState();
}

class _DoctorDashbordState extends State<DoctorDashbord> {
  @override
  Widget build(BuildContext context) {
    DoctordashboardBloc b = BlocProvider.of<DoctordashboardBloc>(context);
    b.add(GetPatientDetails());
    LaboratorytestsBloc c = BlocProvider.of<LaboratorytestsBloc>(context);
    c.add(GetLaboratoryCard());
    PaymenthistoryBloc p = BlocProvider.of<PaymenthistoryBloc>(context);
    p.add(GetPaymentHistory());
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
            // physics: NeverScrollableScrollPhysics(),
            children: [
              Add("Doctor Dashboard"),

              BlocConsumer<DoctordashboardBloc, DoctordashboardState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is DisplayPatient) {
                    return DoctorDashboard(state.patient[state.index]);
                  }
                  if (state is PatientFectching) {
                    return CircularProgressIndicator();
                  }
                  return SizedBox.shrink();
                },
              ),
              SizedBox(
                height: 10,
              ),
              // LaboratoryTests(),
              BlocConsumer<LaboratorytestsBloc, LaboratorytestsState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is DesplayLaboratoryCard) {
                    return LaboratoryTests(state.report[state.index]);
                  }
                  if (state is GetLaboratoryDetails) {
                    return CircularProgressIndicator();
                  }
                  return SizedBox.shrink();
                },
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
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Payments history",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF404D53),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    BlocConsumer<PaymenthistoryBloc, PaymenthistoryState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is DisplayPaymentHistory) {
                          return ListView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            physics: ScrollPhysics(
                                parent: NeverScrollableScrollPhysics()),
                            itemBuilder: (context, index) {
                              return PaymentHistory(
                                state.reson[state.index],
                              );
                            },
                          );
                        }
                        if (state is PaymentHistoryFatching) {
                          return CircularProgressIndicator();
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    SizedBox(
                      height: 10,
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
