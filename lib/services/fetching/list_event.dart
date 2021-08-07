abstract class ContractListUpdateEvent {}

class ContractOnly extends ContractListUpdateEvent {}

class InvoiceOnly extends ContractListUpdateEvent {}

class UpdateDate extends ContractListUpdateEvent {}

class GetData extends ContractListUpdateEvent {}

class ContractsDayUpdate extends ContractListUpdateEvent {
  final DateTime date;
  ContractsDayUpdate(this.date);

  DateTime getDate2() {
    return date;
  }
}
