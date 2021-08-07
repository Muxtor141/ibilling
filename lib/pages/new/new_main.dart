import 'package:flutter/material.dart';
import 'package:ibilling/pages/new/add_contract.dart';

class PageNew extends StatefulWidget {
  final Widget body;
  PageNew({Key? key, required this.body}) : super(key: key);

  @override
  _PageNewState createState() => _PageNewState();
}

class _PageNewState extends State<PageNew> {
  Widget widget1 = AddContract();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.body,
    );
  }
}
