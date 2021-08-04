import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/bloc/data_bloc.dart';
import 'package:ibilling/components/billing_icons_icons.dart';

class LanguageDialog extends StatefulWidget {
  LanguageDialog({Key? key}) : super(key: key);

  @override
  _LanguageDialogState createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  int radioindex = 0;

  changeIndex(int? number) {
    setState(() {
      radioindex = number!;
    });
  }

  final style = GoogleFonts.ubuntu(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      color: HexColor('#E7E7E7'));

  @override
  Widget build(BuildContext context) {
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
                      'Cancel',
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
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Done',
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: sizeQuery.width * 0.4,
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
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: heightQuery * 0.039,
                ),
                Container(
                  width: sizeQuery.width * 0.4,
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
                        "Русский",
                        style: style,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: heightQuery * 0.039,
                ),
                Container(
                  width: sizeQuery.width * 0.4,
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
                      )
                    ],
                  ),
                ),
              ],
            ), //Language Texts End

            Column(
              children: [
                Radio(
                  activeColor: HexColor('#008F7F'),
                  value: 1,
                  groupValue: radioindex,
                  onChanged: changeIndex,
                ),
                Radio(
                  activeColor: HexColor('#008F7F'),
                  value: 2,
                  groupValue: radioindex,
                  onChanged: changeIndex,
                ),
                Radio(
                  activeColor: HexColor('#008F7F'),
                  value: 3,
                  groupValue: radioindex,
                  onChanged: changeIndex,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
