import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibilling/components/billing_icons_icons.dart';

class SimpleTextField extends StatefulWidget {
  final AppBar appBar;
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? function;
  final TextEditingController? controller;
  final IconData icon;
  SimpleTextField(
      {Key? key,
      required this.formKey,
      required this.appBar,
      required this.function,
      required this.icon,
      required this.controller})
      : super(key: key);

  @override
  _SimpleTextFieldState createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  OutlineInputBorder decoration = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(
      width: 1,
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
    final heightQuery = sizeQuery.height -
        widget.appBar.preferredSize.height -
        MediaQuery.of(context).viewInsets.top;
    return Container(
      height: heightQuery * 0.09,
      child: Form(
        key: widget.formKey,
        child: TextFormField(
          validator: widget.function,
          style: styleWhite,
          controller: widget.controller,
          decoration: InputDecoration(
              enabledBorder: decoration,
              counterText: "",
              counterStyle: TextStyle(height: heightQuery * 0.06),
              border: decoration,
              suffixIcon: widget.icon != BillingIcons.stroke
                  ? IconButton(
                      icon: Icon(
                        BillingIcons.question_mark,
                        color: Color(0x66F1F1F1),
                      ),
                      onPressed: () {},
                    )
                  : null),
        ),
      ),
    );
  }
}
