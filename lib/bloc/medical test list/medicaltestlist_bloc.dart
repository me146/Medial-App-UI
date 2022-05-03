import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'medicaltestlist_event.dart';
part 'medicaltestlist_state.dart';

class TestList {
  String name;
  String doctortype;
  DateTime time;
  TestList(this.name, this.doctortype, this.time);
}

class MedicaltestlistBloc
    extends Bloc<MedicaltestlistEvent, MedicaltestlistState> {
  List<TestList> testlist = [];
  MedicaltestlistBloc() : super(MedicaltestlistInitial()) {
    on<ShowMedicalTestList>((event, emit) {
      if (testlist.isEmpty) {
        for (int i = 0; i < 3; i++) {
          testlist.add(
            TestList("name", "Cephalin-cholesterol", DateTime.now()),
          );
        }
        emit(DisplayMedicalTestList(testlist));
      }
    });
  }
}
