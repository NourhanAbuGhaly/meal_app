import 'package:flutter/material.dart';
import 'package:meal_app/screen/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilter;
final Map <String , bool>  currentFilter;
  static const String id = "FilterScreen";

  const FilterScreen(this.saveFilter, this.currentFilter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
     _isGlutenFree = widget.currentFilter['gluten']!;
     _isLactoseFree = widget.currentFilter['lactose']!;
     _isVegan = widget.currentFilter['vegan']!;
     _isVegetarian = widget.currentFilter['vegetarian']!;
    // TODO: implement initState
    super.initState();
  }

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
        actions: [
          IconButton(
            onPressed:(){
              final selectedFilter={
                "gluten": _isGlutenFree,
                "lactose": _isLactoseFree,
                "vegan": _isVegan,
                "vegetarian": _isVegetarian
              };
              widget.saveFilter(selectedFilter);
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
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
              buildSwitchListTitle(_isGlutenFree, (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }, "Gluten-free", "only include gluten-free meals"),
              buildSwitchListTitle(_isLactoseFree, (bool newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              }, "Lactose-free", "only include lactose-free meals"),
              buildSwitchListTitle(_isVegan, (bool newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }, "Vegan", "only include vegan meals"),
              buildSwitchListTitle(_isVegetarian, (bool newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }, "Vegetarian", "only include vegetarian meals"),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
