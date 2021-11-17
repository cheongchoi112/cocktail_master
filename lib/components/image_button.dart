import 'package:cocktail_master/models/drink.dart';
import 'package:cocktail_master/screen/drink_recipe.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    required this.drink,
  });

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
