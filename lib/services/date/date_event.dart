abstract class DateUpdateEvent {}

class ContractStartDate extends DateUpdateEvent {
  final DateTime startDate;
  ContractStartDate(this.startDate);

  DateTime getDate() {
    return startDate;
  }
}

class ContractEndDate extends DateUpdateEvent {
  final DateTime endDate;
  ContractEndDate(this.endDate);
  DateTime getDate1() {
    return endDate;
  }
}
