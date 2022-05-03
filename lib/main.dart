import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalappui/bloc/PationtAppoiment/pationtappoiment_bloc.dart';
import 'package:medicalappui/bloc/Task_Bloc/task_bloc.dart';
import 'package:medicalappui/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:medicalappui/bloc/laboratory_bloc/laboratorytests_bloc.dart';
import 'package:medicalappui/screen/DoctorAppointment_Screen.dart';
import 'package:medicalappui/screen/DoctorDashbord_Screen.dart';
import 'package:medicalappui/screen/DoctorStatistic.dart';
import 'package:medicalappui/screen/HelthStatistics.dart';
import 'package:medicalappui/screen/MedicaleTest_Screen.dart';
import 'package:medicalappui/screen/PatiantList.dart';
import 'package:medicalappui/screen/PatientPace_Screen.dart';
import 'package:medicalappui/screen/Questions_Screen.dart';
import 'package:medicalappui/screen/TaskList.dart';
import 'package:medicalappui/screen/appoiment.dart';
import 'package:medicalappui/screen/demo.dart';
import 'bloc/MedicalTest/medicaltest_bloc.dart';
import 'bloc/Patients_Appouiment/patientsappoiment_bloc.dart';
import 'bloc/Questions_bloc/questions_bloc.dart';
import 'bloc/TaskSchedularList/tskschedulerlist_bloc.dart';
import 'bloc/patient_bloc/doctordashboard_bloc.dart';
import 'bloc/payment_bloc/paymenthistory_bloc.dart';
import 'screen/TaskScheduler.dart';
import 'screen/TodayAppoiment.dart';

void main() {
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
          create: (context) => MedicaltestBloc(),
        ),
        BlocProvider(
          create: (context) => PationtappoimentBloc(),
        ),
        BlocProvider(
          create: (context) => TaskBloc(),
        ),
        BlocProvider(
          create: (context) => TskschedulerlistBloc(),
        ),
        BlocProvider(
          create: (context) => PatientsappoimentBloc(),
        )
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
        home: TodayAppoiment(),
      ),
    ),
  );
}
