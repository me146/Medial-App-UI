part of 'medicaltest_bloc.dart';

@immutable
abstract class MedicaltestState {}

class MedicaltestInitial extends MedicaltestState {}

class MedicalTestReport extends MedicaltestState {
  List<Reson> report;
  MedicalTestReport(this.report);
}
