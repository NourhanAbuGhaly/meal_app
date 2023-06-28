import 'package:flutter/material.dart';
import 'package:meal_app/screen/filter_screen.dart';
import 'package:meal_app/screen/meal_detail_screen.dart';
import 'package:meal_app/screen/category_meal_screen.dart';
import 'package:meal_app/screen/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

          canvasColor: Color.fromRGBO(255, 254, 229, 0.0),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
//             titleLarge: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed")
// ,            titleMedium: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed")
//              , titleSmall: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed")
              ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber)),
      //home: CategoryScreen(),
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealScreen.id: (context) => CategoryMealScreen(),
        MealDetailScreen.id: (context)=>MealDetailScreen(),
        FilterScreen.id:(context)=> FilterScreen()},
    );
  }
}
