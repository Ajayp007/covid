import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/home_model.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getCountryApi();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid-19"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: providerW!.model,
        builder: (context, snapshot) {
          HomeModel? model = snapshot.data;
          if (snapshot.hasError) {
            return const Text("Something Want To Wrong");
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: model!.countryNameList!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, 'detail');
                    },
                    title: Text("${model.countryNameList![index]}"),
                  ),
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
