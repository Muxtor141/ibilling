import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ModelContract {
  final String name, status, amount, address, inn;
  final DateTime date;
  final int invoices, contractNumber, lastInvoice;
  bool isSaved = false;

  ModelContract(
      this.date,
      this.invoices,
      this.isSaved,
      this.name,
      this.status,
      this.address,
      this.amount,
      this.inn,
      this.lastInvoice,
      this.contractNumber);

  ModelContract.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        contractNumber = json['contractNumber'],
        status = json['status'],
        isSaved=json['isSaved'],
        invoices = json['invoices'],
        date = json['created'],
        address = json['address'],
        amount = json['amount'],
        inn = json['inn'],
        lastInvoice = json['lastInvoice'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'contractNumber': contractNumber,
        'status': status,
        'isSaved':isSaved,
        'invoices': invoices,
        'created': date,
        "address": address,
        "amount": amount,
        "inn": inn,
        "lastInvoice": lastInvoice
      };
}

class User {
  final int name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
