import 'package:flutter/material.dart';

import 'package:meals_udemy/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imaeUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    this.title,
    this.imaeUrl,
    this.duration,
    this.complexity,
    this.affordability,
  });

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, '/recipes/meal_detail',
        arguments: {'title': title}).then((title) {});
  }

  String get affordable {
    if (affordability == Affordability.Affordable)
      return "affordable";
    else if (affordability == Affordability.Pricey)
      return "pricey";
    else
      return "luxurious";
  }

  String get complex {
    if (complexity == Complexity.Challenging)
      return "challenging";
    else if (complexity == Complexity.Hard)
      return "hard";
    else
      return "simple";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          selectMeal(context);
        },
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imaeUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 220,
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time_sharp),
                        Text("${duration} mins")
                      ],
                    ),
                    Row(
                      children: [Icon(Icons.work), Text("$complex")],
                    ),
                    Row(
                      children: [Icon(Icons.attach_money), Text("$affordable")],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
