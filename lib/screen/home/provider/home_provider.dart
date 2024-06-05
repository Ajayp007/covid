import 'package:covid/screen/home/model/home_model.dart';
import 'package:covid/utils/helper/api_helper.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  HomeModel? model;

  Future<void> getCountryApi() async {
    ApiHelper helper = ApiHelper();
    model = await helper.getCountryAPI();

    notifyListeners();


  }
}
