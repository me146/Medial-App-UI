import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class GetTask {
  String taskName;
  String stuts;
  DateTime date;
  DateTime time;
  bool isselected;
  GetTask(this.taskName, this.stuts, this.date, this.time,this.isselected);
}

class TaskBloc  extends Bloc<TaskEvent, TaskState> {
  List<GetTask> tasks = [];
  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
  
for(int i=0;i<5;i++){

  tasks.add(GetTask("Book fight to Seattle", "FAMILy",DateTime.now(), DateTime.now(), true));
}
emit(ShowTask(tasks));

      // TODO: implement event handler
    });
  }
}
