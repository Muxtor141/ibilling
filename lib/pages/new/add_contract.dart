import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/models/contract_model.dart';
import 'package:ibilling/pages/new/simple_textfield.dart';
import 'package:ibilling/pages/new/special_textfield.dart';
import 'package:ibilling/services/adding/add_data_bloc.dart';
import 'package:ibilling/services/adding/radio_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/services/fetching/list_event.dart';
import 'package:ibilling/services/fetching/networking_bloc.dart';

class AddContract extends StatefulWidget {
  final PageController controller;
  AddContract({Key? key, required this.controller}) : super(key: key);

  @override
  _AddContractState createState() => _AddContractState();
}

class _AddContractState extends State<AddContract> {
  @override
  void dispose() {
    // TODO: implement dispose
    _cIndividual.dispose();
    _cStatus.dispose();
    _cAddres.dispose();
    _cName.dispose();
    _cInn.dispose();

    super.dispose();
  }

  final _bloc = CreateContractBloc();
  final _cubit = RadioStatus();
  final TextEditingController _cIndividual = TextEditingController();
  final TextEditingController _cStatus = TextEditingController();
  final TextEditingController _cAddres = TextEditingController();
  final TextEditingController _cName = TextEditingController();
  final TextEditingController _cInn = TextEditingController();
  final TextEditingController _cAmount = TextEditingController();
  final _formKeyIndividual = GlobalKey<FormState>();
  final _formKeyStatus = GlobalKey<FormState>();
  final _formKeyAmount = GlobalKey<FormState>();
  final _formKeyName = GlobalKey<FormState>();
  final _formKeyInn = GlobalKey<FormState>();
  final _formKeyAdress = GlobalKey<FormState>();

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

  String? formValidate(String? text) {
    if (text == null || text.isEmpty) {
      return "Please fill this field";
    } else {
      return null;
    }
  }

  String? specialFormValidate(String? text) {
    if (text == null || text.isEmpty) {
      return "Please select one of the choices";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    String _individualValue = _cubit.state[0];
    String _statusValue = _cubit.state[1];
    final sizeQuery = MediaQuery.of(context).size;
    _cIndividual.text = _bloc.state[0];
    _cStatus.text = _bloc.state[1];

    final List<PopupMenuItem<String>> _popUpMenu = shaxsList
        .map(
          (String element) => PopupMenuItem<String>(
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
                      groupValue: _individualValue,
                      onChanged: (String? newValue) {})
                ],
              ),
            ),
          ),
        )
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
        'newContract.newContract'.tr(),
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
    print('ADD CONTRACTS BUILD');

    bool validateAllFields() {
      List<bool> validatesList = [
        _formKeyAdress.currentState!.validate(),
        _formKeyAmount.currentState!.validate(),
        _formKeyName.currentState!.validate(),
        _formKeyInn.currentState!.validate(),
        _formKeyIndividual.currentState!.validate(),
        _formKeyStatus.currentState!.validate(),
      ];
      int validIndex = 0;
      for (var element in validatesList) {
        if (element) {
          validIndex++;
        }
      }
      if (validIndex == 6) {
        print("ALL ARE VALID");
        return true;
      } else {
        print("NOT VALID");
        return false;
      }
    }

    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Colors.black,
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
                    'newContract.invididual'.tr(),
                    style: style,
                  ),
                ],
              ),
              textBottom,
              ModalTextField(
                  formKey: _formKeyIndividual,
                  function: specialFormValidate,
                  bloc: _bloc,
                  cubit: _cubit,
                  appbar: appBar,
                  eventIndex: 0,
                  menu: _popUpMenu,
                  textController: _cIndividual),
              textTop,
              Row(
                children: [
                  Text(
                    'newContract.name'.tr(),
                    style: style,
                  ),
                ],
              ),
              textBottom,
              SimpleTextField(
                  formKey: _formKeyName,
                  function: formValidate,
                  appBar: appBar,
                  icon: BillingIcons.stroke,
                  controller: _cName),
              textTop,
              Row(
                children: [
                  Text(
                    'contractItem.amount'.tr(),
                    style: style,
                  ),
                ],
              ),
              textBottom,
              SimpleTextField(
                  formKey: _formKeyAmount,
                  function: formValidate,
                  appBar: appBar,
                  icon: BillingIcons.stroke,
                  controller: _cAmount),
              textTop,
              Row(
                children: [
                  Text(
                    'newContract.address'.tr(),
                    style: style,
                  ),
                ],
              ),
              textBottom,
              SimpleTextField(
                  formKey: _formKeyAdress,
                  function: formValidate,
                  appBar: appBar,
                  icon: BillingIcons.stroke,
                  controller: _cAddres),
              textTop,
              Row(
                children: [
                  Text(
                    'newContract.INT'.tr(),
                    style: style,
                  ),
                ],
              ),
              textBottom,
              SimpleTextField(
                  formKey: _formKeyInn,
                  function: formValidate,
                  appBar: appBar,
                  icon: BillingIcons.question_mark,
                  controller: _cInn),
              textTop,
              Row(
                children: [
                  Text(
                    'newContract.status'.tr(),
                    style: style,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              textBottom,
              ModalTextField(
                  formKey: _formKeyStatus,
                  function: specialFormValidate,
                  bloc: _bloc,
                  cubit: _cubit,
                  appbar: appBar,
                  eventIndex: 1,
                  menu: _popUpMenuStatus,
                  textController: _cStatus),
              textTop,
              textBottom,
              BlocConsumer<FetchDataBloc2, List>(
                listener: (c, list) {},
                builder: (context1, list) {
                  return MaterialButton(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    onPressed: () {
                      if (validateAllFields()) {
                        context1.read<FetchDataBloc2>().add(AddContractEvent(
                            ModelContract(
                                DateTime.now(),
                                8,
                                false,
                                _cName.text,
                                _cStatus.text,
                                _cAddres.text,
                                _cAmount.text,
                                _cAmount.text,
                                132,
                                54)));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("newContract.added".tr()),
                          duration: Duration(milliseconds: 1000),
                        ));
                        Timer(Duration(milliseconds: 1000), () {
                          widget.controller.jumpTo(0);
                        });
                      }
                    },
                    child: Text('newContract.addContract'.tr(),
                        style: GoogleFonts.ubuntu(
                            color: HexColor('#FDFDFD'),
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: HexColor('#008F7F'),
                    minWidth: sizeQuery.width * 0.94,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
