part of 'pationtappoiment_bloc.dart';

@immutable
abstract class PationtappoimentState {}

class PationtappoimentInitial extends PationtappoimentState {}
class PreviusAppoiment extends PationtappoimentState{
  List<GetAllApoiment> appoiments;
  PreviusAppoiment(this.appoiments);

}
