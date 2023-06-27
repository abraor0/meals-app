import 'package:flutter/material.dart';

import 'models/IMeal.dart';
import 'widgets/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<IMeal> availableMeals;

  FavoritesScreen(this.availableMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (availableMeals.isEmpty) {
      return const Text('No favorited meals. Start adding now');
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) => Meal(availableMeals[i]),
        itemCount: availableMeals.length,
      );
    }
  }
}
