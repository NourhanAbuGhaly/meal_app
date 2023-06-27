import 'package:flutter/material.dart';
import 'package:meal_app/screen/category_screen.dart';
import 'package:meal_app/screen/meal_detail_screen.dart';
import 'package:meal_app/screen/category_meal_screen.dart';

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
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 0.0),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
//             titleLarge: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed")
// ,            titleMedium: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed")
//              , titleSmall: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed")
              )),
      //home: CategoryScreen(),
      routes: {
        '/': (context) => CategoryScreen(),
        CategoryMealScreen.id: (context) => CategoryMealScreen(),
        MealDetailScreen.id: (context)=>MealDetailScreen(),
      },
    );
  }
}
