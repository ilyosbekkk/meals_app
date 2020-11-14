import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.title, this.color, this.id);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToIndividualCategoryScreen(context, id, title);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }

  void navigateToIndividualCategoryScreen(
      BuildContext context, String id, String title) {
    Navigator.pushNamed(context, '/recipes',
        arguments: {'id': id, 'title': title});
  }
}
