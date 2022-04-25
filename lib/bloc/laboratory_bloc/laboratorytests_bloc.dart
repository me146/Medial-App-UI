import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'laboratorytests_event.dart';
part 'laboratorytests_state.dart';

class Report {
  String name;
  String details;

  Report(this.name, this.details);
}

class LaboratorytestsBloc
    extends Bloc<LaboratorytestsEvent, LaboratorytestsState> {
  List<Report> report = [];
  int index = 0;
  LaboratorytestsBloc() : super(LaboratorytestsInitial()) {
    on<GetLaboratoryCard>((event, emit) {
      if (report.isEmpty) {
        emit(GetLaboratoryDetails());
        for (int i = 0; i < 5; i++) {
          report.add(
            Report("name", "details"),
          );
          index = 0;
          emit(DesplayLaboratoryCard(report, index));
        }
      } else {
        index = 0;
        emit(DesplayLaboratoryCard(report, index));
      }
    });
    on<GetNextLaboratoryPatient>((event, emit) {
      index = (index + 1) % (report.length);
      emit(DesplayLaboratoryCard(report, index));
    });
    on<GetPriviousLaboratoryPatient>((event, emit) {
      index = (index - 1) % (report.length);
      emit(DesplayLaboratoryCard(report, index));
    });
  }
}
