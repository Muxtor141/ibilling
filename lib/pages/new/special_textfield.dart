import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/services/adding/add_data_bloc.dart';
import 'package:ibilling/services/adding/radio_cubit.dart';


class ModalTextField extends StatefulWidget {
  final AppBar appbar;
  final BuildContext cubit;
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? function;
  final CreateContractBloc bloc;
  final List<PopupMenuItem<String>> menu;
  final int eventIndex;
  final TextEditingController textController;
  ModalTextField(
      {Key? key,
      required this.cubit,
      required this.formKey,
      required this.function,
      required this.bloc,
      required this.appbar,
      required this.eventIndex,
      required this.menu,
      required this.textController})
      : super(key: key);

  @override
  _ModalTextFieldState createState() => _ModalTextFieldState();
}

class _ModalTextFieldState extends State<ModalTextField> {
  OutlineInputBorder decoration = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(
      width: 1.2,
      color: Color(0x66F1F1F1),
    ),
  );
  BoxDecoration newDecoration = BoxDecoration(
      border: Border.all(color: Color(0x66F1F1F1)),
      borderRadius: BorderRadius.circular(4));
  final TextStyle styleWhite = GoogleFonts.ubuntu(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: Color(0xffE7E7E7));
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery =
        (sizeQuery.height - widget.appbar.preferredSize.height) -
            MediaQuery.of(context).viewInsets.top;

    return Container(
        child: BlocConsumer<CreateContractBloc, List>(
      listener: (context1, state) {},
      builder: (context1, state) {
        return Container(
            height: heightQuery * 0.1,
            child: Form(
              key: widget.formKey,
              child: TextFormField(
                validator: widget.function,
                style: styleWhite,
                readOnly: true,
                controller: widget.textController,
                scrollPadding: EdgeInsets.only(bottom: 30),
                decoration: InputDecoration(
                  enabledBorder: decoration,
                  counterText: "",
                  counterStyle: TextStyle(height: heightQuery * 0.02),
                  border: decoration,
                  suffixIcon: PopupMenuButton(
                    onSelected: (String text) {
                      var event = widget.eventIndex == 0
                          ? SetPersonStatus(text)
                          : SetPaidStatus(text);
                      context1.read<CreateContractBloc>().add(event);
                      Timer(Duration(milliseconds: 200), () {
                        widget.cubit.read<RadioStatus>().updateIndividual(text);
                        widget.textController.text = context1
                            .read<CreateContractBloc>()
                            .state[widget.eventIndex];
                      });
                      print(widget.textController.text.toString());
                    },
                    offset: Offset(0, 40.0),
                    icon: Icon(
                      BillingIcons.arrow_down_circle,
                      color: Color(0x66F1F1F1),
                    ),
                    itemBuilder: (BuildContext context) {
                      return widget.menu;
                    },
                  ),
                ),
              ),
            ));
      },
    ));
  }
}
