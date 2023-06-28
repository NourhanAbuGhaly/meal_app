import 'package:flutter/material.dart';
import 'package:meal_app/screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String text, IconData icon, Function() tapHander) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: "RobotoCondensed",
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHander,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              " Cooking Up!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Mail", Icons.restaurant, () {Navigator.of(context).pushNamed("/");}),
          buildListTile("Filter", Icons.settings, () {Navigator.of(context).pushNamed(FilterScreen.id);}),
        ],
      ),
    );
  }
}
