import "package:flutter/material.dart";
import "package:meal_app/2.2%20dummy_data.dart";
import "package:meal_app/screen/category_item.dart";

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  //to convert the list of object to list to widget we use map
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(5),
        children: DUMMY_CATEGORIES
            .map((catCetory) => CategoryItem(
                id: catCetory.id, title: catCetory.title, color: catCetory.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
