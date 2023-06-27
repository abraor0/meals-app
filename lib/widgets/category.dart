import 'package:flutter/material.dart';

import '../models/ICategory.dart';

class Category extends StatelessWidget {
  final ICategory category;
  const Category(this.category, {super.key});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/category', arguments: {
      'categoryId': category.id,
      'title': category.title,
    });
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
