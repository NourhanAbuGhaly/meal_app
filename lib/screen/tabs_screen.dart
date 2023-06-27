import 'package:flutter/material.dart';
import 'package:meal_app/screen/category_screen.dart';
import 'package:meal_app/screen/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String,dynamic>> _pages = [
    { 'title': "Category","page": CategoryScreen(),},
    {'title': "Favorites","page": FavoritesScreen()}

  ];
  int _selectPageIndex = 0;

  void _SelectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title'].toString()),
    ),
      body:_pages[_selectPageIndex]['page'] as Widget,

      bottomNavigationBar: BottomNavigationBar(
        onTap: _SelectPage,
        backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
