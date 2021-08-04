import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/bloc/data_bloc.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/pages/new/creating_dialog.dart';

class AddInvoice extends StatefulWidget {
  AddInvoice({Key? key}) : super(key: key);

  @override
  _AddInvoiceState createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  final TextStyle style = GoogleFonts.ubuntu(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: HexColor('#66F1F1F1'));
  final TextStyle styleWhite = GoogleFonts.ubuntu(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: HexColor('#E7E7E7'));
  OutlineInputBorder decoration = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(
      width: 1,
      color: HexColor('#66F1F1F1'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state +
        MediaQuery.of(context).viewInsets.top;
    var textBottom = SizedBox(
      height: heightQuery * 0.0073,
    );
    var textTop = SizedBox(
      height: heightQuery * 0.0196,
    );

    return Container(
      color: Theme.of(context).cardColor,
      padding: EdgeInsets.only(
          left: sizeQuery.width * 0.0426, right: sizeQuery.width * 0.0426),
      child: Column(
        children: [
          SizedBox(
            height: heightQuery * 0.0245,
          ),
          Row(
            children: [
              Text(
                'Individual',
                style: style,
              ),
            ],
          ),
          textBottom,
          Container(
            height: heightQuery * 0.054,
            child: TextField(
              decoration: InputDecoration(
                  border: decoration,
                  suffixIcon: IconButton(
                    icon: Icon(
                      BillingIcons.arrow_down_circle,
                      color: HexColor('#66F1F1F1'),
                    ),
                    onPressed: () {},
                  )),
            ),
          ),
          textTop,
          Row(
            children: [
              Text(
                'Fisher\'s full name',
                style: style,
              ),
            ],
          ),
          textBottom,
          Container(
            height: heightQuery * 0.054,
            child: TextField(
              decoration: InputDecoration(
                border: decoration,
              ),
            ),
          ),
          textTop,
          Row(
            children: [
              Text(
                'Address of organization',
                style: style,
              ),
            ],
          ),
          textBottom,
          Container(
            height: heightQuery * 0.054,
            child: TextField(
              decoration: InputDecoration(
                border: decoration,
              ),
            ),
          ),
          textTop,
          textBottom,
          MaterialButton(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            onPressed: () {
              showDialog(
                  barrierColor: Color(0xCC0C0C0C).withOpacity(0.8),
                  context: context,
                  builder: (c) {
                    return CreateDialog();
                  });
            },
            child: Text('Save invoice',
                style: GoogleFonts.ubuntu(
                    color: HexColor('#FDFDFD'),
                    fontWeight: FontWeight.w500,
                    fontSize: 16)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: HexColor('#008F7F'),
            minWidth: sizeQuery.width * 0.94,
          )
        ],
      ),
    );
  }
}
