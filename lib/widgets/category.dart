import 'package:flutter/material.dart';

import '../category_meals_screen.dart';
import '../models/ICategory.dart';

class Category extends StatelessWidget {
  final ICategory category;
  const Category(this.category, {super.key});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CategoryMealsScreen(
        categoryId: category.id,
        title: category.title,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
              title: Text(
            category.title,
            style: Theme.of(context).primaryTextTheme.titleMedium,
          )),
          child: Container(
            color: category.color,
          ),
        ),
      ),
    );
  }
}
