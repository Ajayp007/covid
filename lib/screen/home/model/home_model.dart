class HomeModel {
  String? get;
  int? results;
  List? countryNameList = [];

  HomeModel({this.get, this.results, this.countryNameList});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
        get: m1['get'],
        results: m1['results'],
        countryNameList: m1['response']);
  }
}
