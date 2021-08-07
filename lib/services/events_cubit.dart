import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class DataProvider extends Cubit<double> {
  DataProvider() : super(AppBar().preferredSize.height);
  void creatAppBarInfo(double height) => emit(height);
}

class LanguageChanger extends Cubit<Locale> {
  LanguageChanger() : super(Locale("en", "US"));

  void updateLanguage(Locale newLan, BuildContext context) {
    context.setLocale(newLan);
    emit(newLan);
  }
}

class NavBarindex extends Cubit<int> {
  NavBarindex() : super(0);
  void updateIndex(int num) => emit(num);
}
