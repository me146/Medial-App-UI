part of 'doctordashboard_bloc.dart';

@immutable
abstract class DoctordashboardState {}

class DoctordashboardInitial extends DoctordashboardState {}

class PatientFectching extends DoctordashboardState {}

class DisplayPatient extends DoctordashboardState {
  List<Patient> patient;
  int index;

  DisplayPatient(
    this.patient,
    this.index,
  );
}
