import 'package:covid/screen/detail/view/detail_screen.dart';
import 'package:covid/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> appRoutes ={
  '/':(context) => const HomeScreen(),
  'detail':(context) => const DetailScreen(),
};