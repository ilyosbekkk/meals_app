import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_udemy/models/meal.dart';
import 'package:meals_udemy/dummy_data.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MealDetail extends StatefulWidget {
  final Function setfavorite, undoFavorite;

  const MealDetail(this.setfavorite, this.undoFavorite);

  @override
  _MealDetailState createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  @override
  Widget build(BuildContext context) {
    final meals =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.title == meals['title']);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          print(constraints.maxHeight);
          return Column(
            children: [
              networkImage(selectedMeal, constraints),
              Container(
                child: Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ingredientItem(context, selectedMeal, constraints),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Steps",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              preparationSteps(context, selectedMeal, constraints),
            ],
          );
        },
      ),

       floatingActionButton: IconButton(
        icon: Icon(
            selectedMeal.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
            size: 50
        ),
        onPressed: () {
          if (selectedMeal.isFavorite)
            setState(() {
              selectedMeal.isFavorite = false;
              widget.undoFavorite(selectedMeal);
            });
          else {
            setState(() {
              selectedMeal.isFavorite = true;
              widget.setfavorite(selectedMeal);
            });
          }
        },
      ),
    );
  }

  Widget ingredientItem(
      BuildContext context, Meal selectedMeal, BoxConstraints constrainedBox) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: constrainedBox.maxHeight * 0.25,
      width: constrainedBox.maxWidth * 0.8,
      child: ListView.builder(
          itemCount: selectedMeal.ingredients.length,
          itemBuilder: (context, index) {
            return Card(
              color: Theme.of(context).accentColor,
              child: AutoSizeText(
                selectedMeal.ingredients[index],
              ),
            );
          }),
    );
  }

  Widget networkImage(Meal selectedMeal, BoxConstraints constraints) {

    return Container(
        height: constraints.maxHeight*0.3,
        width: double.infinity,
        child: Image.network(selectedMeal.imageUrl));
  }

  Widget preparationSteps(
      BuildContext context, Meal selectedMeal, BoxConstraints constraints) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: constraints.maxHeight * 0.3,
      width: constraints.maxWidth * 0.8,
      child: ListView.builder(
          itemCount: selectedMeal.steps.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Text("#${index + 1}")),
                  title: AutoSizeText(
                    "${selectedMeal.steps[index]}",

                  ),
                ),
                Divider()
              ],
            );
          }),
    );
  }
}
