import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinfra_test/view/home/home.dart';

void main(List<String> args) {
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
    home: HomePage(),);
  }
}