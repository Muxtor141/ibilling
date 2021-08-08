import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/services/events_cubit.dart';
import 'package:easy_localization/easy_localization.dart';

class CreateDialogNew extends StatelessWidget {
  final PageController ctr;

  CreateDialogNew({Key? key, required this.ctr}) : super(key: key);

  final style = GoogleFonts.ubuntu(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      color: HexColor('#E7E7E7'));

  BoxDecoration deco = BoxDecoration(
      color: HexColor('#664E4E4E'), borderRadius: BorderRadius.circular(4));
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final cubitData = DataProvider();
    final heightQuery = sizeQuery.height -
        cubitData.state +
        MediaQuery.of(context).viewInsets.top;
    return AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        'newContract.create'.tr(),
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
      ),
      backgroundColor: Theme.of(context).cardColor,
      content: Container(
        height: heightQuery * 0.128,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                ctr.jumpToPage(2);
              },
              child: Container(
                height: heightQuery * 0.0565,
                width: sizeQuery.width * 0.76,
                decoration: deco,
                child: Row(
                  children: [
                    SizedBox(
                      width: sizeQuery.width * 0.058,
                    ),
                    Icon(
                      BillingIcons.document_filled,
                      color: HexColor('#00A795'),
                    ),
                    SizedBox(
                      width: sizeQuery.width * 0.04,
                    ),
                    Text(
                      'contracts.contracts'.tr(),
                      style: style,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: heightQuery * 0.0147,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                ctr.jumpToPage(7);
              },
              child: Container(
                height: heightQuery * 0.0565,
                width: sizeQuery.width * 0.76,
                decoration: deco,
                child: Row(
                  children: [
                    SizedBox(
                      width: sizeQuery.width * 0.058,
                    ),
                    Icon(
                      BillingIcons.document_filled,
                      color: HexColor('#00A795'),
                    ),
                    SizedBox(
                      width: sizeQuery.width * 0.04,
                    ),
                    Text(
                      'contracts.invoiceBt'.tr(),
                      style: style,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // bloc
  }
}
