import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'doctorstaflist_event.dart';
part 'doctorstaflist_state.dart';

class StaffList {
  String name;
  String doctortype;
  String photo;
  String rating;

  StaffList(
    this.name,
    this.doctortype,
    this.photo,
    this.rating,
  );
}

class DoctorstaflistBloc
    extends Bloc<DoctorstaflistEvent, DoctorstaflistState> {
  List<StaffList> staflist = [];
  DoctorstaflistBloc() : super(DoctorstaflistInitial()) {
    on<ShowDoctorStaffList>((event, emit) {
      if (staflist.isEmpty) {
        for (int i = 0; i < 4; i++) {
          staflist.add(StaffList("Name", "FamilyPractice", "", "3.0"));
        }
        emit(
          DisplayDoctorStaffList(staflist),
        );
      }
    });
  }
}
