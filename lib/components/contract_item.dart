import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';

class ContractItem extends StatelessWidget {
  const ContractItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                '№ 256',
                style: localStyle,
              ),
              Spacer(),
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: HexColor('#2649B7A5'),
                ),
                child: Text(
                  'Rejected by Payme',
                  style:
                      TextStyle(fontSize: textSize, color: HexColor('#49B7A5')),
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
                  TextSpan(text: "Fish:  ", style: localStyle),
                  TextSpan(
                    text: "Yoldosheva Ziyoda",
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
                    text: "Amount:  ",
                    style: localStyle,
                  ),
                  TextSpan(
                    text: "2,200,000 UZS",
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
                    text: "Last invoice:  ",
                    style: localStyle,
                  ),
                  TextSpan(
                    text: "№ 256",
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
                    text: "Number of invoices:  ",
                    style: localStyle,
                  ),
                  TextSpan(
                    text: "20",
                    style: dataStyle,
                  ),
                ]),
              ),
              SizedBox(
                width: sizeQuery.width * 0.25,
              ),
              Text(
                '30.01.2021',
                style: dataStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
