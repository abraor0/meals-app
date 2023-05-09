import 'package:flutter/material.dart';

import './dummy_data.dart';
import './widgets/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((e) => Category(
                e,
                key: ValueKey(e.id),
              ))
          .toList(),
      padding: EdgeInsets.all(20),
    );
  }
}
