import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pationtappoiment_event.dart';
part 'pationtappoiment_state.dart';

class GetAllApoiment {
  String image;
  String name;
  String appoimentReson;
  DateTime time;
  GetAllApoiment(this.image, this.name, this.appoimentReson, this.time);
}

class PationtappoimentBloc
    extends Bloc<PationtappoimentEvent, PationtappoimentState> {
  List<GetAllApoiment> appoiments = [];
  PationtappoimentBloc() : super(PationtappoimentInitial()) {
    on<GetPreviousAppoiment>((event, emit) {
      // TODO: implement event handler
      appoiments = [];
      for (int i = 0; i < 5; i++) {
        appoiments.add(GetAllApoiment("asset/ezgif.com-gif-maker.jpg",
            "Dr.Shawn Hampot", "Emargancy Appoiment", DateTime.now()));
      }
      emit(PreviusAppoiment(appoiments));
    });
  }
}
