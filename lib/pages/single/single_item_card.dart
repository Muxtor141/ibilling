import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/pages/single/delete_dialog.dart';
import 'package:ibilling/services/events_cubit.dart';

class SingleItemCard extends StatefulWidget {
  SingleItemCard({Key? key}) : super(key: key);

  @override
  _SingleItemCardState createState() => _SingleItemCardState();
}

class _SingleItemCardState extends State<SingleItemCard> {
  @override
  Widget build(BuildContext context) {
    final TextStyle style = GoogleFonts.ubuntu(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: HexColor('#E7E7E7'));
    final TextStyle styleGrey = GoogleFonts.ubuntu(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: HexColor('#999999'));
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state -
        MediaQuery.of(context).viewInsets.top;
    var space = SizedBox(
      height: heightQuery * 0.0147,
    );

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: heightQuery * 0.0245,
          ),
          Container(
            padding: EdgeInsets.only(left: sizeQuery.width * 0.0535),
            height: heightQuery * 0.35,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightQuery * 0.017,
                ),
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(text: "Fisher's full name:  ", style: style),
                      TextSpan(text: "Yoldosheva Ziyoda", style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(text: "Status of the contract:  ", style: style),
                      TextSpan(text: "Rejected by Payme", style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(text: "Amount:  ", style: style),
                      TextSpan(text: "1,200,000 UZS", style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(text: "Last invoice:  ", style: style),
                      TextSpan(text: "№ 256", style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(text: "Number of invoices:  ", style: style),
                      TextSpan(text: "№ 256", style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 3,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Address of organization:  ", style: style),
                      TextSpan(
                          text:
                              "Very long name of our clien's address may break this line ,but it shouldn't be like this then then then then ten",
                          style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "ITN/IEC of organization:  ", style: style),
                      TextSpan(text: "23534353233", style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(text: "Created at:  ", style: style),
                      TextSpan(text: "14:28,2 February,2021", style: styleGrey),
                    ])),
              ],
            ),
          ),
          SizedBox(
            height: heightQuery * 0.0245,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: heightQuery * 0.058,
                    child: MaterialButton(
                      onPressed: () {
                        showDialog(
                            barrierColor: Color(0xE6000000),
                            context: context,
                            builder: (BuildContext c) {
                              return DeleteDialog();
                            });
                      },
                      child: Text(
                        'Delete contract',
                        style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFF426D)),
                      ),
                      color: Color(0x40FF426D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeQuery.width * 0.0426,
                ),
                Expanded(
                  child: Container(
                    height: heightQuery * 0.058,
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Create contract',
                        style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFDFDFD)),
                      ),
                      color: Color(0xFF008F7F),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: heightQuery * 0.049,
          ),
          Row(
            children: [
              Text(
                'Other contracts with \n Yoldosheva Feruza',
                style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFE7E7E7)),
              ),
            ],
          ),
          SizedBox(
            height: heightQuery * 0.01,
          )
        ],
      ),
    );
  }
}
