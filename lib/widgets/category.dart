import 'package:flutter/material.dart';

import '../models/ICategory.dart';

class Category extends StatelessWidget {
  final ICategory category;

  const Category(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        color: category.color,
      ),
      footer: GridTileBar(title: Text(category.title)),
    );
  }
}
