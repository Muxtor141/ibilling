import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/services/adding/add_data_bloc.dart';
import 'package:ibilling/services/adding/radio_cubit.dart';
import 'package:ibilling/services/events_cubit.dart';

class AddContract extends StatefulWidget {
  AddContract({Key? key}) : super(key: key);

  @override
  _AddContractState createState() => _AddContractState();
}

class _AddContractState extends State<AddContract> {
  final _bloc = CreateContractBloc();
  final _cubit = RadioStatus();
  final TextEditingController _individual = TextEditingController();
  final TextEditingController _status = TextEditingController();
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
      color: Colors.grey,
    ),
  );
  BoxDecoration newDecoration = BoxDecoration(
      border: Border.all(color: Color(0x66F1F1F1)),
      borderRadius: BorderRadius.circular(4));

  @override
  Widget build(BuildContext context) {
    String _individualValue = _cubit.state[0];
    String _statusValue = _cubit.state[1];
    final sizeQuery = MediaQuery.of(context).size;
    _individual.text = _bloc.state[0];
    _status.text = _bloc.state[1];

    final List<PopupMenuItem<String>> _popUpMenu = shaxsList
        .map((String element) => PopupMenuItem<String>(
            value: element,
            child: GestureDetector(
              onTap: () {},
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
                        groupValue: _individualValue,
                        onChanged: (String? newValue) {})
                  ],
                ),
              ),
            )))
        .toList();

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
        'New Contract',
        textAlign: TextAlign.start,
      ),
    );
    final heightQuery = sizeQuery.height -
        appBar.preferredSize.height +
        MediaQuery.of(context).viewInsets.top;
    var textBottom = SizedBox(
      height: heightQuery * 0.0073,
    );
    var textTop = SizedBox(
      height: heightQuery * 0.0196,
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
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
                decoration: newDecoration,
                height: heightQuery * 0.054,
                child: TextFormField(
                    readOnly: true,
                    style: TextStyle(color: Colors.white),
                    controller: _individual,
                    decoration: InputDecoration(
                      border: decoration,
                      suffixIcon: PopupMenuButton(
                        onSelected: (String name) {
                          _bloc.add(SetPersonStatus(name));
                          Timer(Duration(milliseconds: 500), () {
                            _cubit.updateIndividual(name);
                            print(_cubit.state.toString());
                            _individual.text = _bloc.state[0];
                          });
                        },
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
                decoration: newDecoration,
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
                decoration: newDecoration,
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
                decoration: newDecoration,
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
      ),
    );
  }
}
