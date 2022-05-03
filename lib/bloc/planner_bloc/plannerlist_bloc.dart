import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'plannerlist_event.dart';
part 'plannerlist_state.dart';

class PlannerList {
  String name;
  DateTime time;
  bool chack;
  PlannerList(this.name, this.time, this.chack);
}

class PlannerlistBloc extends Bloc<PlannerlistEvent, PlannerlistState> {
  List<PlannerList> planner = [];
  PlannerlistBloc() : super(PlannerlistInitial()) {
    on<ShowPlannerList>((event, emit) {
      if (planner.isEmpty) {
        for (int i = 0; i < 2; i++) {
          planner.add(PlannerList("name", DateTime.now(),true));
        }
        emit(DisplayPlannerList(planner));
      }
    });
  }
}
