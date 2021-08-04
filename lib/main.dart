import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/home/home.dart';
import 'package:ibilling/pages/contracts/date_filter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      assetLoader: RootBundleAssetLoader(),
      child: MyApp(),
      fallbackLocale: Locale('uz', 'UZ'),
      supportedLocales: [
        Locale('uz', 'UZ'),
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations'));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      routes: {
        "filter": (context) => DateFilter(),
      },
      title: 'iBilling Demo',
      theme: ThemeData(
        textTheme: TextTheme(),
        scaffoldBackgroundColor: HexColor('#000000'), //black
        backgroundColor: HexColor('#1E1E20'), //darker
        cardColor: HexColor('#2A2A2D'), //dark
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: HexColor('#141416'), //darkest
        ),
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Home(),
      ),
    );
  }
}
