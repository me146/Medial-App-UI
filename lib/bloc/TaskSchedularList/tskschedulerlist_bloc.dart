import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medicalappui/screen/TaskScheduler.dart';
import 'package:meta/meta.dart';

part 'tskschedulerlist_event.dart';
part 'tskschedulerlist_state.dart';

class TaskDropdownstutas {
  String image;
  String name;
  ValueNotifier<DateTime> _focusedDay;
  TaskDropdownstutas(this.image, this.name, this._focusedDay);
}

class TskschedulerlistBloc
    extends Bloc<TskschedulerlistEvent, TskschedulerlistState> {
  Map<String, TaskDropdownstutas> doctorsTask = {};
  TskschedulerlistBloc() : super(TskschedulerlistInitial()) {
    on<GetDoctorstask>((event, emit) {
      // TODO: implement event handler
      for (int i = 0; i < 5; i++) {
        // doctorsTask.add({"value":TaskDropdownstutas("image", "name", [DateTime.now()])});
        doctorsTask.addAll({
          "other":
              TaskDropdownstutas("image", "name", ValueNotifier(DateTime.now()))
        });
      }
    });
  }
}
