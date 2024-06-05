import 'package:covid/screen/detail/provider/detail_provider.dart';
import 'package:covid/screen/home/provider/home_provider.dart';
import 'package:covid/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: DetailProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: appRoutes,
      ),
    ),
  );
}
