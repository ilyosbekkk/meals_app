import 'package:flutter/material.dart';
import 'package:meals_udemy/dummy_data.dart';
import 'package:meals_udemy/models/meal.dart';
import 'package:meals_udemy/screens/filters_screen.dart';
import 'package:meals_udemy/screens/meal_detail_screen.dart';
import 'package:meals_udemy/screens/meals_screen.dart';
import 'package:meals_udemy/screens/pagenotfound_screen.dart';
import 'package:meals_udemy/screens/tabs_screen.dart';

import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> currentSelection = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setSelection(Map<String, bool> selection) {
    setState(() {
      currentSelection = selection;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (currentSelection['gluten'] && !element.isGlutenFree) return false;
        if (currentSelection['lactose'] && !element.isLactoseFree) return false;
        if (currentSelection['vegan'] && !element.isVegan) return false;
        if (currentSelection['vegetarian'] && !element.isVegetarian)
          return false;
        return true;
      }).toList();
    });
  }

  void _setFavorite(Meal meal) {
     setState(() {
       _favoriteMeals.add(meal);
     });
  }
  void _undoFavorite(Meal meal){
    setState(() {
      _favoriteMeals.remove(meal);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 255, 240, 1),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)))),
        initialRoute: '/',
        routes: {
          '/': (context) => TabsScreen(_favoriteMeals),
          '/recipes': (context) => IndividualCategory(
                meals: _availableMeals,
              ),
          '/recipes/meal_detail': (context) => MealDetail(_setFavorite, _undoFavorite),
          '/filters': (context) => FiltersScreen(_setSelection, currentSelection)
        },

        //can be useful in some cases:  when your pages are created dynamically
        onGenerateRoute: (settings) => null,
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => PageNotFound()));
  }
}
