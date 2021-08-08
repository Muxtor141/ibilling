import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:ibilling/services/date/date_bloc.dart';
import 'package:ibilling/services/date/date_event.dart';
import 'package:ibilling/services/fetching/networking_bloc.dart';
import 'package:jiffy/jiffy.dart';

class DateFilter extends StatefulWidget {
  final PageController controller;
  const DateFilter({Key? key, required this.controller}) : super(key: key);

  @override
  _DateFilterState createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
  final _bloc = DateUpdateBloc();
  var startDate = DateTime.now();
  var endDate = DateTime.now();
  TextStyle styleGrey = GoogleFonts.ubuntu(
      fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFFA6A6A6));
  TextStyle style = GoogleFonts.ubuntu(
      fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFFF2F2F2));

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final appBar = AppBar(
      title: Row(
        children: [
          SizedBox(
            width: sizeQuery.width * 0.27,
          ),
          Text('Filters'),
        ],
      ),
      backgroundColor: Theme.of(context).cardColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          widget.controller.jumpToPage(0);
        },
      ),
    );

    final heightQuery = sizeQuery.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).viewInsets.top;

    final BoxDecoration box = BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).cardColor);

    var text = "26,12,2021";
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: sizeQuery.width * 0.27,
            ),
            Text('Filters'),
          ],
        ),
        backgroundColor: Theme.of(context).cardColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            widget.controller.jumpToPage(0);
          },
        ),
      ),
      body: BlocConsumer<DateUpdateBloc2, List>(
        listener: (context, state) {},
        builder: (context, list) {
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
                      'home.status'.tr(),
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
                      Container(
                        width: sizeQuery.width * 0.4,
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
                              'filter.paid'.tr(),
                              style: style,
                            ),
                          ],
                        ),
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
                        'filter.rejectIQ'.tr(),
                        style: styleGrey,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: sizeQuery.width * 0.4,
                      child: Row(
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
                            'filter.process'.tr(),
                            style: styleGrey,
                          ),
                        ],
                      ),
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
                      'filter.rejectPayme'.tr(),
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
                      width: sizeQuery.width * 0.047,
                    ),
                    Text(
                      'home.date'.tr(),
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
                StreamBuilder(
                  stream: _bloc.updater,
                  initialData: _bloc.dateList,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Container(
                      child: Row(children: [
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
                                "${list[0].day}.${list[0].month}.${list[0].year}",
                                style: style,
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDatePicker(
                                            confirmText: "oK",
                                            context: context,
                                            builder: (context, widget) {
                                              return DatePickerDialog(
                                                  initialDate: Jiffy().dateTime,
                                                  firstDate:
                                                      Jiffy([2019, 02, 19])
                                                          .dateTime,
                                                  lastDate:
                                                      DateTime(2022, 2, 06));
                                            },
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2017, 2, 06),
                                            lastDate: DateTime(2022, 2, 06))
                                        .then((value) {
                                      startDate = value!;

                                      print('${value.day} PICKER CLOSED');
                                    });
                                  },
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
                                  "${list[1].day}.${list[1].month}.${list[1].year}",
                                  style: style,
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDatePicker(
                                            confirmText: "Ok",
                                            context: context,
                                            builder: (context, widget) {
                                              return DatePickerDialog(
                                                  initialDate: Jiffy().dateTime,
                                                  firstDate:
                                                      Jiffy([2019, 02, 19])
                                                          .dateTime,
                                                  lastDate:
                                                      DateTime(2022, 2, 06));
                                            },
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2017, 2, 06),
                                            lastDate: DateTime(2022, 2, 06))
                                        .then((value) {
                                      endDate = value!;

                                      print('${value.day} PICKER CLOSED');
                                    });
                                  },
                                  icon: Icon(
                                    BillingIcons.calendar,
                                    size: 16,
                                    color: Color(0xFFDADADA),
                                  ),
                                ),
                              ],
                            ))
                      ]),
                    );
                  },
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: sizeQuery.width * 0.45,
                      height: sizeQuery.height * 0.045,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: HexColor('#4D008F7F'),
                        onPressed: () {},
                        child: Text(
                          'filter.cancel'.tr(),
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
                      width: sizeQuery.width * 0.45,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: HexColor('#008F7F'),
                        onPressed: () {
                          context
                              .read<DateUpdateBloc2>()
                              .add(ContractStartDate(startDate));
                          print('$startDate START DATE from calendar');
                          print('$endDate START DATE from calendar');

                          context
                              .read<DateUpdateBloc2>()
                              .add(ContractEndDate(endDate));

                          widget.controller.jumpToPage(0);
                        },
                        child: Text(
                          'filter.apply'.tr(),
                          style: style,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightQuery * 0.0345,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
