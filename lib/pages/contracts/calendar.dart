import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/components/billing_icons_icons.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now();
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

  ScrollController controller = ScrollController();

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

  List<String> listOfDays = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        )),
                    IconButton(
                        onPressed: () {},
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
          Container(
            height: sizeQuery.height * 0.083,
            width: sizeQuery.width * 0.95,
            child: ListView.separated(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        selectedDate =
                            DateTime.now().add(Duration(days: index));
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: currentIndex == index
                              ? HexColor('#00A795')
                              : Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(6)),
                      height: sizeQuery.height * 0.083,
                      width: sizeQuery.width * 0.1226,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              listOfDays[DateTime.now()
                                          .add(Duration(days: index))
                                          .weekday -
                                      1]
                                  .toString(),
                              style: currentIndex == index ? styleWhite : style,
                            ),
                            SizedBox(
                              height: sizeQuery.height * 0.005,
                            ),
                            Text(
                              DateTime.now()
                                  .add(Duration(days: index))
                                  .day
                                  .toString(),
                              style: currentIndex == index ? styleWhite : style,
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
                itemCount: 365),
          )
        ],
      ),
    );
  }
}
