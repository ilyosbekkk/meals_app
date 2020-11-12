import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
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
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icons.restaurant, () {
             Navigator.of(context).pushNamed('/');
          }),
          Divider(),
          buildListTile("Settings", Icons.settings, () {
            Navigator.of(context).pushNamed('/filters');
          }),
        ],
      ),
    );
  }

  Widget buildListTile(String title, IconData iconData, Function function) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
      onTap: function,
    );
  }
}
