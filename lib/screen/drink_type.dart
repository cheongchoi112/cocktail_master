import 'dart:convert';

import 'package:cocktail_master/models/drink.dart';
import 'package:cocktail_master/services/drink_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'drink_list.dart';

class DrinkType extends StatefulWidget {
  DrinkType({required this.title});

  final String title;

  @override
  _DrinkTypeState createState() => _DrinkTypeState();
}

class _DrinkTypeState extends State<DrinkType> {
  var margarita;
  var martini;
  var mojito;

  @override
  void initState() {
    EasyLoading.instance..userInteractions = false;
    EasyLoading.show(status: 'loading...');

    getDrinks("margarita").then((value) {
      List<dynamic> margaritaMap = jsonDecode(value)['drinks'];

      margarita = List<Drink>.from(margaritaMap.map((value) {
        return Drink.fromJson(value);
      }));
    });

    getDrinks("martini").then((value) {
      List<dynamic> martiniMap = jsonDecode(value)['drinks'];

      martini = List<Drink>.from(martiniMap.map((value) {
        return Drink.fromJson(value);
      }));
    });

    getDrinks("mojito").then((value) {
      List<dynamic> mojitoMap = jsonDecode(value)['drinks'];

      mojito = List<Drink>.from(mojitoMap.map((value) {
        return Drink.fromJson(value);
      }));
    }).whenComplete(() => {EasyLoading.dismiss()});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void buttonOnClick(drinks, drinkType) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return DrinkList(drinks, drinkType);
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
}
