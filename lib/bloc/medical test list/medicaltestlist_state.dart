part of 'medicaltestlist_bloc.dart';

@immutable
abstract class MedicaltestlistState {}

class MedicaltestlistInitial extends MedicaltestlistState {}

class MedicalTestListFatching extends MedicaltestlistState {}

class DisplayMedicalTestList extends MedicaltestlistState {
  List<TestList> testlist;
  DisplayMedicalTestList(this.testlist);
}
