import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/services/adding/add_data_bloc.dart';
import 'package:ibilling/services/adding/radio_cubit.dart';
import 'package:ibilling/services/events_cubit.dart';

class AddInvoice extends StatefulWidget {
  AddInvoice({Key? key}) : super(key: key);

  @override
  _AddInvoiceState createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  @override
  void dispose() {
    // TODO: implement dispose
    _status.dispose();
    _service.dispose();
    _name.dispose();
    _address.dispose();

    super.dispose();
  }

  final _bloc = CreateContractBloc();
  final _cubit = RadioStatus();
  final TextEditingController _status = TextEditingController();
  final TextEditingController _service = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();

  static const statusList = <String>[
    "Paid",
    "In process",
    "Rejected by Payme",
    "Rejected by IQ"
  ];

  BoxDecoration newDecoration = BoxDecoration(
      border: Border.all(color: Color(0x66F1F1F1)),
      borderRadius: BorderRadius.circular(4));
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
    String _statusValue = _cubit.state[1];
    _status.text = _bloc.state[1];
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
    var appBar = AppBar(
      backgroundColor: Theme.of(context).cardColor,
      leading: IconButton(
        icon: Image.asset(
          'assets/icons/logo.png',
          width: sizeQuery.width * 0.064,
        ),
        onPressed: () {},
      ),
      title: Text(
        'New Invoice',
        textAlign: TextAlign.start,
      ),
    );

    final List<PopupMenuItem<String>> _popUpMenuStatus = statusList
        .map((String element) => PopupMenuItem<String>(
            value: element,
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
                      groupValue: _statusValue,
                      onChanged: (String? newValue) {})
                ],
              ),
            )))
        .toList();

    return Scaffold(
      appBar: appBar,
      body: Container(
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
                  'Xizmat nomi',
                  style: style,
                ),
              ],
            ),
            textBottom,
            Container(
              decoration: newDecoration,
              height: heightQuery * 0.054,
              child: TextField(
                controller: _service,
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
              decoration: newDecoration,
              height: heightQuery * 0.054,
              child: TextField(
                controller: _name,
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
              decoration: newDecoration,
              height: heightQuery * 0.054,
              child: TextField(
                controller: _address,
                decoration: InputDecoration(
                  border: decoration,
                ),
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
                decoration: newDecoration,
                height: heightQuery * 0.054,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  readOnly: true,
                  controller: _status,
                  scrollPadding: EdgeInsets.only(bottom: 30),
                  decoration: InputDecoration(
                    border: decoration,
                    suffixIcon: PopupMenuButton(
                      onSelected: (String text) {
                        _bloc.add(SetPaidStatus(text));
                        Timer(Duration(milliseconds: 500), () {
                          _cubit.updateStatus(text);
                          _status.text = _bloc.state[1];
                        });
                      },
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
              child: Text('Save invoice',
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
