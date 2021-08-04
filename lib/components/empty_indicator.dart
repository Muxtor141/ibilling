import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';

class EmptyIndicator extends StatelessWidget {
  final IconData icon;
  final String textType;

  const EmptyIndicator({Key? key, required this.icon, required this.textType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    return Container(
      width: sizeQuery.width,
      height: sizeQuery.height * 0.3,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: sizeQuery.width * 0.3,
              ),
              Container(
                width: sizeQuery.width * 0.176,
                height: sizeQuery.height * 0.2,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      icon,
                      size: 120,
                      color: Theme.of(context).cardColor,
                    )),
              ),
            ],
          ),
          Container(
            height: sizeQuery.height * 0.03,
            width: sizeQuery.width,
            child: Text(
              'No $textType are made',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: Theme.of(context).cardColor),
            ),
          ),
        ],
      ),
    );
  }
}
