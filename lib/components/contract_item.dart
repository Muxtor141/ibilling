import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/components/billing_icons_icons.dart';

class ContractItem extends StatelessWidget {
  final String name;
  final String amount;
  final int invoices;
  final int lastInvoice;
  final int contractNumber;
  final DateTime date;
  final String status;
  const ContractItem(
      {Key? key,
      required this.amount,
      required this.date,
      required this.status,
      required this.invoices,
      required this.name,
      required this.contractNumber,
      required this.lastInvoice})
      : super(key: key);

  Color getTextColor() {
    if (status == "Rejected by IQ") {
      return Color(0xFFF85379);
    }
    if (status == "In Process") {
      return Color(0xFFFDAB2A);
    }
    if (status == "Rejected by Payme") {
      return Color(0xFFFF426D);
    } else {
      return Color(0xFF49B7A5);
    }
  }

  Color getBoxColor() {
    if (status == "Rejected by IQ") {
      return Color(0x26F85379);
    }
    if (status == "In Process") {
      return Color(0x26FDAB2A);
    }
    if (status == "Rejected by Payme") {
      return Color(0x26FF426D);
    } else {
      return Color(0x2649B7A5);
    }
  }

  @override
  Widget build(BuildContext context) {
    var rDate = date;
    var day = rDate.day < 10 ? "   0${rDate.day}" : rDate.day;
    var month = rDate.month < 10 ? "0" + rDate.month.toString() : rDate.month;
    double textSize = 14;
    double spaceBetween = 0.007;
    final sizeQuery = MediaQuery.of(context).size;
    TextStyle dataStyle = GoogleFonts.ubuntu(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontStyle: FontStyle.normal,
        color: HexColor('#999999'));
    TextStyle localStyle = GoogleFonts.ubuntu(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        fontStyle: FontStyle.normal,
        color: HexColor('#E7E7E7'));
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(6)),
      width: sizeQuery.width * 0.93,
      height: sizeQuery.height * 0.18,
      padding: EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 13),
      child: Column(
        children: [
          SizedBox(
            height: sizeQuery.height * 0.008,
          ),
          Row(
            children: [
              Icon(
                BillingIcons.paper,
                size: 20,
                color: HexColor('#00A795'),
              ),
              SizedBox(
                width: sizeQuery.width * 0.012,
              ),
              Text(
                '№ $contractNumber',
                style: localStyle,
              ),
              Spacer(),
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: getBoxColor(),
                ),
                child: Text(
                  'filter.${status.toLowerCase().replaceAll(" ", "")}'.tr(),
                  style: TextStyle(fontSize: textSize, color: getTextColor()),
                ),
              ),
              SizedBox(
                width: sizeQuery.width * 0.032,
              )
            ],
          ),
          SizedBox(
            height: sizeQuery.height * 0.016,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "${"contractItem.name".tr()}:  ",
                      style: localStyle),
                  TextSpan(
                    text: name,
                    style: dataStyle,
                  ),
                ]),
              )
            ],
          ),
          SizedBox(
            height: sizeQuery.height * spaceBetween,
          ),
          Container(
            width: sizeQuery.width * 0.9,
            child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(
                    text: "${"contractItem.amount".tr()}:  ",
                    style: localStyle,
                  ),
                  TextSpan(
                    text: amount,
                    style: dataStyle,
                  ),
                ])),
          ),
          SizedBox(
            height: sizeQuery.height * spaceBetween,
          ),
          Container(
            width: sizeQuery.width * 0.914,
            child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(
                    text: "${"contractItem.invoice".tr()}:  ",
                    style: localStyle,
                  ),
                  TextSpan(
                    text: "№ $lastInvoice",
                    style: dataStyle,
                  ),
                ])),
          ),
          SizedBox(
            height: sizeQuery.height * spaceBetween,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "${"contractItem.invoices".tr()}:  ",
                    style: localStyle,
                  ),
                  TextSpan(
                    text: invoices.toString(),
                    style: dataStyle,
                  ),
                ]),
              ),
              SizedBox(
                width: sizeQuery.width * 0.25,
              ),
              Text(
                "$day.$month.${rDate.year}",
                style: dataStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
