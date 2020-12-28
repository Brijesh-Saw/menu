import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: Column(children: <Widget>[
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(
            selectedMeal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Ingredients',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Container(
          height: 200,
          width: 300,
          child: ListView.builder(
            itemBuilder: (ctx, index) => Card(
              color: Theme.of(context).accentColor,
              child: Text(selectedMeal.ingredients[index]),
            ),
            itemCount: selectedMeal.ingredients.length,
          ),
        ),
        Text("The Meals! - $mealid!"),
      ]),
    );
  }
}
