import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/components/contract_item.dart';
import 'package:ibilling/components/empty_indicator.dart';
import 'package:ibilling/models/contract_model.dart';
import 'package:ibilling/pages/contracts/radio_filters.dart';
import 'package:ibilling/pages/contracts/calendar.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/services/date/date_bloc.dart';

import 'package:ibilling/services/events_cubit.dart';

import 'package:ibilling/services/fetching/networking_bloc.dart';

class PageContracts extends StatefulWidget {
  final PageController controller;

  const PageContracts({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _PageContractsState createState() => _PageContractsState();
}

class _PageContractsState extends State<PageContracts> {
  final cubitData = DataProvider();

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state -
        MediaQuery.of(context).viewInsets.top;
    var appBar = AppBar(
      actions: [
        IconButton(
          onPressed: () {
            widget.controller.jumpToPage(6);
          },
          icon: Icon(BillingIcons.filter),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30,
          ),
        )
      ],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
        icon: Image.asset(
          'assets/icons/logo.png',
          width: sizeQuery.width * 0.064,
        ),
        onPressed: () {},
      ),
      title: Text(
        'home.contracts'.tr(),
        textAlign: TextAlign.start,
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: BlocConsumer<FetchDataBloc2, List>(
        listener: (context, state) {},
        builder: (context, list) {
          var snapshot = list;
          return Container(
            child: Column(
              children: [
                Calendar(
                  context1: context,
                ),
                SizedBox(
                  height: heightQuery * 0.015,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: sizeQuery.width * 0.04,
                        right: sizeQuery.width * 0.04),
                    // child: StreamBuilder(
                    //   stream: _bloc.updater,
                    //   initialData: _bloc.contractList,
                    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                    //     return Container(
                    child: (snapshot.isNotEmpty
                        ? ListView.builder(
                            addAutomaticKeepAlives: true,
                            shrinkWrap: true,
                            itemCount: (snapshot.length) + 1,
                            itemBuilder: (context, index) {
                              return index == 0
                                  ? Container(
                                      margin: EdgeInsets.only(
                                          top: heightQuery * 0.020),
                                      width: sizeQuery.width * 0.9,
                                      child: RadioFilters())
                                  : BlocConsumer<CurrentSingleItemCubit,
                                      ModelContract>(
                                      listener: (c, state) {},
                                      builder: (context2, state) {
                                        return GestureDetector(
                                          onTap: () {
                                            context2
                                                .read<CurrentSingleItemCubit>()
                                                .updateSingleItem(
                                                    snapshot[index - 1]);
                                            Timer(Duration(milliseconds: 200),
                                                () {
                                              widget.controller.jumpToPage(5);
                                            });
                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                  top: heightQuery * 0.012),
                                              child: ContractItem(
                                                status:
                                                    snapshot[index - 1].status,
                                                date: snapshot[index - 1].date,
                                                contractNumber:
                                                    snapshot[index - 1]
                                                        .contractNumber,
                                                amount:
                                                    snapshot[index - 1].amount,
                                                invoices: snapshot[index - 1]
                                                    .invoices,
                                                lastInvoice: snapshot[index - 1]
                                                    .lastInvoice,
                                                name: snapshot[index - 1].name,
                                              )),
                                        );
                                      },
                                    );
                            })
                        : Center(
                            child: EmptyIndicator(
                                icon: BillingIcons.document_filled,
                                textType: "No conracts are made yet"),
                          )),
                  ),
                  //   },
                  // ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
