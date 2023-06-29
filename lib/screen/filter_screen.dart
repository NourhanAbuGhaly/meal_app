import 'package:flutter/material.dart';
import 'package:meal_app/screen/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  static const String id = "FilterScreen";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  Widget buildSwitchListTitle(
      bool value, Function(bool) onChange, String title, String description) {
    return SwitchListTile(
      value: value,
      onChanged: onChange,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filter"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "RobotoCondensed",
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTitle(
                  _isGlutenFree,
                 ( newValue) {
                        setState(() {
                          _isGlutenFree = newValue;
                        });
                      },
                  "Gluten-free",
                  "only include gluten-free meals"),
              buildSwitchListTitle(
                  _isLactoseFree,
                 (bool newValue) {
                        setState(() {
                          _isLactoseFree = newValue;
                        });
                      },
                  "Lactose-free",
                  "only include lactose-free meals"),
              buildSwitchListTitle(
                  _isVegan,
              (bool newValue) {
                        setState(() {
                          _isVegan = newValue;
                        });
                      },
                  "Vegan",
                  "only include vegan meals"),
              buildSwitchListTitle(
                  _isVegetarian,
                 (bool newValue) {
                        setState(() {
                          _isVegetarian = newValue;
                        });
                      },
                  "Vegetarian",
                  "only include vegetarian meals"),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
