import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/services/date/date_bloc.dart';
import 'package:ibilling/services/events_cubit.dart';
import 'package:ibilling/services/fetching/list_event.dart';
import 'package:ibilling/services/fetching/networking_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calendar extends StatefulWidget {
  final BuildContext context1;

  const Calendar({Key? key, required this.context1}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int dayDifference = 0;
  var selectedDate1 = "";
  final _bloc = DateUpdateBloc();
  int currentIndex = 0;

  TextStyle style = GoogleFonts.ubuntu(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: HexColor('#D1D1D1'));
  TextStyle styleWhite = GoogleFonts.ubuntu(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: Colors.white);

  ScrollController _scrollController = ScrollController();

  List<String> listOfMonths = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<String> listOfDays = [
    "contracts.weekDays.monday".tr(),
    "contracts.weekDays.tuesday".tr(),
    "contracts.weekDays.wednesday".tr(),
    "contracts.weekDays.thursday".tr(),
    "contracts.weekDays.friday".tr(),
    "contracts.weekDays.saturday".tr(),
    "contracts.weekDays.sunday".tr()
  ];

  getString() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    selectedDate1 = pref.get("startDate").toString() != null
        ? pref.get("startDate").toString()
        : "empty";
  }

  @override
  void initState() {
    // TODO: implement initState
    if (context.read<FetchDataBloc2>().state.isEmpty) {
      context.read<FetchDataBloc2>().add(GetData());
    }

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    // return StreamBuilder(
    //   stream: _bloc.updater,
    //   initialData: _bloc.dateList,
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    var selectedDate = DateTime.now();

    return Container(
      child: BlocConsumer<DateUpdateBloc2, List>(
        listener: (context, state) {},
        builder: (context, data) {
          dayDifference = data[0].difference(data[1]).inDays;
          dayDifference = dayDifference + (dayDifference * -2);

          var snapshotData = data;
          return Container(
            color: Theme.of(context).backgroundColor,
            height: sizeQuery.height * 0.181,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: sizeQuery.width * 0.0426,
                      right: sizeQuery.width * 0.0426),
                  child: Row(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "${listOfMonths[selectedDate.month - 1]},",
                          style: GoogleFonts.ubuntu(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: HexColor('#DADADA')),
                        ),
                        TextSpan(
                          text: selectedDate.year.toString(),
                          style: GoogleFonts.ubuntu(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: HexColor('#DADADA')),
                        ),
                      ])),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (_scrollController.offset != 0.0) {
                                  _scrollController.animateTo(
                                      _scrollController.offset - 20,
                                      duration: Duration(microseconds: 10),
                                      curve: Curves.bounceInOut);
                                }
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 20,
                              )),
                          IconButton(
                              onPressed: () {
                                _scrollController.animateTo(
                                    _scrollController.offset + 20,
                                    duration: Duration(microseconds: 10),
                                    curve: Curves.easeInSine);

                                Timer(
                                    Duration(
                                      microseconds: 200,
                                    ),
                                    () {});
                              },
                              icon: Icon(
                                BillingIcons.arrow_right,
                                color: Colors.white,
                                size: 18,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: sizeQuery.height * 0.01,
                ),
                BlocConsumer<SelectedDateCubit, int>(
                  listener: (context1, numIndex) {},
                  builder: (context1, numIndex) {
                    return Container(
                      height: sizeQuery.height * 0.083,
                      width: sizeQuery.width * 0.95,
                      child: ListView.separated(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                context1
                                    .read<SelectedDateCubit>()
                                    .updateIndex(index);
                                currentIndex = index;
                                selectedDate =
                                    snapshotData[0].add(Duration(days: index));

                                print(selectedDate.toString());
                                context
                                    .read<FetchDataBloc2>()
                                    .add(ContractsDayUpdate(selectedDate));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: numIndex == index
                                        ? Color(0xFF00A795)
                                        : Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(6)),
                                height: sizeQuery.height * 0.083,
                                width: sizeQuery.width * 0.1226,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        listOfDays[snapshotData[0]
                                                    .add(Duration(days: index))
                                                    .weekday -
                                                1]
                                            .toString(),
                                        style: currentIndex == index
                                            ? styleWhite
                                            : style,
                                      ),
                                      SizedBox(
                                        height: sizeQuery.height * 0.005,
                                      ),
                                      Text(
                                        snapshotData[0]
                                            .add(Duration(days: index))
                                            .day
                                            .toString(),
                                        style: currentIndex == index
                                            ? styleWhite
                                            : style,
                                      ),
                                      Container(
                                        height: 10,
                                        width: 20,
                                        child: Divider(
                                          thickness: 2,
                                          endIndent: 1,
                                          indent: 1,
                                          height: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 10);
                          },
                          itemCount: dayDifference),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
    //   },
    // );
  }
}
