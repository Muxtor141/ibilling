import 'dart:async';

import 'package:ibilling/services/date/date_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateUpdateBloc {
  List<DateTime> dateList = [
    DateTime(2017, 04, 17),
    DateTime.now().add(Duration(days: 20))
  ];

  final _dataStateController = StreamController<List<DateTime>>();
  StreamSink<List<DateTime>> get _inUpdater => _dataStateController.sink;
  Stream<List<DateTime>> get updater => _dataStateController.stream;

  // ignore: close_sinks
  final _dateUpdateEventController = StreamController<DateUpdateEvent>();
  Sink<DateUpdateEvent> get listUpdateEvent => _dateUpdateEventController.sink;
  DateUpdateBloc() {
    _dateUpdateEventController.stream.listen(_toState);
  }

  void _toState(DateUpdateEvent event) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (event is ContractStartDate) {
      dateList[0] = event.getDate();
    }
    if (event is ContractEndDate) {
      dateList[1] = event.getDate1();
    }

    _inUpdater.add(dateList);

    var day = dateList[0].day < 10 ? "0${dateList[0].day}" : dateList[0].day;
    var month =
        dateList[0].month < 10 ? "0${dateList[0].month}" : dateList[0].month;
    print("${dateList[0].year}-${dateList[0].month}-${dateList[0].day}");
    pref.setString("startDate", "${dateList[0].year}-$month-$day");

    print("$dateList FROM DATE BLOC");
  }
}
