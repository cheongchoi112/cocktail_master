import 'package:cocktail_master/screen/drink_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Margarita Master',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ChooseDrinkType(title: 'Margarita Master'),
      builder: EasyLoading.init(),
    );
  }
}
