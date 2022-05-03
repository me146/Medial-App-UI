part of 'plannerlist_bloc.dart';

@immutable
abstract class PlannerlistState {}

class PlannerlistInitial extends PlannerlistState {}

class PlannerListFatching extends PlannerlistState {}

class DisplayPlannerList extends PlannerlistState {
  List<PlannerList> planner;
  DisplayPlannerList(this.planner);
}
