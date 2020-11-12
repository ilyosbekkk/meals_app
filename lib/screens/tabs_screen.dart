import 'package:flutter/material.dart';
import 'package:meals_udemy/screens/favorites_screen.dart';
import 'package:meals_udemy/widgets/main_drawer.dart';
import 'categories_screen.dart';

import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: MainDrawer(),
          appBar: AppBar(
            title: Text("Meals"),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.category), text: "Categories"),
                Tab(icon: Icon(Icons.star), text: "Favorites")
              ],
            ),
          ),
          body: TabBarView(
            children: [CategoriesScreen(), Favorites()],
          ),
        ),
      ),
    );
  }
}
