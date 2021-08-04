import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/bloc/data_bloc.dart';
import 'package:ibilling/components/contract_item.dart';
import 'package:ibilling/pages/contracts/radio_filters.dart';
import 'package:ibilling/pages/contracts/calendar.dart';
import 'package:ibilling/pages/contracts/contracts_main.dart';
import 'package:ibilling/pages/contracts/date_filter.dart';
import 'package:ibilling/pages/history/history_main.dart';
import 'package:ibilling/pages/new/new_main.dart';
import 'package:ibilling/pages/profile/profile_main.dart';
import 'package:ibilling/pages/saved/saved_main.dart';
import 'package:ibilling/pages/single/single_item.dart';
import '../components/billing_icons_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navBarIndex = 0;
  PageController _pageController = PageController();
  var text1 = 'hello'.tr();

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final cubit = DataProvider();
    var appBar = AppBar(
      actions: [
        IconButton(
          onPressed: () {
            context.setLocale(Locale('uz', "UZ"));
          },
          icon: Icon(BillingIcons.filter),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30,
          ),
        )
      ],
      backgroundColor: Theme.of(context).cardColor,
      leading: IconButton(
        icon: Image.asset(
          'assets/icons/logo.png',
          width: sizeQuery.width * 0.064,
        ),
        onPressed: () {},
      ),
      title: Text(
        'hello'.tr(),
        textAlign: TextAlign.start,
      ),
    );
    cubit.creatAppBarInfo(appBar.preferredSize.height);

    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return new MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              return Scaffold(
                appBar: appBar,
                body: PageView(
                  allowImplicitScrolling: true,
                  pageSnapping: false,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    PageContracts(),
                    PageHistory(),
                    PageNew(),
                    PageSaved(),
                    PageProfile(),
                    SingleItem(),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: HexColor('#F2F2F2'),
                  unselectedItemColor: HexColor('#A6A6A6'),
                  unselectedIconTheme:
                      IconThemeData(color: HexColor('#A6A6A6')),
                  currentIndex: navBarIndex,
                  onTap: (int newIndex) {
                    setState(() {
                      _pageController.jumpToPage(newIndex);
                      // _pageController.animateToPage(newIndex,
                      //     duration: Duration(milliseconds: 500),
                      //     curve: Curves.easeIn);
                      navBarIndex = newIndex;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        BillingIcons.document_filled,
                      ),
                      icon: Icon(
                        BillingIcons.document,
                      ),
                      label: 'Contracts',
                    ),
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          BillingIcons.clock_filled,
                        ),
                        icon: Icon(BillingIcons.clock),
                        label: 'History'),
                    BottomNavigationBarItem(
                        activeIcon: Icon(BillingIcons.plus_filled),
                        icon: Icon(BillingIcons.plus),
                        label: 'New'),
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          BillingIcons.bookmark_filled,
                        ),
                        icon: Icon(
                          BillingIcons.bookmark,
                        ),
                        label: 'Saved'),
                    BottomNavigationBarItem(
                        activeIcon: Icon(BillingIcons.profile_filled),
                        icon: Icon(BillingIcons.profile),
                        label: 'Profile'),
                  ],
                ),
              );
            });
      },
    );
  }
}
