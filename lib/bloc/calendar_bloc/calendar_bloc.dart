import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class Appointment {
  String name;
  String appoitmenttype;
  String photo;
  String numbar;
  DateTime time;

  Appointment(
    this.name,
    this.appoitmenttype,
    this.photo,
    this.numbar,
    this.time,
  );
}

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  Map<DateTime, List<Appointment>> appointment = {};
  CalendarBloc() : super(CalendarInitial()) {
    on<ShowData>((event, emit) {
      appointment[event.date] = [];

      // TODO: implement event handler

      for (int i = 0; i < 5; i++) {
        appointment[event.date]!.add(Appointment(
            "Ridham ${i}", "Emergency", "xyz", "1234567890", DateTime.now()));
      }
      emit(DisplayCalendar(appointment, event.date));
    });
  }
}
