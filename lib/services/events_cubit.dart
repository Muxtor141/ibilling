import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/models/contract_model.dart';

class DataProvider extends Cubit<double> {
  DataProvider() : super(AppBar().preferredSize.height);
  void creatAppBarInfo(double height) => emit(height);
}

class LanguageChangerCubit extends Cubit<Locale> {
  LanguageChangerCubit() : super(Locale("en", "US"));


  updateIndex(Locale? locale) {
    
    emit(locale!);
  
  }
   updateLanguage(Locale? locale, BuildContext context) {
    context.setLocale(locale!);
    emit(locale);
  }
}

class NavBarindex extends Cubit<int> {
  NavBarindex() : super(0);
  void updateIndex(int num) => emit(num);
}

class SelectedDateIndexCubit extends Cubit<int> {
  SelectedDateIndexCubit() : super(0);
  void updateIndex(int num) => emit(num);
}


class ValidationCubit extends Cubit<bool> {
  ValidationCubit() : super(true);
}

class CurrentSingleItemCubit extends Cubit<ModelContract> {
  CurrentSingleItemCubit()
      : super(
            ModelContract(DateTime.now(), 6, false, "", "", "", "", "", 7, 14));

  void updateSingleItem(ModelContract contract) {
    emit(contract);
  }

  void updateSavedStatus() {
    state.isSaved = !state.isSaved;
    emit(state);
  }
}
