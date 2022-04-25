import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class Questions {
  String question;
  String massage;
  DateTime time;

  Questions(this.question, this.massage, this.time);
}

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  List<Questions> questions = [];
  QuestionsBloc() : super(QuestionsInitial()) {
    on<ShowQuestions>((event, emit) {
      // TODO: implement event handler
      if (questions.isEmpty) {
        for (int i = 0; i < 4; i++) {
          questions.add(Questions("Questions", "", DateTime.now()));
        }
        emit(DisplayQuestions(questions, ));
      }
    });
  }
}
