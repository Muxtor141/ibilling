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

//ACTUAL BLOC
class FetchDataBloc {
  List<ModelContract> contractList = [];
  List<ModelContract> contractList1 = [];

  List<ModelContract> get filteredList {
    return contractList;
  }

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

  // ignore: close_sinks
  final _listStateController = StreamController<List<ModelContract>>();
  StreamSink<List<ModelContract>> get _inUpdater => _listStateController.sink;
  Stream<List<ModelContract>> get updater => _listStateController.stream;

  // ignore: close_sinks
  final _listUpdateEventController =
      StreamController<ContractListUpdateEvent>();
  Sink<ContractListUpdateEvent> get listUpdateEvent =>
      _listUpdateEventController.sink;

  FetchDataBloc() {
    _listUpdateEventController.stream.listen(_toState);
  }
  void _toState(ContractListUpdateEvent event) async {
    if (event is ContractOnly) {}
    if (event is InvoiceOnly) {}
    if (event is GetData) {
      contractList = await fetchData(http.Client());
      print("GET DATA EVENT");
      _inUpdater.add(contractList);
    }
    if (event is UpdateDate) {}
    if (event is ContractsDayUpdate) {
      var contractList1 = contractList.where((element) {
        var day = event.getDate2().day;
        var month = event.getDate2().month;
        var year = event.getDate2().year;

        return element.date.day == day &&
            element.date.month == month &&
            element.date.year == year;
      }).toList();
      _inUpdater.add(contractList1);
    }

    print(contractList);
  }
}

class FetchDataBloc2 extends Bloc<ContractListUpdateEvent, List> {
  FetchDataBloc2() : super([]);
  List<ModelContract> contractList = [];
  List<ModelContract> contractList1 = [];

  List<ModelContract> get filteredList {
    return contractList;
  }

  @override
  Stream<List> mapEventToState(ContractListUpdateEvent event) async* {
    if (event is ContractOnly) {}
    if (event is InvoiceOnly) {}
    if (event is GetData) {
      contractList = await fetchData(http.Client());
      print("GET DATA EVENT");
      yield contractList;
    }
    if (event is UpdateDate) {}
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
    }
  }

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
