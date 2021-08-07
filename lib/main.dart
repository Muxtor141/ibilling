import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ibilling/home/home.dart';
import 'package:ibilling/services/fetching/networking_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([http.Client])
void main() async {
  SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // test('return', () async {
  //   final client = MockClient();
  //   final function = Network();
  //   Map data = {
  //     "name": "Azizbek Toraev",
  //     "status": "Rejected by Payme",
  //     "amount": "2,500,000 UZS",
  //     "lastInvoice": "№345",
  //     "invoices": "6",
  //     "address": "Boburshox ko'chasi 43-uy,Yunusobod tumani,Toshkent",
  //     "created": "14:28,2 August,2021"
  //   };

  //   when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
  //       .thenAnswer((_) async => http.Response("hello", 200));

  //   expect(await function.fetchData(client), "hello");
  // });

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
      routes: {},
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
        body: MultiBlocProvider(providers: [
          BlocProvider<FetchDataBloc2>(
              create: (BuildContext c) => FetchDataBloc2()),
        ], child: Home()),
      ),
    );
  }
}
