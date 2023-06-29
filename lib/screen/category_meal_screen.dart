import 'package:flutter/material.dart';
import 'package:meal_app/2.2%20dummy_data.dart';
import 'package:meal_app/screen/meal_item.dart';

import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {

  static const id = "category_meal_screen";

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  void  removemeal(String mealId){
 setState(() {
  displayedMeal.removeWhere((meal) =>meal.id==mealId );
  });
  }
  late String  categoryTitle;
  late List <Meal> displayedMeal;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final Map<String, String> routeArg =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg["id"]!;
    categoryTitle = routeArg["title"]!;
    //ناخد العناصر التي نحقق الشرط
     displayedMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id:displayedMeal[index].id,
              ImageUrl: displayedMeal[index].imageUrl,
              title: displayedMeal[index].title,
              duration: displayedMeal[index].duration,
              complexity: displayedMeal[index].complexity,
              affordability: displayedMeal[index].affordability,
          removeItem:removemeal ,);
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
