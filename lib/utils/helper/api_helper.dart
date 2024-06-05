import 'dart:convert';

import 'package:covid/screen/detail/model/detail_model.dart';
import 'package:covid/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<HomeModel?> getCountryAPI() async {
    String countryName = "https://covid-193.p.rapidapi.com/countries";
    var response = await http.get(
      headers: {
        'x-rapidapi-host': 'covid-193.p.rapidapi.com',
        'x-rapidapi-key': 'de46781956mshd1ab4da6df31e9dp18bc36jsn73b1282ccf7a'
      },
      Uri.parse(countryName),
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      HomeModel model = HomeModel.mapToModel(json);

      return model;
    }
    return null;
  }

  Future<DetailModel?> getCovidAPI() async {
    String covidData = "https://covid-193.p.rapidapi.com/history?country=usa";

    var response = await http.get(
      headers: {
        'x-rapidapi-host': 'covid-193.p.rapidapi.com',
        'x-rapidapi-key': 'de46781956mshd1ab4da6df31e9dp18bc36jsn73b1282ccf7a'
      },
      Uri.parse(covidData),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      DetailModel model = DetailModel.mapToModel(json);

      return model;
    }
    return null;
  }
}
