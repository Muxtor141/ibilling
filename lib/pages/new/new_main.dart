import 'package:flutter/material.dart';
import 'package:ibilling/pages/contracts/date_filter.dart';
import 'package:ibilling/pages/new/add_contract.dart';
import 'package:ibilling/pages/new/add_invoice.dart';
import 'package:ibilling/pages/single/single_item.dart';

class PageNew extends StatefulWidget {
  const PageNew({Key? key}) : super(key: key);

  @override
  _PageNewState createState() => _PageNewState();
}

class _PageNewState extends State<PageNew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AddContract(),
    );
  }
}
