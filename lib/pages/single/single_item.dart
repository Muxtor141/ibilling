import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/components/contract_item.dart';
import 'package:ibilling/models/contract_model.dart';
import 'package:ibilling/pages/single/single_item_card.dart';
import 'package:ibilling/services/events_cubit.dart';
import 'package:ibilling/services/fetching/list_event.dart';
import 'package:ibilling/services/fetching/networking_bloc.dart';

class SingleItem extends StatefulWidget {
  final PageController controller;

  SingleItem({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  PreferredSizeWidget? appBar(ModelContract contract, BuildContext listContext,
      Size sizeQuery, BuildContext context1) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      leading: Icon(
        BillingIcons.document_filled,
        color: Color(0xff008F7F),
      ),
      actions: [
        IconButton(
            onPressed: () {
             
              listContext
                  .read<FetchDataBloc2>()
                  .add(UpdateSavedStatus(contract.contractNumber));
            },
            icon: contract.isSaved == false
                ? Icon(
                    BillingIcons.bookmark,
                    color: Colors.white,
                  )
                : Icon(
                    BillingIcons.bookmark_filled,
                    color: Colors.white,
                  )),
        SizedBox(
          width: sizeQuery.width * 0.0426,
        )
      ],
      title: Text(
        "№ ${contract.contractNumber}",
        style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state -
        MediaQuery.of(context).viewInsets.top;
    return BlocConsumer<FetchDataBloc2, List>(
      listener: (context, state) {},
      builder: (listContext, listState) {
        return BlocConsumer<CurrentSingleItemCubit, ModelContract>(
          listener: (context1, state1) {},
          builder: (context1, state) {
            return Scaffold(
                appBar:appBar(state, listContext, sizeQuery, context1),
                body: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: sizeQuery.width * 0.0426,
                            right: sizeQuery.width * 0.0426),
                        child: BlocConsumer<FetchSpecialDataBloc, List>(
                          listener: (c, state) {},
                          builder: (context2, state2) {
                            context2
                                .read<FetchSpecialDataBloc>()
                                .add(GetSpecificContract(state.name));
                            return ListView.builder(
                                itemCount: state2.length,
                                itemBuilder: (c, index) {
                                  ModelContract item = state2[index];
                                  return index == 0
                                      ? SingleItemCard(
                                          address: state.address,
                                          amount: state.amount,
                                          contractNumber: state.contractNumber,
                                          controller: widget.controller,
                                          inn: state.inn,
                                          invoices: state.invoices,
                                          lastinvoice: state.lastInvoice,
                                          name: state.name,
                                          status: state.status,
                                        )
                                      : Container(
                                          padding: EdgeInsets.only(
                                              top: heightQuery * 0.012),
                                          child: ContractItem(
                                              isSaved: item.isSaved,
                                              amount: item.amount,
                                              date: item.date,
                                              status: item.status,
                                              invoices: item.invoices,
                                              name: item.name,
                                              contractNumber:
                                                  item.contractNumber,
                                              lastInvoice: item.lastInvoice),
                                        );
                                });
                          },
                        ),
                      ),
                    ),
                  ],
                ));
          },
        );
      },
    );
  }
}
