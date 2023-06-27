import 'package:flutter/material.dart';

import './models/IMeal.dart';
import './widgets/app_scaffold.dart';
import './widgets/meal_detail.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavoriteMeal;
  final Function isMealFavorited;

  const MealDetailScreen(this.toggleFavoriteMeal, this.isMealFavorited,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as IMeal;

    return AppScaffold(
      title: meal.title,
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isMealFavorited(meal.id) ? Icons.favorite : Icons.favorite_border),
        onPressed: () => toggleFavoriteMeal(meal.id),
      ),
      child: MealDetail(meal, toggleFavoriteMeal, isMealFavorited),
    );
  }
}
