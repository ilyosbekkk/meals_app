import 'package:flutter/material.dart';
import 'package:meals_udemy/dummy_data.dart';
import 'package:meals_udemy/models/meal.dart';
import '../widgets/meal_item.dart';

class IndividualCategory extends StatefulWidget {
  final List<Meal> meals;

  const IndividualCategory({this.meals});

  @override
  _IndividualCategoryState createState() => _IndividualCategoryState();
}

class _IndividualCategoryState extends State<IndividualCategory> {
  @override
  Widget build(BuildContext context) {
    final modalRoutArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = modalRoutArguments['id'];
    final title = modalRoutArguments['title'];
    final filteredMeals =
        widget.meals.where((meal) => meal.categories.contains(id)).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text("$title"),
        ),
        body: ListView.builder(
            itemCount: filteredMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                  title: filteredMeals[index].title,
                  imaeUrl: filteredMeals[index].imageUrl,
                  duration: filteredMeals[index].duration,
                  complexity: filteredMeals[index].complexity,
                  affordability: filteredMeals[index].affordability);
            }));
  }
}
