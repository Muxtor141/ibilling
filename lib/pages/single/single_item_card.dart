import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/pages/single/delete_dialog.dart';
import 'package:ibilling/services/events_cubit.dart';
import 'package:ibilling/services/fetching/networking_bloc.dart';

class SingleItemCard extends StatefulWidget {
  final PageController controller;
  final String name;
  final String amount;
  final String address;
  final int lastinvoice;
  final int invoices;
  final String inn;
  final String status;
  final int contractNumber;
  SingleItemCard(
      {Key? key,
      required this.controller,
      required this.address,
      required this.inn,
      required this.amount,
      required this.contractNumber,
      required this.invoices,
      required this.lastinvoice,
      required this.name,
      required this.status})
      : super(key: key);

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
                      TextSpan(
                          text: "${"contractItem.name".tr()}:  ", style: style),
                      TextSpan(text: widget.name, style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${"contractItem.status".tr()}:  ",
                          style: style),
                      TextSpan(text: widget.status, style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${"contractItem.amount".tr()}:  ",
                          style: style),
                      TextSpan(text: widget.amount, style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${"contractItem.invoice".tr()}:  ",
                          style: style),
                      TextSpan(
                          text: widget.lastinvoice.toString(),
                          style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${"contractItem.invoices".tr()}:  ",
                          style: style),
                      TextSpan(
                          text: widget.invoices.toString(), style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 3,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${"contractItem.address".tr()}:  ",
                          style: style),
                      TextSpan(text: widget.address, style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${"newContract.INT".tr()}:  ", style: style),
                      TextSpan(text: widget.inn.toString(), style: styleGrey),
                    ])),
                space,
                RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${"contractItem.created".tr()}:  ",
                          style: style),
                      TextSpan(text: "14:28,2 February,2021", style: styleGrey),
                    ])),
              ],
            ),
          ),
          SizedBox(
            height: heightQuery * 0.0245,
          ),
          BlocConsumer<FetchDataBloc2, List>(
            listener: (c, s) {},
            builder: (context2, state) {
              return Container(
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
                                  return DeleteDialog(
                                    context3: context2,
                                    contractIndex: widget.contractNumber,
                                    controller: widget.controller,
                                  );
                                });
                          },
                          child: Text(
                            'contractItem.delete'.tr(),
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
                            'contractItem.create'.tr(),
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
              );
            },
          ),
          SizedBox(
            height: heightQuery * 0.049,
          ),
          Row(
            children: [
              Text(context.locale==Locale('uz','UZ')?
                '${ widget.name}${'contractItem.extra'.tr()}': '${'contractItem.extra'.tr()}${ widget.name}',
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
