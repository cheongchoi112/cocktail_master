import 'package:cocktail_master/screen/drink_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String appName = 'Margarita Master';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: DrinkType(title: appName),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}
