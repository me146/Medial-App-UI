import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'patientsappoiment_event.dart';
part 'patientsappoiment_state.dart';

class GetPatientAppoiment {
  String name;
  double age;
  String image;
  bool isAvailable;
  bool isMessageseen;
  bool isCallAvailable;
  GetPatientAppoiment(this.name, this.age, this.image, this.isAvailable,
      this.isCallAvailable, this.isMessageseen);
}

class PatientsappoimentBloc
    extends Bloc<PatientsappoimentEvent, PatientsappoimentState> {
  List<GetPatientAppoiment> patientsAppoiments = [];
  PatientsappoimentBloc() : super(PatientsappoimentInitial()) {
    on<UpdatePatients>((event, emit) {
      for (int i = 0; i < 5; i++) {
        patientsAppoiments.add(GetPatientAppoiment(
            "Caral Driffith", 23, "image", true, true, true));
            emit(ShowPAtients(patientsAppoiments));
      }
      // TODO: implement event handler
    });
  }
}
