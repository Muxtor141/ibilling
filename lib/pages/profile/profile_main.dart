import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/bloc/data_bloc.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/pages/profile/dialog.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({Key? key}) : super(key: key);

  @override
  _PageProfileState createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  final TextStyle style = GoogleFonts.ubuntu(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: HexColor('#E7E7E7'));
  final TextStyle styleGrey = GoogleFonts.ubuntu(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: HexColor('#999999'));

  @override
  Widget build(BuildContext context) {
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state -
        MediaQuery.of(context).viewInsets.top;

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: sizeQuery.width * 0.044, right: sizeQuery.width * 0.044),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).cardColor),
            margin: EdgeInsets.only(
                left: sizeQuery.width * 0.032,
                right: sizeQuery.width * 0.032,
                top: heightQuery * 0.0245),
            height: heightQuery * 0.232,
            width: sizeQuery.width * 0.9156,
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: sizeQuery.height * 0.049,
                        width: sizeQuery.width * 0.1,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            BillingIcons.person_circle,
                            size: 44,
                            color: HexColor('#00A795'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: sizeQuery.width * 0.05426,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: heightQuery * 0.02,
                          ),
                          Text('Otabek Abdusamatov',
                              style: GoogleFonts.poppins(
                                  color: HexColor('#00A795'),
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16)),
                          Text(
                            'Graphic designer - IQ Education',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFFE7E7E7),
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: heightQuery * 0.0295,
                ),
                Container(
                  width: sizeQuery.width,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(text: "Date of birth:  ", style: style),
                    TextSpan(text: "16.09.2021", style: styleGrey),
                  ])),
                ),
                SizedBox(
                  height: heightQuery * 0.0147,
                ),
                Container(
                  width: sizeQuery.width,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(text: "Phone Number:  ", style: style),
                    TextSpan(text: "+99894 563 83 01", style: styleGrey),
                  ])),
                ),
                SizedBox(
                  height: heightQuery * 0.0147,
                ),
                Container(
                  width: sizeQuery.width,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(text: "E-mail:  ", style: style),
                    TextSpan(
                        text: "verylonggmailnamehere@gmail.com",
                        style: styleGrey),
                  ])),
                ),
              ],
            ),
          ),
          SizedBox(
            height: heightQuery * 0.0147,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).cardColor),
            margin: EdgeInsets.only(
                left: sizeQuery.width * 0.032,
                right: sizeQuery.width * 0.032,
                top: heightQuery * 0.0245),
            height: heightQuery * 0.0539,
            width: sizeQuery.width * 0.9156,
            child: Container(
              margin: EdgeInsets.only(
                left: sizeQuery.width * 0.032,
                right: sizeQuery.width * 0.032,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'English(USA)',
                    style: style,
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (c) {
                              return LanguageDialog();
                            });
                      },
                      icon: Icon(BillingIcons.language_us))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
