import 'dart:async';

import 'package:covid/screen/detail/model/detail_model.dart';
import 'package:covid/utils/helper/api_helper.dart';
import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier {
  Future<DetailModel?>? model;

  void getCountryWiseData() {
    ApiHelper helper = ApiHelper();
    model = helper.getCovidAPI();
    notifyListeners();
  }
}
