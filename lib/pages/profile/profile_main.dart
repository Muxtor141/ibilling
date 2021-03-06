import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/pages/profile/dialog.dart';
import 'package:ibilling/services/events_cubit.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({Key? key}) : super(key: key);

  @override
  _PageProfileState createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  String languageText = "English(USA)";
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
  @override
  Widget build(BuildContext context) {
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state -
        MediaQuery.of(context).viewInsets.top;
    var appBar = AppBar(
      backgroundColor: Theme.of(context).cardColor,
      leading: IconButton(
        icon: Image.asset(
          'assets/icons/logo.png',
          width: sizeQuery.width * 0.064,
        ),
        onPressed: () {},
      ),
      title: Row(
        children: [
          Text(
            'profile.profile'.tr(),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: sizeQuery.width * 0.044,
                  right: sizeQuery.width * 0.044),
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
                      TextSpan(
                          text: "${"profile.birth".tr()}:  ", style: style),
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
                      TextSpan(
                          text: "${"profile.phone".tr()}:  ", style: style),
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
                      TextSpan(text: "${"profile.mail".tr()}:  ", style: style),
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
            BlocConsumer<LanguageChangerCubit, Locale>(
              listener: (c, s) {},
              builder: (context1, state1) {
               
                switch (context.locale.toString()) {
                  case "en_US":
                    languageText = "English(USA)";
                    break;
                  case "ru_RU":
                    languageText = "??????????????";
                    break;
                  case "uz_UZ":
                    languageText = "O'zbek(Lotin)";
                }
                return Container(
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
                          languageText,
                          style: style,
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (c) {
                                    return LanguageDialog(
                                      blocContext: context1,
                                      state: state1,
                                    );
                                  });
                            },
                            icon: Icon(BillingIcons.language_us))
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
