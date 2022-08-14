import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management_app/constants/const.dart';
import 'package:restaurant_management_app/widgets/mainpage.dart';
import 'package:pluto_grid/pluto_grid.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Management App',
      theme: ThemeData(
        primarySwatch: Const.maincolor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
       home: Mainpage(),
    );
  }
}

