import 'dart:convert';

import 'package:ibilling/models/contract_model.dart';
import 'package:http/http.dart' as http;
import '../demo_data.dart';

abstract class ContractListUpdateEvent {
  Future<List<ModelContract>> fetchData(http.Client client) async {
    final demoData = DemoData();
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));

    if (response.statusCode == 200) {
      // var list = ModelContract.fromJson(jsonDecode(response.body));
      var response1 = await demoData.getDemoData();
      List<dynamic> list1 = jsonDecode(response1);

      List<ModelContract> newList = [];
      for (var element in list1) {
        element["created"] = DateTime.parse(element["created"]);
        var contract = ModelContract.fromJson(element);
        newList.add(contract);
      }
      return newList;
    } else {
      throw Exception("FAILED TO GET MOCK DATA");
    }
  }
}

class ContractOnly extends ContractListUpdateEvent {}

class InvoiceOnly extends ContractListUpdateEvent {}

class UpdateDate extends ContractListUpdateEvent {}

class GetData extends ContractListUpdateEvent {}

class AddContractEvent extends ContractListUpdateEvent {
  final ModelContract contract;
  AddContractEvent(this.contract);
}

class GetSpecificContract extends ContractListUpdateEvent {
  final String name;
  GetSpecificContract(this.name);
}

class ContractsDayUpdate extends ContractListUpdateEvent {
  final DateTime date;
  ContractsDayUpdate(this.date);

  DateTime getDate2() {
    return date;
  }
}

class DeleteContract extends ContractListUpdateEvent {
  final int contractNumber;
  DeleteContract(this.contractNumber);
}
