import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      children: DUMMY_CATEGORIES
          .map((e) => CategoryItem(e.title, e.color,  e.id))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.height*0.3,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: MediaQuery.of(context).size.width*0.1,
          mainAxisSpacing: MediaQuery.of(context).size.width*0.1),
    );
  }
}
