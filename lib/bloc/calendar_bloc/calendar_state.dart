part of 'calendar_bloc.dart';

@immutable
abstract class CalendarState {}

class CalendarInitial extends CalendarState {}

class CalendarFatchin extends CalendarState {}

class DisplayCalendar extends CalendarState {
 Map<DateTime, List<Appointment>> appointment;
 DateTime dateTime;

  DisplayCalendar(this.appointment, this.dateTime);
}
