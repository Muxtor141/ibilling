import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

/// The events which `CounterBloc` will react to.
class ControllerTextEvent {}

class SetPersonStatus extends ControllerTextEvent {
  final String text;
  SetPersonStatus(this.text);
}

class SetPaidStatus extends ControllerTextEvent {
  final String text;
  SetPaidStatus(this.text);
}

/// A `CounterBloc` which handles converting `CounterEvent`s into `int`s.
class CreateContractBloc extends Bloc<ControllerTextEvent, List> {
  /// The initial state of the `CounterBloc` is 0.
  CreateContractBloc() : super(["", ""]);

  List<String> texts = ["", ""];
  @override
  Stream<List> mapEventToState(ControllerTextEvent event) async* {
    if (event is SetPersonStatus) {
      texts[0] = event.text;

      yield texts;
    }
    if (event is SetPaidStatus) {
      texts[1] = event.text;

      yield texts;
    }
  }
}
