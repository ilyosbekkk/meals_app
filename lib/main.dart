import 'package:flutter/material.dart';
import 'package:meals_udemy/screens/filters_screen.dart';
import 'package:meals_udemy/screens/meal_detail_screen.dart';
import 'package:meals_udemy/screens/pagenotfound_screen.dart';
import 'package:meals_udemy/screens/tabs_screen.dart';
import 'file:///D:/Flutter%20Projects/meals_udemy/lib/widgets/recipes.dart';

import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          '/': (context) => TabsScreen(),
          '/recipes': (context) => IndividualCategory(),
          '/recipes/meal_detail': (context) => MealDetail(),
          '/filters': (context) => FiltersScreen()
        },

        //can be useful in some cases:  when your pages are created dynamically
        onGenerateRoute: (settings) => null,
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => PageNotFound()));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
