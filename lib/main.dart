import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalappui/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:medicalappui/bloc/laboratory_bloc/laboratorytests_bloc.dart';
import 'package:medicalappui/screen/MedicalTest_Screen.dart';
import 'package:medicalappui/screen/Planner_Screen.dart';
import 'package:medicalappui/screen/AppointmentStatistics_Screens.dart';
import 'package:medicalappui/screen/Calender_Demo.dart';
import 'package:medicalappui/screen/Diagnoses_Screen.dart';
import 'package:medicalappui/screen/DoctorAppointment_Screen.dart';
import 'package:medicalappui/screen/DoctorDashbord_Screen.dart';
import 'package:medicalappui/screen/DoctorRatingList_Screen.dart';
import 'package:medicalappui/screen/EpidemicCalender_Screen.dart';
import 'package:medicalappui/screen/MedicalStaffList_Screen.dart';
import 'package:medicalappui/screen/MonthAppointment_Screen.dart';
import 'package:medicalappui/screen/PatientPace_Screen.dart';
import 'package:medicalappui/screen/PatientStatistics_Screen.dart';
import 'package:medicalappui/screen/Planner_Screen.dart';
import 'package:medicalappui/screen/Questions_Screen.dart';
import 'package:medicalappui/screen/Statistics_Screen.dart';
import 'package:medicalappui/screen/demo.dart';

import 'bloc/Questions_bloc/questions_bloc.dart';
import 'bloc/doctor rating list/doctorratingslist_bloc.dart';
import 'bloc/medical staff list/doctorstaflist_bloc.dart';
import 'bloc/medical test list/medicaltestlist_bloc.dart';
import 'bloc/patient_bloc/doctordashboard_bloc.dart';
import 'bloc/payment_bloc/paymenthistory_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'bloc/planner_bloc/plannerlist_bloc.dart';

void main()  {
  initializeDateFormatting('en_ISO', null);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DoctordashboardBloc(),
        ),
        BlocProvider(
          create: (_) => LaboratorytestsBloc(),
        ),
        BlocProvider(
          create: (_) => PaymenthistoryBloc(),
        ),
        BlocProvider(
          create: (_) => CalendarBloc(),
        ),
        BlocProvider(
          create: (_) => QuestionsBloc(),
        ),
        BlocProvider(
          create: (_) => DoctorratingslistBloc(),
        ),
        BlocProvider(
          create: (_) => DoctorstaflistBloc(),
        ),
        BlocProvider(
          create: (_) => PlannerlistBloc(),
        ),
        BlocProvider(
          create: (_) => MedicaltestlistBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: Colors.black,
          ),
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.blue)),
        ),
        home: MedicalTest()
      ),
    ),
  );
}
