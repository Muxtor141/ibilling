import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/components/contract_item.dart';
import 'package:ibilling/services/events_cubit.dart';
import 'package:ibilling/services/fetching/networking_bloc.dart';

class PageSaved extends StatefulWidget {
  const PageSaved({Key? key}) : super(key: key);

  @override
  _PageSavedState createState() => _PageSavedState();
}

class _PageSavedState extends State<PageSaved> {
  TextStyle style = GoogleFonts.ubuntu(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: HexColor('#999999'));

  @override
  Widget build(BuildContext context) {
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state +
        MediaQuery.of(context).viewInsets.top;

    var appBar = AppBar(
      actions: [
        IconButton(
          onPressed: () {},
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
      backgroundColor: Theme.of(context).cardColor,
      leading: IconButton(
        icon: Image.asset(
          'assets/icons/logo.png',
          width: sizeQuery.width * 0.064,
        ),
        onPressed: () {},
      ),
      title: Text(
        'Saved',
        textAlign: TextAlign.start,
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: sizeQuery.width * 0.04,
            ),
            Expanded(
              child: BlocConsumer<FetchDataBloc2, List>(
                listener: (c, s) {},
                builder: (context1, state) {
                  var list = context1.read<FetchDataBloc2>().getSavedContract();

                  return ListView.builder(
                      addAutomaticKeepAlives: true,
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.only(
                                top: heightQuery * 0.012,
                                left: sizeQuery.width * 0.042,
                                right: sizeQuery.width * 0.042),
                            child: ContractItem(
                              isSaved: list[index].isSaved,
                              date: list[index].date,
                              status: list[index].status,
                              contractNumber: list[index].contractNumber,
                              amount: list[index].amount,
                              invoices: list[index].invoices,
                              lastInvoice: list[index].lastInvoice,
                              name: list[index].name,
                            ));
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
