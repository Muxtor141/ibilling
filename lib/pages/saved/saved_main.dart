import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/bloc/data_bloc.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/components/contract_item.dart';

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
    final BoxDecoration box = BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).cardColor);
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state +
        MediaQuery.of(context).viewInsets.top;

    return Container(
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
                      child: ContractItem());
                }),
          ),
        ],
      ),
    );
    ;
  }
}
