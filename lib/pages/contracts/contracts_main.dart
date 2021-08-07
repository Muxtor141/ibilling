import 'package:flutter/material.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/components/contract_item.dart';
import 'package:ibilling/components/empty_indicator.dart';
import 'package:ibilling/pages/contracts/radio_filters.dart';
import 'package:ibilling/pages/contracts/calendar.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/services/date/date_bloc.dart';
import 'package:ibilling/services/date/date_event.dart';
import 'package:ibilling/services/events_cubit.dart';
import 'package:ibilling/services/fetching/list_event.dart';
import 'package:ibilling/services/fetching/networking_bloc.dart';

class PageContracts extends StatefulWidget {
  final AsyncSnapshot snapshot;
  final DateUpdateBloc bloc;
  final PageController controller;

  const PageContracts(
      {Key? key,
      required this.controller,
      required this.snapshot,
      required this.bloc})
      : super(key: key);

  @override
  _PageContractsState createState() => _PageContractsState();
}

class _PageContractsState extends State<PageContracts> {
  final _bloc = FetchDataBloc();

  @override
  void initState() {
    // TODO: implement initState
    _bloc.listUpdateEvent.add(GetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubitData = DataProvider();
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
      body: Container(
        child: Column(
          children: [
            Calendar(
              snapshot: widget.snapshot,
              dateUpdatebloc: widget.bloc,
              listUpdateBloc: _bloc,
            ),
            SizedBox(
              height: heightQuery * 0.015,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    left: sizeQuery.width * 0.04,
                    right: sizeQuery.width * 0.04),
                child: StreamBuilder(
                  stream: _bloc.updater,
                  initialData: _bloc.contractList,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Container(
                      child: (snapshot.data.isNotEmpty
                          ? ListView.builder(
                              addAutomaticKeepAlives: true,
                              shrinkWrap: true,
                              itemCount: (snapshot.data.length) + 1,
                              itemBuilder: (context, index) {
                                return index == 0
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            top: heightQuery * 0.020),
                                        width: sizeQuery.width * 0.9,
                                        child: RadioFilters())
                                    : Container(
                                        padding: EdgeInsets.only(
                                            top: heightQuery * 0.012),
                                        child: ContractItem(
                                          status:
                                              snapshot.data[index - 1].status,
                                          date: snapshot.data[index - 1].date,
                                          contractNumber: snapshot
                                              .data[index - 1].contractNumber,
                                          amount:
                                              snapshot.data[index - 1].amount,
                                          invoices:
                                              snapshot.data[index - 1].invoices,
                                          lastInvoice: snapshot
                                              .data[index - 1].lastInvoice,
                                          name: snapshot.data[index - 1].name,
                                        ));
                              })
                          : Center(
                              child: EmptyIndicator(
                                  icon: BillingIcons.document_filled,
                                  textType: "No conracts are made yet"),
                            )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
