part of 'doctorstaflist_bloc.dart';

@immutable
abstract class DoctorstaflistState {}

class DoctorstaflistInitial extends DoctorstaflistState {}

class DoctorStaffListFatching extends DoctorstaflistState {}

class DisplayDoctorStaffList extends DoctorstaflistState {
  List<StaffList> staflist;
  DisplayDoctorStaffList(this.staflist);
}
