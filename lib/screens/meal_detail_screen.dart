import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_udemy/models/meal.dart';
import 'package:meals_udemy/dummy_data.dart';

class MealDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.title == title['title']);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              networkImage(selectedMeal),
              Container(
                child: Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ingredientItem(context, selectedMeal),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Steps",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              preparationSteps(context, selectedMeal),
            ],
          ),
        ));
  }

  Widget ingredientItem(BuildContext context, Meal selectedMeal) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      child: ListView.builder(
          itemCount: selectedMeal.ingredients.length,
          itemBuilder: (context, index) {
            print(selectedMeal.title);
            return Card(
              color: Theme.of(context).accentColor,
              child: Text(
                selectedMeal.ingredients[index],
                style: TextStyle(fontSize: 20.0),
              ),
            );
          }),
    );
  }

  Widget networkImage(Meal selectedMeal) {
    return Container(
        height: 300,
        width: double.infinity,
        child: Image.network(selectedMeal.imageUrl));
  }

  Widget preparationSteps(BuildContext context, Meal selectedMeal) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      child: ListView.builder(
          itemCount: selectedMeal.steps.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Text("#${index + 1}")),
                  title: Text(
                    "${selectedMeal.steps[index]}",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Divider()
              ],
            );
          }),
    );
  }
}
