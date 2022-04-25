part of 'laboratorytests_bloc.dart';

@immutable
abstract class LaboratorytestsState {}

class LaboratorytestsInitial extends LaboratorytestsState {}

class GetLaboratoryDetails extends LaboratorytestsState {}

class DesplayLaboratoryCard extends LaboratorytestsState {
  List<Report> report;
  int index;
  DesplayLaboratoryCard(this.report, this.index);
}
