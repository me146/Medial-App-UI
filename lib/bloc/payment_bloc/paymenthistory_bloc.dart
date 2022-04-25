import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'paymenthistory_event.dart';
part 'paymenthistory_state.dart';

class Reson {
  String name;
  String resons;
  int Payment;
  DateTime date;

  Reson(this.Payment, this.date, this.name, this.resons);
}

class PaymenthistoryBloc
    extends Bloc<PaymenthistoryEvent, PaymenthistoryState> {
  List<Reson> reson = [];
  int index = 0;
  PaymenthistoryBloc() : super(PaymenthistoryInitial()) {
    on<GetPaymentHistory>((event, emit) {
      if (reson.isEmpty) {
        for (int i = 0; i < 4; i++) {
          reson.add(Reson(25, DateTime.now(), "name", "resons"));
        }
        index = 0;
        emit(DisplayPaymentHistory(index, reson));
      }else{
        index = 0;
        emit(DisplayPaymentHistory(index, reson));
      }
    });
  }
}
