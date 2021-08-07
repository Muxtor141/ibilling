import 'package:flutter/material.dart';
import 'package:ibilling/components/contract_item.dart';
import 'package:ibilling/pages/single/single_item_card.dart';
import 'package:ibilling/services/events_cubit.dart';

class SingleItem extends StatefulWidget {
  SingleItem({Key? key}) : super(key: key);

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  @override
  Widget build(BuildContext context) {
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state -
        MediaQuery.of(context).viewInsets.top;
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
                left: sizeQuery.width * 0.0426,
                right: sizeQuery.width * 0.0426),
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (c, index) {
                  return index == 0
                      ? SingleItemCard()
                      : Container(
                          margin: EdgeInsets.only(top: heightQuery * 0.0147),
                          child: ContractItem(
                            date: DateTime.parse("2021-02-05 14:40:00"),
                            status: "Rejected by Payme",
                            contractNumber: 179,
                            amount: "1,200,200 UZS",
                            invoices: 4,
                            lastInvoice: 143,
                            name: "Umida Azizova",
                          ));
                }),
          ),
        ),
      ],
    );
  }
}
