import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/pages/new/add_contract.dart';
import 'package:ibilling/services/adding/add_data_bloc.dart';
import 'package:ibilling/services/date/date_bloc.dart';

class PageNew extends StatefulWidget {
  final Widget body;

  PageNew({Key? key, required this.body}) : super(key: key);

  @override
  _PageNewState createState() => _PageNewState();
}

class _PageNewState extends State<PageNew> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateContractBloc(),
      child: Container(
        child: widget.body,
      ),
    );
  }
}
