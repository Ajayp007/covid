import 'dart:async';

import 'package:covid/screen/home/model/home_model.dart';
import 'package:covid/utils/helper/api_helper.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  Future<HomeModel?>? model;

  void getCountryApi() {
    ApiHelper helper = ApiHelper();
    model = helper.getCountryAPI();

    notifyListeners();
  }
}
