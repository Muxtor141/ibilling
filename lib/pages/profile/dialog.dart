import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/services/events_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDialog extends StatefulWidget {
  final BuildContext blocContext;
  final Locale state;
  LanguageDialog({Key? key, required this.blocContext, required this.state})
      : super(key: key);

  @override
  _LanguageDialogState createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  Locale radioindex = Locale("en", "US");
  final style = GoogleFonts.ubuntu(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      color: HexColor('#E7E7E7'));

  @override
  Widget build(BuildContext context) {
  
    changeLocale(Locale? locale) {
      setState(() {
        radioindex = locale!;
      });
     
   
    }

    final sizeQuery = MediaQuery.of(context).size;
    final cubitData = DataProvider();
    final heightQuery = sizeQuery.height -
        cubitData.state +
        MediaQuery.of(context).viewInsets.top;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        'Choose a Language',
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
      ),
      backgroundColor: Theme.of(context).cardColor,
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: sizeQuery.width * 0.32,
                  height: sizeQuery.height * 0.045,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: HexColor('#4D008F7F'),
                    onPressed: () {},
                    child: Text(
                      'contractItem.cancel'.tr(),
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: HexColor('#008F7F')),
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeQuery.width * 0.053,
                ),
                SizedBox(
                  height: sizeQuery.height * 0.045,
                  width: sizeQuery.width * 0.32,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: HexColor('#008F7F'),
                    onPressed: () {
                      widget.blocContext
                          .read<LanguageChangerCubit>()
                          .updateLanguage(radioindex, context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'contractItem.done'.tr(),
                      style: style,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heightQuery * 0.02,
            )
          ],
        )
      ],
      content: Container(
        width: sizeQuery.width * 0.87,
        height: heightQuery * 0.19,
        child: Column(
          children: [
            Container(
              height: heightQuery * 0.0294,
              width: sizeQuery.width * 0.87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/icons/lan_uz.png',
                      width: sizeQuery.width * 0.064,
                      height: heightQuery * 0.029,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: sizeQuery.width * 0.032),
                  Text(
                    "O'zbek(Lotin)",
                    style: style,
                  ),
                  Spacer(),
                  Radio(
                    activeColor: HexColor('#008F7F'),
                    value: Locale('uz', "UZ"),
                    groupValue: radioindex,
                    onChanged: changeLocale,
                  )
                ],
              ),
            ),
            SizedBox(
              height: heightQuery * 0.039,
            ),
            Container(
              height: heightQuery * 0.0294,
              width: sizeQuery.width * 0.87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'assets/icons/lan_rus.png',
                      width: sizeQuery.width * 0.064,
                      height: heightQuery * 0.029,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: sizeQuery.width * 0.032),
                  Text(
                    "??????????????",
                    style: style,
                  ),
                  Spacer(),
                  Radio(
                    activeColor: HexColor('#008F7F'),
                    value: Locale('ru', "RU"),
                    groupValue: radioindex,
                    onChanged: changeLocale,
                  )
                ],
              ),
            ),
            SizedBox(
              height: heightQuery * 0.039,
            ),
            Container(
              height: heightQuery * 0.0294,
              width: sizeQuery.width * 0.87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'assets/icons/lan_eng.png',
                      width: sizeQuery.width * 0.064,
                      height: heightQuery * 0.029,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: sizeQuery.width * 0.032),
                  Text(
                    "English(USA)",
                    style: style,
                  ),
                  Spacer(),
                  Radio(
                    activeColor: HexColor('#008F7F'),
                    value: Locale('en', "US"),
                    groupValue: radioindex,
                    onChanged: changeLocale,
                  )
                ],
              ),
            ),
          ],
        ), //Language Texts End
      ),
    );
  }
}
