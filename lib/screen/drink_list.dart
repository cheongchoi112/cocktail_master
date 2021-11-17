import 'package:cocktail_master/components/image_button.dart';
import 'package:cocktail_master/models/drink.dart';
import 'package:flutter/material.dart';

class DrinkList extends StatelessWidget {
  final String drinkType;
  final List<Drink> drinks;

  DrinkList(this.drinks, this.drinkType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drinkType),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ImageButton(drink: drinks[index]);
          },
          itemCount: drinks.length,
        ),
      ),
    );
  }
}
