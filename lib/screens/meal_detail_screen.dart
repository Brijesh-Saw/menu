import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSelectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

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
        buildSelectionTitle(context, "INGREDIENTS"),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(3),
          height: 200,
          width: 300,
          child: ListView.builder(
            itemBuilder: (ctx, index) => Card(
              color: Theme.of(context).primaryColor,
              child: Container(
                padding: EdgeInsets.all(4),
                child: Text("  ${selectedMeal.ingredients[index]}"),
              ),
            ),
            itemCount: selectedMeal.ingredients.length,
          ),
        ),
        buildSelectionTitle(context, "Steps"),
      ]),
    );
  }
}
