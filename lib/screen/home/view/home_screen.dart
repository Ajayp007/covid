import 'package:covid/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../detail/provider/detail_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: const Text("Covid-19"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: providerW!.model!.responseList!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Text("${providerR!.model!.responseList![index].deathModel!.m1pop}"),
          );
        },
      ),
    );
  }
}
