import 'package:cocktail_master/models/drink.dart';
import 'package:flutter/material.dart';

class DrinkRecipe extends StatelessWidget {
  final Drink drink;

  DrinkRecipe(this.drink);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drink.strDrink ?? ''),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: drink.strDrinkThumb!,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ingredients',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Text(
                        '${drink.strIngredient1 ?? ""} ${drink.strMeasure1 ?? ""}'),
                    Text(
                        '${drink.strIngredient2 ?? ""} ${drink.strMeasure2 ?? ""}'),
                    Text(
                        '${drink.strIngredient3 ?? ""} ${drink.strMeasure3 ?? ""}'),
                    Text(
                        '${drink.strIngredient4 ?? ""} ${drink.strMeasure4 ?? ""}'),
                    Text(
                        '${drink.strIngredient5 ?? ""} ${drink.strMeasure5 ?? ""}'),
                    Text(
                        '${drink.strIngredient6 ?? ""} ${drink.strMeasure6 ?? ""}'),
                    Text(
                        '${drink.strIngredient7 ?? ""} ${drink.strMeasure7 ?? ""}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
