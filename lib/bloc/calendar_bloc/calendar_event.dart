part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent {}

class ShowData extends CalendarEvent {
  DateTime date;
  ShowData(this.date);
}
