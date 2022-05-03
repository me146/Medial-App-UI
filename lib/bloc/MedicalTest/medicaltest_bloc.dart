import 'package:bloc/bloc.dart';
import 'package:medicalappui/bloc/payment_bloc/paymenthistory_bloc.dart';
import 'package:meta/meta.dart';

part 'medicaltest_event.dart';
part 'medicaltest_state.dart';





class MedicaltestBloc extends Bloc<MedicaltestEvent, MedicaltestState> {
List<Reson> Report=[];

  MedicaltestBloc() : super(MedicaltestInitial()) {
    on<GetMedicalTestsTReport>((event, emit) {
      // TODO: implement event handler
Report = [];
      for(int i=0;i<5;i++){
        Report.add(Reson(23.50, DateTime.now(), "Dr.Corey Aguilar", "Kidny function test"));
      }
      emit(MedicalTestReport(Report));

    });
  }
}
