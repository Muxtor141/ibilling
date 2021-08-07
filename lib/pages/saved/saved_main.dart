import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/components/contract_item.dart';
import 'package:ibilling/services/events_cubit.dart';

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
              child: ListView.builder(
                  addAutomaticKeepAlives: true,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.only(
                            top: heightQuery * 0.012,
                            left: sizeQuery.width * 0.042,
                            right: sizeQuery.width * 0.042),
                        child: ContractItem(
                          date: DateTime.parse("2021-02-05 14:40:00"),
                          status: "Rejected by Payme",
                          contractNumber: 283,
                          amount: "1,200,200 UZS",
                          invoices: 4,
                          lastInvoice: 143,
                          name: "Umida Azizova",
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
