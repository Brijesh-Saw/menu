import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("$mealid"),
      ),
      body: Center(
        child: Text("The Meals! - $mealid!"),
      ),
    );
  }
}
