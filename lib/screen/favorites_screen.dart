import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'meal_item.dart';
class FavoritesScreen extends StatelessWidget {
   FavoritesScreen(this.favouritMeals);
 final List<Meal> favouritMeals;
  @override
  Widget build(BuildContext context) {
    if (favouritMeals.isEmpty)
      return Container(
        child: Text("You have no favorites yet - start adding some"),
      );

    else
      return  ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id:favouritMeals[index].id,
            ImageUrl: favouritMeals[index].imageUrl,
            title: favouritMeals[index].title,
            duration: favouritMeals[index].duration,
            complexity: favouritMeals[index].complexity,
            affordability: favouritMeals[index].affordability,
           );
        },
        itemCount: favouritMeals.length,
      );

  }
}
