import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:ibilling/models/contract_model.dart';
import 'package:ibilling/services/fetching/list_event.dart';

import '../demo_data.dart';

//FOR NOT REAL USE
class Network {
  Future<List<ModelContract>> fetchData(http.Client client) async {
    final demoData = DemoData();
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));

    if (response.statusCode == 200) {
      // var list = ModelContract.fromJson(jsonDecode(response.body));
      var response1 = await demoData.getDemoData();
      var list1 = jsonDecode(response1);
      print(list1[2]["name"].toString());
      List<ModelContract> newList = [];
      for (var element in list1) {
        var contract = ModelContract.fromJson(element);
        newList.add(contract);
      }
      return newList;
    } else {
      throw Exception("FAILED TO GET MOCK DATA");
    }
  }
}

class FetchDataBloc2
    extends Bloc<ContractListUpdateEvent, List<ModelContract>> {
  FetchDataBloc2() : super([]);

  List<ModelContract> contractList = [];
  List<ModelContract> savedList = [];
  bool special = false;

  @override
  Stream<List<ModelContract>> mapEventToState(
      ContractListUpdateEvent event) async* {
    if (event is GetData) {
      contractList = await event.fetchData(http.Client());
      yield contractList;
    }
    if (event is DeleteContract) {
      contractList.removeWhere((element) {
        return element.contractNumber == event.contractNumber;
      });
      yield contractList;
    }
    if (event is UpdateSavedStatus) {
      contractList.forEach((element) {
        if (element.contractNumber == event.contractIndex) {
          element.isSaved = !element.isSaved;
        }
      });
      yield contractList;
    }
    if (event is ContractsDayUpdate) {
      var contractList1 = contractList.where((element) {
        var day = event.getDate2().day;
        var month = event.getDate2().month;
        var year = event.getDate2().year;

        return element.date.day == day &&
            element.date.month == month &&
            element.date.year == year;
      }).toList();
      yield contractList1;
      print('$contractList1 AND $contractList from NEW');
    }
    if (event is AddContractEvent) {
      contractList.add(event.contract);
      yield contractList;
      print(contractList[4].date.toString());
    }
  }

  List<ModelContract> getSavedContract() {
    return state.where((contract) {
      return contract.isSaved == true;
    }).toList();
  }
}

class FetchSpecialDataBloc extends Bloc<ContractListUpdateEvent, List> {
  FetchSpecialDataBloc() : super([]);

  List<ModelContract> contractList = [];

  @override
  Stream<List> mapEventToState(ContractListUpdateEvent event) async* {
    if (event is GetSpecificContract) {
      List<ModelContract> specialList = [];
      contractList = await event.fetchData(http.Client());
      Timer(Duration(milliseconds: 100), () {
        contractList = contractList.where((element) {
          return element.name == event.name;
        }).toList();
      });
      yield contractList;
    }
  }
}
