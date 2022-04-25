part of 'questions_bloc.dart';

@immutable
abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsFatching extends QuestionsState {}

class DisplayQuestions extends QuestionsState {
  List<Questions> questions;
  DisplayQuestions(this.questions);
}
