import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class DataProvider extends Cubit<double> {
  DataProvider() : super(AppBar().preferredSize.height);
  void creatAppBarInfo(double height) => emit(height);
}
