part of 'paymenthistory_bloc.dart';

@immutable
abstract class PaymenthistoryState {}

class PaymenthistoryInitial extends PaymenthistoryState {}

class PaymentHistoryFatching extends PaymenthistoryState{

}

class DisplayPaymentHistory extends PaymenthistoryState {
  List<Reson> reson;
  int index;
  DisplayPaymentHistory(this.index,this.reson);
}