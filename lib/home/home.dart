import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/models/contract_model.dart';

import 'package:ibilling/pages/contracts/contracts_main.dart';
import 'package:ibilling/pages/contracts/date_filter.dart';
import 'package:ibilling/pages/history/history_main.dart';
import 'package:ibilling/pages/new/add_contract.dart';
import 'package:ibilling/pages/new/add_invoice.dart';
import 'package:ibilling/pages/new/creating_dialog.dart';
import 'package:ibilling/pages/new/new_main.dart';
import 'package:ibilling/pages/profile/profile_main.dart';
import 'package:ibilling/pages/saved/saved_main.dart';
import 'package:ibilling/pages/single/single_item.dart';
import 'package:ibilling/services/date/date_bloc.dart';
import 'package:ibilling/services/events_cubit.dart';

import '../components/billing_icons_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final data = NavBarindex();
  final _bloc = DateUpdateBloc();
  final cubit = DataProvider();

  int indexNew = 0;

  @override
  Widget build(BuildContext context) {
    int navBarIndex = data.state;

    final sizeQuery = MediaQuery.of(context).size;
    PageController pageController = PageController();
    // data.getPageController(_pageController);
    AppBar appBar = AppBar(
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
        'home.contracts'.tr(),
        textAlign: TextAlign.start,
      ),
    );
    cubit.creatAppBarInfo(appBar.preferredSize.height);
    return Container(
      child: (Scaffold(
        body: PageView(
          allowImplicitScrolling: true,
          pageSnapping: false,
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            PageContracts(
              controller: pageController,
            ),
            PageHistory(),
            PageNew(
              body: AddContract(
                controller: pageController,
              ),
            ),
            PageSaved(),
            PageProfile(),
            BlocConsumer<CurrentSingleItemCubit, ModelContract>(
              listener: (c, state) {},
              builder: (c, state) {
                return SingleItem(
                  controller: pageController,
                );
              },
            ),
            DateFilter(
              controller: pageController,
            ),
            PageNew(
              body: AddInvoice(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: HexColor('#F2F2F2'),
          unselectedItemColor: HexColor('#A6A6A6'),
          unselectedIconTheme: IconThemeData(color: HexColor('#A6A6A6')),
          currentIndex: navBarIndex,
          onTap: (int newIndex) {
            if (newIndex == 2) {
              showDialog(
                  context: context,
                  builder: (BuildContext c) {
                    return CreateDialogNew(
                      ctr: pageController,
                    );
                  });
            } else {
              setState(() {
                pageController.jumpToPage(newIndex);
                // _pageController.animateToPage(newIndex,
                //     duration: Duration(milliseconds: 500),
                //     curve: Curves.easeIn);
                data.updateIndex(newIndex);
              });
            }
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                BillingIcons.document_filled,
              ),
              icon: Icon(
                BillingIcons.document,
              ),
              label: 'home.contracts'.tr(),
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  BillingIcons.clock_filled,
                ),
                icon: Icon(BillingIcons.clock),
                label: 'home.history'.tr()),
            BottomNavigationBarItem(
                activeIcon: Icon(BillingIcons.plus_filled),
                icon: Icon(BillingIcons.plus),
                label: 'home.new'.tr()),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  BillingIcons.bookmark_filled,
                ),
                icon: Icon(
                  BillingIcons.bookmark,
                ),
                label: 'home.saved'.tr()),
            BottomNavigationBarItem(
                activeIcon: Icon(BillingIcons.profile_filled),
                icon: Icon(BillingIcons.profile),
                label: 'home.profile'.tr()),
          ],
        ),
      )),
    );
  }
}
