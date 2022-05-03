part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class ShowTask extends TaskState {
  List<GetTask> tasks;
  ShowTask(this.tasks);
}
