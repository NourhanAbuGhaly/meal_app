import 'package:flutter/material.dart';
import 'package:meal_app/2.2%20dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/filter_screen.dart';
import 'package:meal_app/screen/meal_detail_screen.dart';
import 'package:meal_app/screen/category_meal_screen.dart';
import 'package:meal_app/screen/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };

  void _setFilter(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _avaloibleMeal = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] == true && meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] == true && meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] == true && meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] == true && meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourit(String mealId) {
    final exitindIndex = _FavouritMeal.indexWhere((meal) => meal.id == mealId);

    if (exitindIndex >= 0) {
      setState(() {
        _FavouritMeal.removeAt(exitindIndex);
      });
    } else {
      _FavouritMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }

  List<Meal> _avaloibleMeal = DUMMY_MEALS;
  List<Meal> _FavouritMeal = [];

  bool isMealFavorit(String id) {
    return _FavouritMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.pink,
          canvasColor: Color.fromRGBO(255, 254, 229, 0.0),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
//             titleLarge: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed")
// ,            titleMedium: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed")
//              , titleSmall: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed")
              ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber)),
      //home: CategoryScreen(),
      routes: {
        '/': (context) => TabsScreen(_FavouritMeal),
        CategoryMealScreen.id: (context) => CategoryMealScreen(_avaloibleMeal),
        MealDetailScreen.id: (context) => MealDetailScreen(_toggleFavourit,isMealFavorit),
        FilterScreen.id: (context) =>
            FilterScreen(_setFilter as Function, _filters)
      },
    );
  }
}
