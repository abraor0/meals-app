import 'package:flutter/material.dart';

import './dummy_data.dart';
import './widgets/app_scaffold.dart';
import './widgets/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String title;

  const CategoryMealsScreen({
    required this.categoryId,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return AppScaffold(
      child: ListView.builder(
        itemBuilder: (ctx, i) => Meal(categoryMeals[i]),
        itemCount: categoryMeals.length,
      ),
      title: title,
    );
  }
}
