part of 'patientsappoiment_bloc.dart';

@immutable
abstract class PatientsappoimentState {}

class PatientsappoimentInitial extends PatientsappoimentState {}
class ShowPAtients extends PatientsappoimentState{
  List<GetPatientAppoiment> patientsAppoiments;
  ShowPAtients(this.patientsAppoiments);

}
