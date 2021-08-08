import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/components/contract_item.dart';
import 'package:ibilling/services/events_cubit.dart';
import 'package:easy_localization/easy_localization.dart';

class PageHistory extends StatefulWidget {
  const PageHistory({Key? key}) : super(key: key);

  @override
  _PageHistoryState createState() => _PageHistoryState();
}

class _PageHistoryState extends State<PageHistory> {
  TextStyle style = GoogleFonts.ubuntu(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: HexColor('#999999'));

  @override
  Widget build(BuildContext context) {
    final BoxDecoration box = BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).cardColor);
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state -
        MediaQuery.of(context).viewInsets.top -
        MediaQuery.of(context).viewInsets.bottom;
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
        'History',
        textAlign: TextAlign.start,
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: heightQuery * 0.015,
            ),
            Container(
              margin: EdgeInsets.only(bottom: heightQuery * 0.017),
              width: sizeQuery.width * 0.916,
              child: Text(
                'home.date'.tr(),
                style: style,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              child: Row(
                //main Row start
                children: [
                  SizedBox(
                    width: sizeQuery.width * 0.042,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 2),
                    decoration: box,
                    child: Row(
                      //startDate start
                      children: [
                        Text(
                          '16.02.2021',
                          style: style,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              BillingIcons.calendar,
                              size: 16,
                              color: HexColor('#DADADA'),
                            )),
                      ],
                    ), //startDate end
                  ),

                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      )),

                  Container(
                    padding: EdgeInsets.only(left: 5, right: 2),
                    decoration: box, //endDate start
                    child: Row(
                      children: [
                        Text(
                          '16.02.2021',
                          style: style,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            BillingIcons.calendar,
                            size: 16,
                            color: HexColor('#DADADA'),
                          ),
                        ),
                      ],
                    ),
                  ), //endDate end
                ],
              ),
            ),
            SizedBox(
              width: sizeQuery.width * 0.03,
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
                          contractNumber: 76,
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
