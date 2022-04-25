part of 'doctordashboard_bloc.dart';

@immutable
abstract class DoctordashboardEvent {}

class GetPatientDetails extends DoctordashboardEvent {}

class GetNextPatientDetails extends DoctordashboardEvent {}

class GetPriviousPatientDetails extends DoctordashboardEvent {}
