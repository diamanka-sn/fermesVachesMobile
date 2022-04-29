import 'package:ferme_vaches_mobile/home/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KosSam Ferme',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainHomePage(),
    );
  }
}
