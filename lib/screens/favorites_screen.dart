import 'package:flutter/material.dart';
import 'package:meals_udemy/models/meal.dart';
import 'package:meals_udemy/widgets/meal_item.dart';

class Favorites extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const Favorites(this.favoriteMeals);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return widget.favoriteMeals.isEmpty
        ? Center(
            child: Text("No favorites yet."),
          )
        : ListView.builder(
            itemCount: widget.favoriteMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                  title: widget.favoriteMeals[index].title,
                  imaeUrl: widget.favoriteMeals[index].imageUrl,
                  duration: widget.favoriteMeals[index].duration,
                  complexity: widget.favoriteMeals[index].complexity,
                  affordability: widget.favoriteMeals[index].affordability);
            });
  }
}
