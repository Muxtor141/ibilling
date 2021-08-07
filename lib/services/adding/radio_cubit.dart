import 'package:bloc/bloc.dart';

class RadioStatus extends Cubit<List> {
  RadioStatus() : super(["", ""]);
  List<String> list = ["", ""];
  void updateIndividual(String newValue) {
    list[0] = newValue;
    emit(list);
  }

  void updateStatus(String newValue) {
    list[1] = newValue;
    emit(list);
  }
}
