import 'package:cocktail_master/models/cocktail.dart';
import 'package:cocktail_master/screen/drink_recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
            return DrinkImageButton(drink: drinks[index]);
          },
          itemCount: drinks.length,
        ),
      ),
    );
  }
}

class DrinkImageButton extends StatelessWidget {
  const DrinkImageButton({
    Key? key,
    required this.drink,
  }) : super(key: key);

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          alignment: Alignment.center,
          height: 250,
          child: Text(
            drink.strDrink ?? '',
            style: TextStyle(
              fontSize: 25,
            ),
          ), // button text
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.dstATop,
              ),
              image: drink.strDrinkThumb!,
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return DrinkRecipe(drink);
          }));
        });
  }
}
