import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'doctorratingslist_event.dart';
part 'doctorratingslist_state.dart';

class Doctors{
  String name;
  String photo;
  String doctortype;
  String rating;

  Doctors(
    this.name,
    this.photo,
    this.doctortype,
    this.rating,
  );
}

class DoctorratingslistBloc
    extends Bloc<DoctorratingslistEvent, DoctorratingslistState> {
  List<Doctors> doctorrating = [];
  DoctorratingslistBloc() : super(DoctorratingslistInitial()) {
    on<ShowDoctorRatingList>((event, emit) {
      if (doctorrating.isEmpty) {
        for (int i = 0; i < 4; i++) {
          doctorrating.add(Doctors("Name", "", "DoctorType", "3.0"));
        }
        emit(DisplayDoctorRatingList(doctorrating));
      }
    });
  }
}
