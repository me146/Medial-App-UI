part of 'doctorratingslist_bloc.dart';

@immutable
abstract class DoctorratingslistState {}

class DoctorratingslistInitial extends DoctorratingslistState {}

class DoctorRatingListFatching extends DoctorratingslistState {}

class DisplayDoctorRatingList extends DoctorratingslistState {
  List<Doctors> doctorrating;
  DisplayDoctorRatingList(this.doctorrating);
}
