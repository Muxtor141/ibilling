import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibilling/bloc/data_bloc.dart';
import 'package:ibilling/components/billing_icons_icons.dart';

class DateFilter extends StatefulWidget {
  const DateFilter({Key? key}) : super(key: key);

  @override
  _DateFilterState createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
  TextStyle styleGrey = GoogleFonts.ubuntu(
      fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFFA6A6A6));
  TextStyle style = GoogleFonts.ubuntu(
      fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFFF2F2F2));

  @override
  Widget build(BuildContext context) {
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state -
        MediaQuery.of(context).viewInsets.top;

    final BoxDecoration box = BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).cardColor);

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: heightQuery * 0.0343,
          ),
          Row(
            children: [
              SizedBox(
                width: sizeQuery.width * 0.037,
              ),
              Text(
                'Status',
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(0xFF999999)),
              ),
            ],
          ),
          SizedBox(
            height: heightQuery * 0.022,
          ),
          Container(
            child: Row(
              children: [
                Checkbox(
                  // title: Text('Paid'),
                  activeColor: Color(0xFFF2F2F2),
                  checkColor: Colors.black,
                  value: true,
                  onChanged: (bool? num) {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: Color(0xFFA6A6A6))),
                ),
                SizedBox(
                  width: sizeQuery.width * 0.027,
                ),
                Text(
                  'Paid',
                  style: style,
                ),
                SizedBox(
                  width: sizeQuery.width * 0.275,
                ),
                Checkbox(
                  // title: Text('Paid'),
                  activeColor: Color(0xFFF2F2F2),
                  checkColor: Colors.black,
                  value: true,
                  onChanged: (bool? num) {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: Color(0xFFA6A6A6))),
                ),
                SizedBox(
                  width: sizeQuery.width * 0.027,
                ),
                Text(
                  'Rejected by IQ',
                  style: styleGrey,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                side: BorderSide(color: Color(0xFFA6A6A6)),
                // title: Text('Paid'),
                activeColor: Color(0xFFF2F2F2),
                checkColor: Colors.red,
                value: false,
                onChanged: (bool? num) {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide(color: Color(0xFFA6A6A6))),
              ),
              SizedBox(
                width: sizeQuery.width * 0.027,
              ),
              Text(
                'In process',
                style: styleGrey,
              ),
              SizedBox(
                width: sizeQuery.width * 0.184,
              ),
              Checkbox(
                // title: Text('Paid'),
                activeColor: Color(0xFFF2F2F2),
                checkColor: Colors.black,
                value: true,
                onChanged: (bool? num) {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide(color: Color(0xFFA6A6A6))),
              ),
              SizedBox(
                width: sizeQuery.width * 0.027,
              ),
              Text(
                'Rejected by Payme',
                style: styleGrey,
              ),
            ],
          ),
          SizedBox(
            width: sizeQuery.width * 0.094,
          ),
          Row(
            children: [
              SizedBox(
                width: sizeQuery.width * 0.037,
              ),
              Text(
                'Date',
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(0xFF999999)),
              ),
            ],
          ),
          SizedBox(
            height: heightQuery * 0.02,
          ),
          Row(children: [
            SizedBox(
              width: sizeQuery.width * 0.037,
            ),
            Container(
              padding: EdgeInsets.only(left: 5, right: 2),
              decoration: box,
              child: Row(
                //startDate start
                children: [
                  Text(
                    '16.02.2021',
                    style: style,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        BillingIcons.calendar,
                        size: 16,
                        color: Color(0xFFDADADA),
                      )),
                ],
              ), //startDate end
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                )),
            Container(
                padding: EdgeInsets.only(left: 5, right: 2),
                decoration: box, //endDate start
                child: Row(
                  children: [
                    Text(
                      '16.02.2021',
                      style: style,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        BillingIcons.calendar,
                        size: 16,
                        color: Color(0xFFDADADA),
                      ),
                    ),
                  ],
                ))
          ])
        ],
      ),
    );
  }
}
