import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/services/fetching/networking_bloc.dart';

class RadioFilters extends StatefulWidget {
  const RadioFilters({Key? key}) : super(key: key);

  @override
  _RadioFiltersState createState() => _RadioFiltersState();
}

class _RadioFiltersState extends State<RadioFilters> {
  final _bloc = FetchDataBloc();
  TextStyle style = GoogleFonts.ubuntu(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: Colors.white);
  bool inContract = true;
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          OutlinedButton(
            onPressed: () {
              setState(() {
                inContract = true;
              });
            },
            child: Text(
              'home.contracts'.tr(),
              style: style,
            ),
            style: OutlinedButton.styleFrom(
                backgroundColor: inContract == true
                    ? HexColor('#00A795')
                    : Theme.of(context).scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
          ),
          SizedBox(
            width: sizeQuery.width * 0.02,
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                inContract = false;
              });
            },
            child: Text(
              'contracts.invoiceBt'.tr(),
              style: style,
            ),
            style: OutlinedButton.styleFrom(
                backgroundColor: inContract == false
                    ? HexColor('#00A795')
                    : Theme.of(context).scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
          )
        ],
      ),
    );
  }
}
