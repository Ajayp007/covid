import 'package:covid/screen/detail/model/detail_model.dart';
import 'package:covid/utils/helper/api_helper.dart';
import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier {
  DetailModel? model;

  Future<void> getCountryWiseData() async {
    ApiHelper helper = ApiHelper();
    model = await helper.getCovidAPI();
    notifyListeners();
  }
}
