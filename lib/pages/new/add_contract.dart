import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/bloc/data_bloc.dart';
import 'package:ibilling/components/billing_icons_icons.dart';

class AddContract extends StatefulWidget {
  AddContract({Key? key}) : super(key: key);

  @override
  _AddContractState createState() => _AddContractState();
}

class _AddContractState extends State<AddContract> {
  String _statusRadioValue = "Paid";
  String _inRadioValue = "Paid";

  static const shaxsList = <String>[
    "Jismoniy shaxs",
    "Yuridik shaxs",
  ];

  static const statusList = <String>[
    "Paid",
    "In process",
    "Rejected by Payme",
    "Rejected by IQ"
  ];

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

    final List<PopupMenuItem<String>> _popUpMenu = shaxsList
        .map((String element) => PopupMenuItem<String>(
                child: Container(
              width: sizeQuery.width,
              child: Row(
                children: [
                  Text(
                    element,
                    style: styleWhite,
                  ),
                  Spacer(),
                  Radio(
                      value: element,
                      groupValue: _inRadioValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          _inRadioValue = newValue!;
                        });
                      })
                ],
              ),
            )))
        .toList();
    final List<PopupMenuItem<String>> _popUpMenuStatus = statusList
        .map((String element) => PopupMenuItem<String>(
                child: Container(
              width: sizeQuery.width,
              child: Row(
                children: [
                  Text(
                    element,
                    style: styleWhite,
                  ),
                  Spacer(),
                  Radio(
                      value: element,
                      groupValue: _statusRadioValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          _statusRadioValue = newValue!;
                        });
                      })
                ],
              ),
            )))
        .toList();

    return Container(
      color: Theme.of(context).cardColor,
      padding: EdgeInsets.only(
          left: sizeQuery.width * 0.0426, right: sizeQuery.width * 0.0426),
      child: SingleChildScrollView(
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
                suffixIcon: PopupMenuButton(
                  offset: Offset(0, 40.0),
                  icon: Icon(
                    BillingIcons.arrow_down_circle,
                    color: Color(0x66F1F1F1),
                  ),
                  itemBuilder: (BuildContext context) {
                    return _popUpMenu;
                  },
                ),
              )),
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
            Row(
              children: [
                Text(
                  'INN',
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
                        BillingIcons.question_mark,
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
                  'Status of contract',
                  style: style,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            textBottom,
            Container(
                height: heightQuery * 0.054,
                child: TextField(
                  scrollPadding: EdgeInsets.only(bottom: 30),
                  decoration: InputDecoration(
                    border: decoration,
                    suffixIcon: PopupMenuButton(
                      offset: Offset(0, 40.0),
                      icon: Icon(
                        BillingIcons.arrow_down_circle,
                        color: Color(0x66F1F1F1),
                      ),
                      itemBuilder: (BuildContext context) {
                        return _popUpMenuStatus;
                      },
                    ),
                  ),
                )),
            textTop,
            textBottom,
            MaterialButton(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              onPressed: () {},
              child: Text('Save contract',
                  style: GoogleFonts.ubuntu(
                      color: HexColor('#FDFDFD'),
                      fontWeight: FontWeight.w500,
                      fontSize: 16)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              color: HexColor('#008F7F'),
              minWidth: sizeQuery.width * 0.94,
            )
          ],
        ),
      ),
    );
  }
}
