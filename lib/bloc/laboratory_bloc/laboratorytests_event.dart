part of 'laboratorytests_bloc.dart';

@immutable
abstract class LaboratorytestsEvent {}

class GetLaboratoryCard extends LaboratorytestsEvent {}

class GetNextLaboratoryPatient extends LaboratorytestsEvent {}

class GetPriviousLaboratoryPatient extends LaboratorytestsEvent {}
