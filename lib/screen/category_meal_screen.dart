import 'package:flutter/material.dart';
import 'package:meal_app/2.2%20dummy_data.dart';
import 'package:meal_app/screen/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {

  static const id = "category_meal_screen";

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg["id"]!;
    final categoryTitle = routeArg["title"];
    //ناخد العناصر التي نحقق الشرط
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id:categoryMeals[index].id,
              ImageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
