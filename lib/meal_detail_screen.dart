import 'package:flutter/material.dart';

import './models/IMeal.dart';
import './widgets/app_scaffold.dart';
import './widgets/meal_detail.dart';
import './dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final IMeal meal;

  const MealDetailScreen(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: MealDetail(meal),
      title: meal.title,
    );
  }
}
