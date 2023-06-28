import 'package:flutter/material.dart';
import 'package:meal_app/screen/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  static const String id = "FilterScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filter"),
      ),
      body: Center(
        child: Text("Filter"),
      ),
      drawer: MainDrawer(),
    );
  }
}
