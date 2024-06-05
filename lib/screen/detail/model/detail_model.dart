class DetailModel {
  List<ResponseModel>? responseList = [];

  DetailModel({this.responseList});

  factory DetailModel.mapToModel(Map m1) {
    List l1 = m1['response'];
    return DetailModel(
      responseList: l1
          .map(
            (e) => ResponseModel.mapToModel(e),
          )
          .toList(),
    );
  }
}

class ResponseModel {
  String? continent, day, time, country;
  int? population;

  TestModel? testModel;
  DeathModel? deathModel;
  CaseModel? caseModel;

  ResponseModel(
      {this.continent,
      this.day,
      this.country,
      this.time,
      this.population,
      this.testModel,
      this.deathModel,
      this.caseModel});

  factory ResponseModel.mapToModel(Map m1) {
    return ResponseModel(
      country: m1['country'],
      continent: m1['continent'],
      day: m1['day'],
      population: m1['population'],
      time: m1['time'],
      caseModel: CaseModel.mapToModel(m1['cases']),
      deathModel: DeathModel.mapToModel(m1['deaths']),
      testModel: TestModel.mapToModel(m1['tests']),
    );
  }
}

class CaseModel {
  String? newCase, m1pop;
  int? active, recovered, total;

  CaseModel(
      {this.newCase, this.m1pop, this.active, this.recovered, this.total});

  factory CaseModel.mapToModel(Map m1) {
    return CaseModel(
        total: m1['total'],
        m1pop: m1['1M_pop'],
        newCase: m1['new'],
        active: m1['active'],
        recovered: m1['recovered']);
  }
}

class DeathModel {
  dynamic newDeath;
  String? m1pop;
  int? total;

  DeathModel({this.newDeath, this.m1pop, this.total});

  factory DeathModel.mapToModel(Map m1) {
    return DeathModel(
        total: m1['total'], m1pop: m1['1M_pop'], newDeath: m1['new']);
  }
}

class TestModel {
  String? m1pop;
  int? total;

  TestModel({this.m1pop, this.total});

  factory TestModel.mapToModel(Map m1) {
    return TestModel(total: m1['total'], m1pop: m1['1M_pop']);
  }
}
