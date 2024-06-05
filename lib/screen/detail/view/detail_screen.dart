import 'package:covid/screen/detail/model/detail_model.dart';
import 'package:covid/screen/detail/provider/detail_provider.dart';
import 'package:covid/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailProvider? providerR;
  DetailProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<DetailProvider>().getCountryWiseData();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<DetailProvider>();
    providerW = context.watch<DetailProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid Data"),
      ),
      body: FutureBuilder(
        future: providerW!.model,
        builder: (context, snapshot) {
          DetailModel? model = snapshot.data;
          if (snapshot.hasError) {
            return const Center(child: Text("Something Want To Wrong"));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: model!.responseList!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${model.responseList![index].time}"),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
