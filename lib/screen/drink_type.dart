import 'dart:convert';

import 'package:cocktail_master/models/cocktail.dart';
import 'package:cocktail_master/services/drink_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'drink_list.dart';

class ChooseDrinkType extends StatefulWidget {
  ChooseDrinkType({required this.title});

  final String title;

  @override
  _ChooseDrinkTypeState createState() => _ChooseDrinkTypeState();
}

class _ChooseDrinkTypeState extends State<ChooseDrinkType> {
  var margarita;
  var martini;
  var mojito;

  @override
  void initState() {
    EasyLoading.show(status: 'loading...');

    getDrinks("margarita").then((value) {
      List<dynamic> margaritaMap = jsonDecode(value)['drinks'];

      margarita = List<Drink>.from(margaritaMap.map((value) {
        return Drink.fromJson(value);
      }));
    }).whenComplete(() => {EasyLoading.dismiss()});

    getDrinks("martini").then((value) {
      List<dynamic> margaritaMap = jsonDecode(value)['drinks'];

      martini = List<Drink>.from(margaritaMap.map((value) {
        return Drink.fromJson(value);
      }));
    }).whenComplete(() => {EasyLoading.dismiss()});

    getDrinks("Mojito").then((value) {
      List<dynamic> margaritaMap = jsonDecode(value)['drinks'];

      mojito = List<Drink>.from(margaritaMap.map((value) {
        return Drink.fromJson(value);
      }));
    }).whenComplete(() => {EasyLoading.dismiss()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Margarita'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => buttonOnClick(margarita, 'Margarita'),
                child: Text("Margarita"),
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => buttonOnClick(martini, 'Martini'),
                child: Text("Martini"),
                style: ElevatedButton.styleFrom(primary: Colors.amber),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => buttonOnClick(mojito, 'Mojito'),
                child: Text("Mojito"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void buttonOnClick(drinks, drinkType) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return DrinkList(drinks, drinkType);
    }));
  }
}
