import 'package:flutter/material.dart';
import 'package:meal_app/2.2%20dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  static const String id = "MealDetailScreen";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMeal=DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectMeal.imageUrl),
          )
        ],
      ),
    );
  }
}
