import 'package:flutter/material.dart';

import './widgets/app_scaffold.dart';
import './widgets/meal.dart';
import 'models/IMeal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<IMeal> availableMeals;

  const CategoryMealsScreen(
    this.availableMeals, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = arguments['categoryId']!;
    final title = arguments['title']!;
    final categoryMeals = availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return AppScaffold(
      title: title,
      child: ListView.builder(
        itemBuilder: (ctx, i) => Meal(categoryMeals[i]),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
