import 'package:flutter/material.dart';
import 'package:ibilling/bloc/data_bloc.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/components/contract_item.dart';
import 'package:ibilling/components/empty_indicator.dart';
import 'package:ibilling/pages/contracts/radio_filters.dart';
import 'package:ibilling/pages/contracts/calendar.dart';
import 'package:easy_localization/easy_localization.dart';

class PageContracts extends StatefulWidget {
  const PageContracts({Key? key}) : super(key: key);

  @override
  _PageContractsState createState() => _PageContractsState();
}

class _PageContractsState extends State<PageContracts> {
  @override
  Widget build(BuildContext context) {
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state -
        MediaQuery.of(context).viewInsets.top;
    return Container(
      child: Column(
        children: [
          Calendar(),
          SizedBox(
            height: heightQuery * 0.015,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: sizeQuery.width * 0.04, right: sizeQuery.width * 0.04),
              child: ListView.builder(
                  addAutomaticKeepAlives: true,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Container(
                            margin: EdgeInsets.only(top: heightQuery * 0.020),
                            width: sizeQuery.width * 0.9,
                            child: RadioFilters())
                        : Container(
                            padding: EdgeInsets.only(top: heightQuery * 0.012),
                            child: ContractItem());
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
