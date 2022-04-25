import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'doctordashboard_event.dart';
part 'doctordashboard_state.dart';

class Patient {
  String name;
  String photo;
  String number;
  String reason;
  DateTime time;

  Patient(this.name, this.number, this.photo, this.reason, this.time);
}

class DoctordashboardBloc
    extends Bloc<DoctordashboardEvent, DoctordashboardState> {
  List<Patient> patient = [];
  int index = 0;

  DoctordashboardBloc() : super(DoctordashboardInitial()) {
    on<GetPatientDetails>((event, emit) {
      if (patient.isEmpty) {
        emit(PatientFectching());
        for (int i = 0; i < 5; i++) {
          patient.add(Patient("MukeshBhai " + i.toString(), "1234567890", "",
              "USG " + i.toString(), DateTime.now()));
        }
        index = 0;
        emit(DisplayPatient(patient, index));
      } else {
        index = 0;
        emit(DisplayPatient(patient, index));
      }
    });

    on<GetNextPatientDetails>((event, emit) {
      index = (index + 1) % (patient.length);
      emit(DisplayPatient(patient, index));
    });

    on<GetPriviousPatientDetails>((event, emit) {
      index = (index - 1) % (patient.length);
      emit(DisplayPatient(patient, index));
    });
  }
}
