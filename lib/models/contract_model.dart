import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ModelContract {
  final String name, status;
  final int invoices;
  final DateTime date;
  bool isSaved = false;

  ModelContract(this.date, this.invoices, this.isSaved, this.name, this.status);

  ModelContract.fromJson(Map<String, dynamic> json)
      : name = json[''],
        status = json[''],
        invoices = json[''],
        date = json[''];

  Map<String, dynamic> toJson() =>
      {'': name, '': status, '': invoices, '': date};
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
