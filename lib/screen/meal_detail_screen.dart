import 'package:flutter/material.dart';
import 'package:meal_app/2.2%20dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String id = "MealDetailScreen";
final Function _toggleFavourit;
  final Function  isMealFavorit ;

  const MealDetailScreen(this._toggleFavourit, this.isMealFavorit);

  Widget buildSectionTitle(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildContext(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        width: 300,
        height: 150,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ingredients"),
            buildContext(ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectMeal.ingredients[index]),
                  ),
                );
              },
              itemCount: selectMeal.ingredients.length,
            )),
            buildSectionTitle("Steps"),
            buildContext(ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(selectMeal.steps[index]),
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                      ),
                    ),
                    const Divider()
                  ],
                );
              },
              itemCount: selectMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorit(mealId)? Icons.star:Icons.star_border),
        onPressed:()=> _toggleFavourit(mealId)
          // the mealId is the return value to the screen mealItem

      ),
    );
  }
}
